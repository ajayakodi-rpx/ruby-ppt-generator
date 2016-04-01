require 'pry'
class BorderDesign
  def initialize
    @color = java.awt.Color.new(54, 165, 201)
  end

  def set_border_color(cell)
    SLModel::TableCell::BorderEdge.values.each do |value|
      cell.set_border_color(value, @color)
    end
  end

  def set_border_dash(cell)
    SLModel::TableCell::BorderEdge.values.each do |value|
      cell.set_border_dash(value, SLModel::StrokeStyle::LineDash::SOLID)
    end
  end

  def set_background(cell)
    cell.set_fill_color @color
  end
end