# frozen_string_literal: true

module Analytic
  class DashboardController < ApplicationController
    include Analytic::Trackable
    before_action { analytic_track! }

    # GET /
    def show
      @dashboard = Dashboard.new(period: params[:period])
    end
  end
end
