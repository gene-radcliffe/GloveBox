class GenerateVehiclePdf < Prawn::Document

  def initialize(vehicle)
    super(top_margin: 20)
    @vehicles = Vehicle.order("id")
    line_items
    # text "Details for this Vehicle", size: 30, style: :bold
    
    end
  end


  def line_items
    move_down 50
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.header = true
    end
  end

  def line_item_rows
    [["Color", "Make", "Model", "Year", "VIN"]] +
    @vehicles.map do |vehicle|
      [vehicle.color, vehicle.make, vehicle.model, vehicle.year, vehicle.vin]
    end
  end
  

  

  

  

  