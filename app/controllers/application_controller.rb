class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    # 如果@current_user = nil，才去db取得user物件 (if current_user is true 表示目前是在登入的狀態)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in? # false表示沒有user物件(沒有登入)
    !!current_user # user物件存在，回傳true
  end

  # 確認登入狀態，未登入就導頁到首頁
  def require_user
    if !logged_in?
      flash[:danger] = "you must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
