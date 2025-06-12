class Todo < ApplicationRecord
  # Enums for priority and status
  enum priority: { low: 0, medium: 1, high: 2 }
  enum status: { open: 0, doing: 1, done: 2 }
  
  # Validations
  validates :title, presence: true, length: { maximum: 200 }
  validates :assignee, presence: true
  validates :due_date, presence: true
  validates :priority, presence: true
  validates :status, presence: true
  
  # Set default values
  after_initialize :set_defaults, if: :new_record?
  
  private
  
  def set_defaults
    self.priority ||= 'medium'
    self.status ||= 'open'
  end
end
