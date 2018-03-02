class BarbershopsController < ApplicationController
  def index
    @barbershops = Barbershop.all
  end
end
