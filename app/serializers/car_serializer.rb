class CarSerializer < Blueprinter::Base
  identifier :id do |obj|
    obj.id.to_s
  end

  fields :name, :created_at, :updated_at
end
