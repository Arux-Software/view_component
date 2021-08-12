# frozen_string_literal: true

require "action_view"
require "view_component/base"
require "view_component/render_monkey_patch"

module ViewComponent
  include RenderMonkeyPatch
end
