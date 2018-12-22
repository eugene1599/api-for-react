class Driver::Show < Trailblazer::Operation
  step :model!

  def model!(ctx, current_user:, params:, **)
    ctx['model'] = current_user.drivers.find_by(id: params[:id])
  end
end
