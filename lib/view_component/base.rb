# frozen_string_literal: true

module ViewComponent
  class Base < ActionView::Base
    def render_in(view_context, &block)
      return "" unless render?

      partial = self.class.name.underscore
      block_content = block ? capture(&block) : nil

      locals = instance_variables.map do |attribute|
        [attribute.to_s.gsub("@", "").to_sym, instance_variable_get(attribute)]
      end.to_h.merge(content: block_content)


      if block_content
        view_context.concat(view_context.render(partial: "components/#{partial}", locals: locals))
      else
        view_context.render partial: "components/#{partial}", locals: locals
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
