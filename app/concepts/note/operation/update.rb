class Note::Update < Trailblazer::Operation
  self['contract.default.class'] = Note::Contract::Create

  step :model!
  step Contract::Build()
  step Contract::Validate(key: :note)
  step Contract::Persist()

  def model!(options, current_user: nil, params:, **)
    return false unless current_user

    options['model'] = Note.where(user_id: current_user, id: params[:id]).first
  end
end
