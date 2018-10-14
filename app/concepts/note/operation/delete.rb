class Note::Delete < Trailblazer::Operation
  step :model!
  step :delete!

  def model!(options, current_user:, params:, **)
    options['model'] = Note.where(user_id: current_user, id: params[:id]).first
  end

  def delete!(_options, model:, **)
    model.destroy
  end
end
