# frozen_string_literal: true

module Analytic
  class DashboardController < ApplicationController
    include Analytic::Trackable

    before_action :analytic_track!, if: -> { request.format.html? }

    # GET /
    def show
      @dashboard = Dashboard.new(period: params[:period])
    end
  end
end
