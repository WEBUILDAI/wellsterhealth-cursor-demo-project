class TodosController < ApplicationController
  before_action :require_authentication
  
  def index
    @todos = session[:todos] || []
    # Debug: let's see what's in the session
    Rails.logger.info "Session todos: #{session[:todos].inspect}"
  end

  def create
    session[:todos] ||= []
    if params[:todo_text].present?
      todo = {
        'id' => Time.now.to_i,
        'text' => params[:todo_text],
        'created_at' => Time.now.strftime("%B %d, %Y at %I:%M %p")
      }
      session[:todos] << todo
      Rails.logger.info "Created todo: #{todo.inspect}"
      Rails.logger.info "Session after create: #{session[:todos].inspect}"
      redirect_to todos_path, notice: "Todo added successfully!"
    else
      redirect_to todos_path, alert: "Please enter a todo text!"
    end
  end

  def destroy
    session[:todos] ||= []
    session[:todos].reject! { |todo| todo['id'] == params[:id].to_i }
    redirect_to todos_path, notice: "Todo deleted successfully!"
  end
  
  private
  
  def require_authentication
    unless session[:authenticated]
      redirect_to login_path, alert: "Please log in first!"
    end
  end
end
