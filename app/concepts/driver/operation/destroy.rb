class Driver::Destroy < Trailblazer::Operation
  step :model!
  step :destroy!

  def model!(ctx, current_user:, params:, **)
    ctx['model'] = current_user.drivers.find_by(id: params[:id])
  end

  def destroy!(ctx, **)
    ctx['model'].destroy
  end
end
