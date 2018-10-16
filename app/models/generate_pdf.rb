class GeneratePdf < Prawn::Document

  include ActionView::Helpers::NumberHelper

  def initialize (maintenance_action)
    super(top_margin: 20)
    @maintenance_actions = maintenance_action.order("service_date")
    line_items
    
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
      [maintenance_action.type, maintenance_action.service_date, maintenance_action.mileage, number_to_currency(maintenance_action.cost)]
      
    end
  end
  

  private

  def generate_pdf
    params.permit(:vehicle_id, :maintenance_log_id, :maintenance_action_id )
  end

  def maintenance_action_params
    params.require(:maintenance_action).permit(:id, :maintenance_log_id, :type, :mileage, :oil_type, :service_date, :cost, :tire_location, :brake_location, :rotor_location, :notes, :selected)
  end
  
  def maintenance_log_params
    params.require(:maintenance_log).permit(:id)
  end
  def vehicle_params
    params.require(:vehicle).permit(:id, :name, :year, :make, :model, :insurance, :vin, :license_plate,
                                    :tire_psi, :registration, :title, :inspection, :color, :user_id, 
                                    :authenticity_token)
 end

  