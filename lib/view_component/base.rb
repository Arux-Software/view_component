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

    private

    class << self
      # Render a component for each element in a collection ([documentation](/guide/collections)):
      #
      #     render(ProductsComponent.with_collection(@products, foo: :bar))
      #
      # @param collection [Enumerable] A list of items to pass the ViewComponent one at a time.
      # @param args [Arguments] Arguments to pass to the ViewComponent every time.
      def with_collection(collection, **args)
        Collection.new(self, collection, **args)
      end

      # Set the parameter name used when rendering elements of a collection ([documentation](/guide/collections)):
      #
      #     with_collection_parameter :item
      #
      # @param parameter [Symbol] The parameter name used when rendering elements of a collection.
      def with_collection_parameter(parameter)
        @provided_collection_parameter = parameter
      end

      # @private
      def collection_parameter
        if provided_collection_parameter
          provided_collection_parameter
        else
          name && name.demodulize.underscore.chomp("_component").to_sym
        end
      end

      def provided_collection_parameter
        @provided_collection_parameter ||= nil
      end
    end
  end
end
