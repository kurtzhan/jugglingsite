class JugglingLabController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:generate_gif]

  def generate_gif
    siteswap = params["fields"]["siteswap"]
    hands    = params["fields"]["hand_movement"]
    filename = SecureRandom.uuid + ".gif"
    ret = `java -cp #{Rails.root}/lib/jugglinglab/JugglingLab.jar jugglinglab.JugglingLab togif 'pattern=#{siteswap};hands=#{hands}' -out #{Rails.root}/public/jugglinglab/#{filename}`
    render :json => {:error_response => ret, :filename => filename}
  end
end
