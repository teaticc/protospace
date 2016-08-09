module FeatureHelpers
  def login(user)
    login_as user, scope: :user
  end
end
