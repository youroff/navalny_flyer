# coding: UTF-8
class MainController < ActionController::Base

  FIELDS = {
    name: "Меня зовут",
    address: "Мой адрес",
    phone: "Мой телефон",
    email: "Email адрес",
    social: "Страница в соцсети"
  }

  def index
    @fields = FIELDS
  end
  
  def flyer
    @person = params[:person]
    @fields = FIELDS
    @if_download = params[:download] == "1"
    redirect_to action: :index unless @person[:name]   
  end
end