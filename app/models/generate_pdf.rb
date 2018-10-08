class GeneratePdf < Prawn::Document

  def initialize(vehicle)
    super(top_margin: 70)
    @vehicle = vehicle
    text "Vehicle info will show here"
      
    end
  end

  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..5).align = :right
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.header = true
    end
  end

  def line_item_rows
    [["Make", "Model", "Year", "Vehicle Identification Number", "License Plate"]] +
    @vehicle.map do |vehicle|
      [vehicle.make, vehicle.model, vehicle.year, vehicle.vin, vehicle.license_plate]
    end
  end

  