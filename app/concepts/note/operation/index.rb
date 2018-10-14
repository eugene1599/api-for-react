class Note::Index < Trailblazer::Operation
  step :model!

  def model!(options, current_user:, **)
    options['model'] = Note.where(user_id: current_user)
  end
end
