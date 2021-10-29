# frozen_string_literal: true

module ViewComponent
  class Collection
    attr_reader :component

    def render_in(view_context, &block)
      @collection.map do |item|
        component.new(**component_options(item)).render_in(view_context, &block)
      end.join.html_safe # rubocop:disable Rails/OutputSafety
    end

    private

    def initialize(component, object, **options)
      @component = component
      @collection = collection_variable(object || [])
      @options = options
    end

    def collection_variable(object)
      if object.respond_to?(:to_ary)
        object.to_ary
      else
        raise ArgumentError.new(
          "The value of the first argument passed to `with_collection` isn't a valid collection. " \
          "Make sure it responds to `to_ary`."
        )
      end
    end

    def component_options(item)
      item_options = { component.collection_parameter => item }

      @options.merge(item_options)
    end
  end
end
