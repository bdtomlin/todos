class Todo < ActiveRecord::Base
  attr_accessible :description, :owner_email

  def user=(user)
    self.owner_email = user.email
  end
end
