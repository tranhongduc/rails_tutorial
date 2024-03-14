# frozen_string_literal: true

# Controller responsible for handling actions related to ApplicationController.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
end
