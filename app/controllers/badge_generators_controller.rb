class BadgeGeneratorsController < ApplicationController
  before_action :load_badge

  def update
    if @badge.submit_to_chainpoint
      redirect_back fallback_location: badge_path(@badge),
        notice: 'Badge submitted correctly to Chainpoint'
    else
      redirect_back fallback_location: badge_path(@badge),
        alert: 'There was a problem with your request'
    end
  end

  private

  def load_badge
    @badge = Badge.find params[:id]
  end
end
