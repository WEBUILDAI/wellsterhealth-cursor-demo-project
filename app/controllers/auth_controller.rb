class AuthController < ApplicationController
  def login
    # Redirect to todos if already authenticated
    if session[:authenticated]
      redirect_to todos_path
    end
  end

  def authenticate
    if params[:password] == "1234"
      session[:authenticated] = true
      redirect_to todos_path, notice: "Successfully logged in!"
    else
      redirect_to login_path, alert: "Invalid password!"
    end
  end

  def logout
    session[:authenticated] = nil
    redirect_to login_path, notice: "Successfully logged out!"
  end
end
