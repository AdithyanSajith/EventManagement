# app/controllers/events_controller.rb
class EventsController < ApplicationController
  before_action :authenticate_host!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorize_host!, only: [:edit, :update, :destroy]

  def index
    @events = current_host ? current_host.events : Event.all
  end

  def show
    @event = current_host.events.find(params[:id])
    @registrations = @event.registrations
    @payments = @event.payments
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_host.events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Event was successfully deleted."
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def authorize_host!
    redirect_to events_path, alert: "Not authorized." unless @event.host == current_host
  end

  def event_params
    params.require(:event).permit(:title, :description, :starttime, :endtime, :venue_id, :genre_id)
  end
end
