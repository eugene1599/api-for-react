class Driver
  class Index < Trailblazer::Operation
    step :model!

    def model!(ctx, current_user:, **)
      ctx['model'] = current_user.drivers
    end
  end
end
