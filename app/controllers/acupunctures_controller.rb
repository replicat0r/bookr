class AcupuncturesController < ApplicationController

  before_filter :authenticate_check
  def index
    @today = Date.today
    @data = Acupuncture.all.order('service_date ASC')

    @acupunctures = Acupuncture.where('service_date = ? ', @today)
  end

  def get_data

    @acupunctures = Acupuncture.where('service_date = ? ', params[:date])

    @date = params[:date]
    @acupunctures.each do |n|
      puts n
    end
    respond_to do |format|
      format.js
    end
  end

  def create
    @acupuncture = Acupuncture.new(acupunctures_param)
    total = @acupuncture.amount
    @acupuncture.tax = total - (total/1.13)
    @acupunctures = Acupuncture.where('service_date = ? ', params[:acupuncture][:service_date])
    @date =params[:acupuncture][:service_date]
    #redirect_to massages_path
    respond_to do |format|
      if @acupuncture.save
        format.html { redirect_to acupunctures_path, notice: 'Post was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @acupuncture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @acupuncture = Acupuncture.find(params[:id])

    respond_to do |format|
      if @acupuncture.update_attributes(acupunctures_param)
        format.html { redirect_to(@acupuncture, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@acupuncture) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@acupuncture) }
      end
    end
  end
  def new
    @acupuncture = Acupuncture.new
    @date = params[:date]
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @acupuncture = Acupuncture.find(params[:id])
    @acupunctures = Acupuncture.where('service_date = ? ', @acupuncture.service_date)
    @date = @acupuncture.service_date


    @acupuncture.destroy!
    respond_to do |format|
      format.js
    end

  end

  private
  def acupunctures_param
    params.require(:acupuncture).permit(:receipt_num,:fname,:lname,:cardtype,:deposit_date,:service_date,:amount)
  end
end
