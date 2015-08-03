module ApplicationHelper
  def self.current_user
    return @current_user
  end

  def self.current_user=(user)
    @current_user = user
  end

  def self.english
    return @english
  end

  def self.english=(english)
    @english = english
  end

  def self.get_language_tag
    if @english then
      return "en_"
    else
      return "es_"
    end
  end

  #####

  def self.en_login
    return "login"
  end

  def self.es_login
    return "iniciar sesi&oacuten"
  end

  #####

  def self.en_logoff
    return "log off"
  end

  def self.es_logoff
    return "terminar sesi&oacuten"
  end

  #####

  def self.en_about
    return "about"
  end

  def self.es_about
    return "sobre nosotros"
  end

  #####

  def self.en_home
    return "home(inicio)"
  end

  def self.es_home
    return "inicio"
  end

  #####

  def self.en_services
    return "services"
  end

  def self.es_services
    return "servicios"
  end

  #####

  def self.en_my_profile
    return "my profile"
  end

  def self.es_my_profile
    return "mi perfil"
  end

  #####

  def self.en_view_profile
    return "view profile"
  end

  def self.es_view_profile
    return "mira perfil"
  end

  #####

  def self.en_questions_and_answers
    return "questions/answers"
  end

  def self.es_questions_and_answers
    return "preguntas/respuestas"
  end

  #####

  def self.en_privacy
    return "privacy policy"
  end

  def self.es_privacy
    return "politica de privacidad"
  end

  #####

  def self.en_location
    return "location"
  end

  def self.es_location
    return "ubicaci&oacuten"
  end

  #####

  def self.en_contact_us
    return "contact us"
  end

  def self.es_contact_us
    return "contactanos"
  end

  #####

  def self.en_employee_application
    return "apply"
  end

  def self.es_employee_application
    return "aplica"
  end

end
