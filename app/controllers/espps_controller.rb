class EsppsController < ApplicationController
  def new
    @espp = Espp.new()
  end

  def create
    @espp = Espp.new(params[:espp])
  end
end
