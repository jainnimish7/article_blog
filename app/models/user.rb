class User < ActiveRecord::Base
  rolify
  after_create :assign_role_to_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  has_many :articles
  attr_accessor :role

  private

  def assign_role_to_user
    user = User.last
    user.add_role :"normal_user"
  end
end
