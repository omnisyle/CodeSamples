class Module < ActiveRecord::Base
  # soft delete
  acts_as_paranoid

  MODULE_NAME_REGEX = /\A[a-z][a-z0-9\-]*[a-z0-9]\Z/

  belongs_to :user
  has_and_belongs_to_many :users, join_table: :collaborators
  has_many :collaborators

  before_destroy :notify_admin_module_destroy

  #namespace module with user id
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { scope: :user_id, message: 'module exists' }
  validates_format_of :name, :with => MODULE_NAME_REGEX
end