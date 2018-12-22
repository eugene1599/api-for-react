class UserProfile::Show < Trailblazer::Operation
  step :model!

  def model!(options, current_user:, **)
    options['model'] = UserProfile.find_by(user_id: current_user.id)
  end
end
