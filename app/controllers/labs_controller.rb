class LabsController < ApplicationController
  def index
    @labs = Lab.all
    respond_to do |format|
      format.html
      format.json { render json: @labs.to_json }
    end
  end

  def edit
    @lab = Lab.find(params[:id])
    @lab.build_address unless @lab.address
    # @lab.contacts.build
    # @lab.websites.build
  end

  def new
    @lab = Lab.new
    @lab.build_address
    # @lab.contacts.build
    # @lab.websites.build
  end

  def create
    @lab = Lab.new(params[:lab])
    if @lab.save
      redirect_to root_path, notice: "Lab Created"
    else
      render :new
    end
  end

  def update
    @lab = Lab.find(params[:id])
    if @lab.update_attributes(params[:lab])
      redirect_to root_path, notice: "Lab Updated"
    else
      render :edit
    end
  end

end