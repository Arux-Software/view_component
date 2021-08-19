# frozen_string_literal: true

module ViewComponent
  class Base < ActionView::Base
    def render_in(view_context, &block)
      return "" unless render?

      @view_context = view_context

      partial = self.class.name.underscore

      attributes = instance_variables.map do |attribute|
        [attribute, instance_variable_get(attribute)]
      end.to_h

      attributes.each do |key, value|
        view_context.instance_variable_set(key, value)
      end

      if block_given?
        view_context.concat(
          render(partial: "components/#{partial}", locals: { content: view_context.capture(&block) })
        )
      else
        render partial: "components/#{partial}"
      end
    end

    # Override to determine whether the ViewComponent should render.
    #
    # @return [Boolean]
    def render?
      true
    end

    # Re-use original view_context if we're not rendering a component.
    #
    # This prevents an exception when rendering a partial inside of a component that has also been rendered outside
    # of the component. This is due to the partials compiled template method existing in the parent `view_context`,
    # and not the component's `view_context`.
    #
    # @private
    def render(options = {}, args = {}, &block)
      if options.is_a? ViewComponent::Base
        super
      else
        view_context.render(options, args, &block)
      end
    end

    private

    attr_reader :view_context
  end
end
