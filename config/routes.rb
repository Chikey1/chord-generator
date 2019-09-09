# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  post 'generate-chords', to: 'home#generate_chords'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
