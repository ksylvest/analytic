# frozen_string_literal: true

Rails.application.routes.draw do
  mount Analytic::Engine, at: '/analytic'
end
