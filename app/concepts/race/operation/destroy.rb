class Race::Destroy < Trailblazer::Operation
  step :model!
  step :destroy!

  def model!(ctx, current_user:, params:, **)
    ctx['model'] = current_user.races.find_by(id: params[:id])
  end

  def destroy!(ctx, current_user:, **)
    ctx['model'].destroy
  end
end
