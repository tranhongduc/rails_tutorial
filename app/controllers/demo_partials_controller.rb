# frozen_string_literal: true

# Controller responsible for handling actions related to DemoPartials.
class DemoPartialsController < ApplicationController
  def new
    @zone = "Zone New action"
    @date = Date.today
  end

  def edit
    @zone = "Zone Edit action"
    @date = Date.today - 4
  end
end
