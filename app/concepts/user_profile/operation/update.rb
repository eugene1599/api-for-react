class UserProfile::Update < Trailblazer::Operation
  step :model!
  step Contract::Build(constant: UserProfile::Contract::Create)
  step Contract::Validate(key: :user_profile)
  step Contract::Persist()

  def model!(options, current_user: nil, params:, **)
    return false unless current_user

    options['model'] = UserProfile.where(user_id: current_user.id).first_or_initialize
  end
end
