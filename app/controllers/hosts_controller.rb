# app/controllers/hosts_controller.rb
class HostsController < ApplicationController
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  def index
    @hosts = Host.all
  end

  def show; end

  def new
    @host = Host.new
  end

  def edit; end

  def create
    @host = Host.new(host_params)
    if @host.save
      redirect_to @host, notice: "Host created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @host.update(host_params)
      redirect_to @host, notice: "Host updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @host.destroy
    redirect_to hosts_url, notice: "Host deleted."
  end

  private

  def set_host
    @host = Host.find(params[:id])
  end

  def host_params
    params.require(:host).permit(:bio, :organisation, :website, :number)
  end
end
