class TodosController < ApplicationController
  before_action :require_authentication
  
  def index
    @todos = Todo.all
    
    # Filter by status if specified
    if params[:status].present? && params[:status] != 'all'
      @todos = @todos.where(status: params[:status])
    end
    
    # Sort by due date and priority
    @todos = @todos.order(:due_date, :priority)
  end

  def create
    @todo = Todo.new(todo_params)
    
    if @todo.save
      redirect_to todos_path, notice: "Todo added successfully!"
    else
      redirect_to todos_path, alert: "Error: #{@todo.errors.full_messages.join(', ')}"
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
  
  def todo_params
    params.require(:todo).permit(:title, :description, :due_date, :assignee, :priority, :status, :text)
  end
end
