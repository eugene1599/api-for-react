class Car::Destroy < Trailblazer::Operation
  step :model!
  step :destroy!

  def model!(ctx, current_user:, params:, **)
    ctx['model'] = current_user.car.find(params[:id])
  end

  def destroy!(ctx, current_user:, **)
    ctx['model'].destroy
  end
end
