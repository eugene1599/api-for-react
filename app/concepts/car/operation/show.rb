class Car::Show < Trailblazer::Operation
  step :model!

  def model!(ctx, current_user:, params:, **)
    ctx['model'] = current_user.cars.find_by(id: params[:id])
  end
end
