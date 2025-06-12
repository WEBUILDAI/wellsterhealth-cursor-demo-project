class AddFieldsToTodos < ActiveRecord::Migration[7.1]
  def change
    add_column :todos, :title, :string
    add_column :todos, :description, :text
    add_column :todos, :due_date, :date
    add_column :todos, :assignee, :string
    add_column :todos, :priority, :integer
    add_column :todos, :status, :integer
  end
end
