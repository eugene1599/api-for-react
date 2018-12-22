class Customer
  class Index < Trailblazer::Operation
    step :model!

    def model!(ctx, current_user:, **)
      ctx['model'] = current_user.customers
    end
  end
end
