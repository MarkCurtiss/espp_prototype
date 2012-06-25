class EsppsController < ApplicationController
  def new
    @espp = Espp.new()
  end

  def create
    @espp = Espp.new(params[:espp])

    respond_to do |format|
      if @espp.save
        format.html { redirect_to(@espp, :notice => "Plan created") }
      else
        format.html { render :action => 'new' }
      end
    end
  end

  def show
    @espp = Espp.find(params[:id])

    respond_to do |format|
      format.html
    end
  end
end
