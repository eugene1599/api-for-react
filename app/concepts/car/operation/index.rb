class Car
  class Index < Trailblazer::Operation
    step :model!

    def model!(ctx, current_user:, **)
      ctx['model'] = current_user.cars
    end
  end
end
