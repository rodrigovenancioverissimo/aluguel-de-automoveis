module LicensesHelper
  ##
  # Verifica se as combinações de 'modalities' da 'license' estão corretas.
  # Por exemplo 'modalities' 'B' e 'C' ao mesmo tempo não são permitidas
  #
  # @param params
  # @retrun [Boolean]
  def self.license_attributes_check_modalities params
    modality_flag = false
    params[:license_attributes][:modalities_attributes].each do |modality_params|
      modality_name = modality_params[1][:name]
      if modality_name.in?(Modality.names.except('A', 'ACC').keys)
        if modality_flag == false
          modality_flag = true
        else
          return false
        end
      end
    end
    return true
  end
end
