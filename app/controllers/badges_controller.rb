class BadgesController < ApplicationController
  before_action :load_badge, only: :show

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      BadgesService.new(@badge).submit_to_chainpoint
      redirect_to badge_path(@badge)
    else
      render :new
    end
  end

  private

  def load_badge
    @badge = Badge.find params[:id]
  end

  def badge_params
    params.require(:badge).permit(:uuid, :recipient_name, :issue_date)
  end
end
