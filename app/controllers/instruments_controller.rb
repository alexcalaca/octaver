class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @instruments = Instrument.all.order("created_at desc")
  end
  
  def show
  end
  
  def new
    @instrument = Instrument.new
  end 
  
  def edit
  end
  
  def create
    @instrument = current_user.instrument.new(instrument_params)

    respond_to do |format|
      if @instrument.save
        format.html { redirect_to instrument_url(@instrument), notice: "Instrument was successfully created." }
        format.json { render :show, status: :created, location: @instrument }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @instrument.update(instrument_params)
        format.html { redirect_to instrument_url(@instrument), notice: "Instrument was successfully updated." }
        format.json { render :show, status: :ok, location: @instrument }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @instrument.destroy

    respond_to do |format|
      format.html { redirect_to instruments_url, notice: "Instrument was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private    
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end
    
    def instrument_params
      params.require(:instrument).permit(:brand, :model,
                                          :description, :condition,
                                          :finish, :title, :price, :image )
    end
end
