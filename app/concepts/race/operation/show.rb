class Race::Show < Trailblazer::Operation
  step :model!

  def model!(ctx, current_user:, params:, **)
    ctx['model'] = current_user.races.find_by(id: params[:id])
  end
end
