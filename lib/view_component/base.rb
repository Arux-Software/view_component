# frozen_string_literal: true

module ViewComponent
  class Base < ActionView::Base
    def render_in(view_context, &block)
      return "" unless render?

      partial = self.class.name.underscore

      attributes = instance_variables.map do |attribute|
        [attribute, instance_variable_get(attribute)]
      end.to_h

      attributes.each do |key, value|
        view_context.instance_variable_set(key, value)
      end

      if block_given?
        view_context.concat(
          view_context.render(partial: "components/#{partial}", locals: { content: view_context.capture(&block) })
        )
      else
        view_context.render partial: "components/#{partial}"
      end
    end

    # Override to determine whether the ViewComponent should render.
    #
    # @return [Boolean]
    def render?
      true
    end
  end
end
