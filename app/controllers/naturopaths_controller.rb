class NaturopathsController < ApplicationController

  before_filter :authenticate_check
  def index
    @today = Date.today
    @all_naturopath = Naturopath.all.order('service_date ASC')

    @naturopaths = Naturopath.where('service_date = ? ', @today)
  end

  def get_data

    @naturopaths = Naturopath.where('service_date = ? ', params[:date])

    @date = params[:date]
    @naturopaths.each do |n|
      puts n
    end
    respond_to do |format|
      format.js
    end
  end

  def create
    @naturopath = Naturopath.new(naturopaths_param)
    total = @naturopath.amount
    @naturopath.tax = total - (total/1.13)
    @naturopaths = Naturopath.where('service_date = ? ', params[:naturopath][:service_date])
    @date =params[:naturopath][:service_date]
    #redirect_to naturopaths_path
    respond_to do |format|
      if @naturopath.save
        format.html { redirect_to naturopaths_path, notice: 'Post was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @naturopath.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @naturopath = Naturopath.find(params[:id])

    respond_to do |format|
      if @naturopath.update_attributes(naturopaths_param)
        format.html { redirect_to(@naturopath, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@naturopath) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@naturopath) }
      end
    end
  end
  def new
    @naturopath = Naturopath.new
    @date = params[:date]
    respond_to do |format|
      format.js
    end
  end

  private
  def naturopaths_param
    params.require(:naturopath).permit(:receipt_num,:fname,:lname,:cardtype,:deposit_date,:service_date,:amount)
  end
end
