class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :kana_family_name, :kana_first_name, :phone_number, 
    		                                              addresses_attributes: [:postal_code, :address, :receiver_name]])
    end

    def after_sign_out_path_for(resource_or_scope)
    	root_path
    end

end
