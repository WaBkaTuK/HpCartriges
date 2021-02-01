class TreesController < ApplicationController
  def index
    @cartriges = Cartrige.all
    

  end

  def new
  end

  def show
  end

  def edit
  end

  def cartrige_printers(cartrige_id)
    Printer.where(cartrige_id: "#{cartrige_id}").all
  end
end
