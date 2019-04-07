class GunswapController < ApplicationController
  layout 'gunswap'
  def animator
  end

  def get_patterns
    render :json => PATTERNS
  end
end
