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
    # @person = {
    #    name: "Вася Пупкин",
    #    address: "Тверская, 13",
    #    phone: "525-2343",
    #    twitter: "vasily.pupkin",
    #    facebook: "vasily.pupkin",
    #    odnoklassniki: "vasily.pupkin",
    #    livejournal: "vasily.pupkin"
    #    
    #  }
    redirect_to action: :index unless @person[:name]
    
  end
end