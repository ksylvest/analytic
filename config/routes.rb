# frozen_string_literal: true

Analytic::Engine.routes.draw do
  root to: 'dashboard#show'

  get '/dashboard/(period/:period)', to: 'dashboard#show', as: :dashboard
end
