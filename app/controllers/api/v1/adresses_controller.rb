class Api::V1::AdressesController < ApplicationController
  before_action :set_adress, only: [:show, :update, :destroy]

  # GET /adresses
  def index;end

  # GET /adresses/1
  def show;end

  # POST /adresses
  def create
    user = User.find_by(id: adress_params[:user_id])
    if adress_params[:city].empty? || adress_params[:state].empty? || adress_params[:district].empty? || adress_params[:street].empty? || adress_params[:zip_code].empty? || adress_params[:number].empty?
      render json: { data: "Campos obrigatórios estão vazios." }
      return
    end

    if !user.nil?
      adress = Adress.create!({ city: adress_params[:city], state: adress_params[:state], district: adress_params[:district], street: adress_params[:street], number: adress_params[:number], zip_code: adress_params[:zip_code], complement: adress_params[:complement], reference: adress_params[:reference] })
      if adress
        user.adress_id = adress.id
        user.save
        render json: { data: adress, success: true }
      else
        render json: { data: "Erro ao cadastrar endereço.", success: false }
      end
    else
      render json: { data: "Usuário não existe.", success: false }
    end
  end

  # PATCH/PUT /adresses/1
  def update;end

  # DELETE /adresses/1
  def destroy;end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adress
      @adress = Adress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adress_params
      params.permit(:user_id, :city, :state, :district, :zip_code, :number, :street, :complement, :reference)
    end
end
