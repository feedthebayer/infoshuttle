module RouteConstraints::UserConstraint
  def current_user(request)
    User.find_by_id(request.session[:user_id])
  end
end

  class RouteConstraints::UserRequiredConstraint
    include RouteConstraints::UserConstraint

    def matches?(request)
      current_user(request).present?
    end
  end

