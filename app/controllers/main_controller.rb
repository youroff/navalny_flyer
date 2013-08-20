# coding: UTF-8
class MainController < ActionController::Base

  FIELDS = {
    name: "Меня зовут",
    address: "Мой адрес",
    phone: "Мой телефон",
    vkontakte: "Акаунт Вконтакте",
    twitter: "Акаунт в Twitter",
    odnoklassniki: "Акаунт в Одноклассниках",
    facebook: "Акаунт в Facebook",
    livejournal: "ЖЖ"
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