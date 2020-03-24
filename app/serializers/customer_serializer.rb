class CustomerSerializer < Blueprinter::Base
  identifier :id do |obj|
    obj.id.to_s
  end

  fields :first_name, :last_name, :company, :created_at, :updated_at
end
