module PhonesHelper
  ##
  # Verifica se existe mais de um telefone preferencial para uma pessoa
  #
  # @param params
  # @return {Boolean}
  def self.check_phones_attributes params
    preferentialFlag = false
    params[:phones_attributes].each do |phoneParams|
      phoneParams = phoneParams[1]
      if phoneParams[:_destroy].in?(['false', '0', nil]) && phoneParams[:preferential].in?([true, 'true'])
        if preferentialFlag == false
          preferentialFlag = true
        else
          return false
        end
      end
    end
    return true
  end
end
