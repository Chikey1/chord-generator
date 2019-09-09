class HomeController < ApplicationController

  def index

  end

  def generate_chords
    data = {
      measures: params[:measures],
      time_signature: params[:time_signature],
      key_signature: params[:key_signature],
      chord_interval: params[:chord_interval],
    }
    # File.open("app/dummy_data/ode_to_joy.json", 'w') do |file|
    #   file.puts data.to_json
    # end
    render :json => {message: "success"}
  end
end
