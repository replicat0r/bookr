class MassagesController < ApplicationController
  def index
    @massage = Massage.all
  end

  def show
    
  end

  def create
    @massage = Massage.create(massages_param)

    redirect_to massages_path
  end

  def update
    @massage = Massage.find params[:id]

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
    respond_to do |format|
      format.js
    end
  end

  private
  def massages_param
    params.require(:massage).permit(:fname,:lname,:cardtype,:depost_date,:service_date,:amount)
  end
end