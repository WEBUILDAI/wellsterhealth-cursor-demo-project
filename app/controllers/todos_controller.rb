class TodosController < ApplicationController
  before_action :require_authentication
  
  def index
    @todos = Todo.all
  end

  def create
    if params[:todo_text].present?
      todo = Todo.create!(text: params[:todo_text])
      redirect_to todos_path, notice: "Todo added successfully!"
    else
      redirect_to todos_path, alert: "Please enter a todo text!"
    end
  end

  def destroy
    Todo.find(params[:id]).destroy
    redirect_to todos_path, notice: "Todo deleted successfully!"
  end
  
  private
  
  def require_authentication
    unless session[:authenticated]
      redirect_to login_path, alert: "Please log in first!"
    end
  end
end
