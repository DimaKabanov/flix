# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include AuthConcern

  add_flash_types(:danger)
end
