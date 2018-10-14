class Note::Show < Trailblazer::Operation
  step :model!

  def model!(options, current_user:, params:, **)
    options['model'] = Note.where(user_id: current_user, id: params[:id]).first
  end
end
