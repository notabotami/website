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
    return "about us"
  end

  def self.es_about
    return "Qui&eacutenes Somos"
  end

  #####

  def self.en_home
    return "home"
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

  def self.en_itin
    return "itin information"
  end

  def self.es_itin
    return "informacci&oacuten de itin"
  end

  #####

  def self.en_questions_and_answers
    return "faq"
  end

  def self.es_questions_and_answers
    return "preguntas/respuestas"
  end

  #####

  def self.en_same_sex_marriage
    return "same sex marriage"
  end

  def self.es_same_sex_marriage
    return "matrimonio del mismo sexo"
  end


  #####

  def self.en_photo_gallery
    return "photo gallery"
  end

  def self.es_photo_gallery
    return "galería de fotos"
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
    return "career opportunities"
  end

  def self.es_employee_application
    return "oportunidad de empleo"

  end

  #####

  def self.en_other_links
    return "other links"
  end

  def self.es_other_links
    return "otros enlaces"

  end

  #####

  def self.en_social
    return "Get Social with Us!"
  end

  def self.es_social
    return "Socializate con Nosotros!"
  end

  #####

  def self.en_members
    return "We are members in good standing of the following associations and institutions"
  end

  def self.es_members
    return "Somos miembros activos de las siguientes Asociasciones e Instituciones:"
  end

  #####

  def self.en_boss
    return "Owner | CEO"
  end

  def self.es_boss
    return "Due&ntildeo | Director Ejecutivo"
  end

  #####

  def self.en_general_manager
    return "Owner | General Manager"
  end

  def self.es_general_manager
    return "Due&ntildea | Gerente General"
  end

  #####

  def self.en_marketing_coordinator_female
    return "Marketing Coordinator"
  end

  def self.es_marketing_coordinator_female
    return "Coordinadora de Marketing"
  end

  #####

  def self.en_tax_preparer_female
    return "Tax Preparer"
  end

  def self.es_tax_preparer_female
    return "Preparadora de Impuestos"
  end

  #####

  def self.en_tax_preparer_male
    return "Tax Preparer"
  end

  def self.es_tax_preparer_male
    return "Preparador de Impuestos"
  end

  #####

  def self.en_admin_assistant
    return "Administrative Assistant"
  end

  def self.es_admin_assistant
    return "Asistente Administrativo"
  end

  #####



end
