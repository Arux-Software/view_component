# frozen_string_literal: true

require "action_view"
require "view_component/base"

module ViewComponent
  include Base
  include RenderMonkeyPatch
end
