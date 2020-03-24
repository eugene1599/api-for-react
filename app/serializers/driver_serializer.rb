class DriverSerializer < Blueprinter::Base
  identifier :id do |obj|
    obj.id.to_s
  end

  fields :first_name, :last_name, :driver_type, :created_at, :updated_at
end
