require 'trailblazer/operation'

class Note::Create < Trailblazer::Operation
  # set dependency
  # we can rewrite this dependency in options hash
  self['contract.default.class'] = Note::Contract::Create

  step Model(Note, :new)
  step :assign_current_user!
  step Contract::Build()
  step Contract::Validate(key: :note)
  step Contract::Persist()

  def assign_current_user!(options, current_user: nil, **)
    return false unless current_user

    options['model'].user_id = current_user
  end
end
