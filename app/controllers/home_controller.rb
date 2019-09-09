# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def generate_chords
    # File.open("app/dummy_data/ode_to_joy.json", 'w') do |file|
    #   file.puts data.to_json
    # end
    result = ChordGenerator::GenerateService.call(params)
    render json: result
  end
end
