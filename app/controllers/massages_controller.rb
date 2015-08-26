class MassagesController < ApplicationController

  before_filter :authenticate_check
  def index
    @today = Date.today
    @all_massage = Massage.all.order('service_date ASC')

    @massages = Massage.where('service_date = ? ', @today)
  end

  def get_data

    @massages = Massage.where('service_date = ? ', params[:date])

    @date = params[:date]
    @massages.each do |n|
      puts n
    end
    respond_to do |format|
      format.js
    end
  end

  def create
    @massage = Massage.new(massages_param)
    total = @massage.amount
    @massage.tax = total - (total/1.13)
    @massages = Massage.where('service_date = ? ', params[:massage][:service_date])
    @date =params[:massage][:service_date]
    #redirect_to massages_path
    respond_to do |format|
      if @massage.save
        format.html { redirect_to massages_path, notice: 'Post was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @massage.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @massage = Massage.find(params[:id])

    respond_to do |format|
      if @massage.update_attributes(massages_param)
        format.html { redirect_to(@massage, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@massage) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@massage) }
      end
    end
  end
  def new
    @massage = Massage.new
    @date = params[:date]
    respond_to do |format|
      format.js
    end
  end

  private
  def massages_param
    params.require(:massage).permit(:receipt_num,:fname,:lname,:cardtype,:deposit_date,:service_date,:amount)
  end
end
