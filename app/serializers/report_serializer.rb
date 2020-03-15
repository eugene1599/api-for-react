class ReportSerializer < Blueprinter::Base
  identifier :id do |obj|
    obj.id.to_s
  end

  fields :fuel, :fuel_cost, :mileage, :created_at, :updated_at

  field :race_id do |obj|
    obj.race_id.to_s
  end
end
