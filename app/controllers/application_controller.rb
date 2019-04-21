class ApplicationController < ActionController::Base
	#authenticate_user!はdeviseのメソッド.未ログインはrootパスへ
	before_action :authenticate_user!
	#devise利用する前にconfigure_permitted_parametersが実行
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected#他コントローラからも
#サインアップ時ユーザnameのデータ操作許可
	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  	end
end
