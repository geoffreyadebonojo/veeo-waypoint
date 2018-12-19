class DashboardFacade
  def initialize(user)
    @user = user
  end

  def topics
    @user.topics
  end

end
