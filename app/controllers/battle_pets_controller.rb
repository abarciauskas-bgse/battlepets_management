class BattlePetsController < ApplicationController
  before_action :set_battle_pet, only: [:show]

  # GET /battle_pets/1
  def show
    render json: @battle_pet
  end

  # POST /battle_pets
  def create   
    @battle_pet = BattlepetBuilder.new(params).battle_pet

    if @battle_pet.save
      render json: @battle_pet, status: :created, location: @battle_pet
    else
      render json: @battle_pet.errors, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_battle_pet
    @battle_pet = BattlePet.where(id: params[:id]).first || BattlePet.where(name: params[:id]).first
  end

  # Only allow a trusted parameter "white list" through.
  def battle_pet_params
    # TODO: FIXME
    params.require(:battle_pet).permit(:name, :traits => {})
  end
end
