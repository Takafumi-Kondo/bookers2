class ApplicationController < ActionController::Base
	#authenticate_user!はdeviseのメソッド.未ログインはrootパスへ
	before_action :authenticate_user!, except: [:top, :about]
	#devise利用する前にconfigure_permitted_parametersが実行
	before_action :configure_permitted_parameters, if: :devise_controller?


	protected#他コントローラからも
#サインアップ時ユーザnameのデータ操作許可
	def configure_permitted_parameters
#デフォでemail受け取ってるのを上書きしてしまうのでupにはemail追記
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    	devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  	end

	def after_sign_in_path_for(resource)
	    user_path(resource) # ログイン後に遷移するpathを設定
	end
	def after_sign_up_path_for(resource)
		user_path(resource)
	end


	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
