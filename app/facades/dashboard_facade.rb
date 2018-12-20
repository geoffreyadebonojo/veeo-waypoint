class DashboardFacade
  def initialize(user)
    @user = user
  end

  def topics
    @user.topics
  end
  
  def new_topic
   Topic.new
  end
end