class RegistrationsController < ApplicationController
  before_action :set_registration, only: %i[show edit update destroy]
  before_action :authenticate_participant!, only: [:new, :create]

  def index
    @registrations = Registration.includes(:participant, :event).all
  end

  def show; end

  def new
  @registration = Registration.new
  @registration.participant = current_participant
end


  def edit; end

  # registrations_controller.rb
def create
  @registration = Registration.new(registration_params.merge(status: "Pending"))
  if @registration.save
    redirect_to new_payment_path(registration_id: @registration.id)
  else
    render :new, status: :unprocessable_entity
  end
end



  def update
    if @registration.update(registration_params)
      redirect_to @registration, notice: "Registration was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @registration.destroy
    redirect_to registrations_url, notice: "Registration was successfully destroyed."
  end

  private

  def set_registration
    @registration = Registration.find(params[:id])
  end

  def registration_params
    params.require(:registration).permit(:participant_id, :event_id, :status, :source)
  end
end
