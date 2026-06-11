class ArenaController < ApplicationController
  def show
    @roster = DuelSimulator.roster
    @selected_keys = []
  end

  def forge
    @roster = DuelSimulator.roster
    @selected_keys = []
  end

  def simulate
    fighter_keys = [params[:fighter_a], params[:fighter_b]]
    render json: DuelSimulator.new(selected_keys: fighter_keys).simulate
  end
end
