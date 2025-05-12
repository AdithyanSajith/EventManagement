class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]

  def index
  @payments = Payment.all
  @payment = Payment.new  # Add this line
end


def show
  @payment = Payment.find(params[:id])
end


  def new
    @payment = Payment.new
  end

  def edit; end

  # payments_controller.rb
def create
  @payment = Payment.new(payment_params)
  if @payment.save
    # issue ticket
    Ticket.create!(
      registration_id: @payment.registration_id,
      ticket_code: SecureRandom.hex(8),
      issued_at: Time.current
    )

    # update registration to 'Confirmed'
    @payment.registration.update(status: "Confirmed")

    redirect_to @payment.registration, notice: "Payment successful. Ticket issued."
  else
    render :new, status: :unprocessable_entity
  end
end

  def update
    if @payment.update(payment_params)
      redirect_to @payment, notice: "Payment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @payment.destroy
    redirect_to payments_path, notice: "Payment was successfully deleted."
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:registration_id, :amount, :status, :method)
  end
end
