class TodosController < ApplicationController
  before_action :require_authentication
  before_action :set_todo, only: [:edit, :update, :destroy]
  
  def index
    @todos = Todo.all
    @todo = Todo.new
    @editing_todo = params[:edit_id] ? Todo.find(params[:edit_id]) : nil
    
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
      @todos = Todo.all
      @editing_todo = nil
      render :index, alert: "Error: #{@todo.errors.full_messages.join(', ')}"
    end
  end

  def edit
    redirect_to todos_path(edit_id: @todo.id)
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path, notice: "Todo updated successfully!"
    else
      redirect_to todos_path(edit_id: @todo.id), alert: "Error: #{@todo.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path, notice: "Todo deleted successfully!"
  end
  
  private
  
  def require_authentication
    unless session[:authenticated]
      redirect_to login_path, alert: "Please log in first!"
    end
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
  
  def todo_params
    params.require(:todo).permit(:title, :description, :due_date, :assignee, :priority, :status, :text)
  end
end
