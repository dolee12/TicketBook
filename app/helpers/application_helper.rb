module ApplicationHelper
  def self.get_current_user
    @user = User.find(1)
  end
end
