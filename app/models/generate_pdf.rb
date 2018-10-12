class GeneratePdf < Prawn::Document

  def initialize(vehicle)
    super(top_margin: 20)
    
    @maintenance_actions = MaintenanceAction.order("id")
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
  
    [["Maintnenace Type", "Service Date", "Mileage", "Cost" ]] +
    @maintenance_actions.map do |maintenance_action|
      [maintenance_action.type, maintenance_action.service_date, maintenance_action.mileage, maintenance_action.cost]
    end
  end
  

  

  

  

  