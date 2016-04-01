require File.expand_path('../border_design', __FILE__)
require File.expand_path('../queue_fetcher', __FILE__)

class PowerpointGenerator
  def initialize(input)
    @qf = QueueFetcher.new
    @powerpoint = HSLFModel::HSLFSlideShow.new
    @border = BorderDesign.new
    @slide = @powerpoint.create_slide()
    @table = @slide.create_table(5, 2)
    @input = input
  end

  def adjust_view
    #set width of the 1st column
    @table.set_column_width(0, 300);
    #set width of the 2nd column
    @table.set_column_width(1, 150);
    @table.move_to(100, 100);
  end

  def populate_table
    @input.each_with_index do |value, row, col|
      cell = @table.get_cell(row, col)
      cell.set_text(value)

      @border.set_border_dash(cell)
      @border.set_border_color(cell)

      cell.set_vertical_alignment(SLModel::VerticalAlignment::MIDDLE)
      cell.set_horizontal_centered(false)

      text_run = cell.get_text_paragraphs().get(0).get_text_runs().get(0);
      text_run.set_font_family('Arial');
      text_run.set_font_size(10);
      # Table Header
      if row == 0
        text_run.set_bold(true);
        @border.set_background(cell)
      end
    end
    @slide.add_shape(@table)
  end

  def write_to_file(file_name)
    file_out = java.io.FileOutputStream.new(file_name)
    @powerpoint.write(file_out)
    file_out.close
  end

  def generate_portfolio_ppt
    # Check Connection
    @qf.check_connection
    # Get all porfolios
    ppt_list = @qf.get_portfolio_ppt

    # TODO: Generate PPT from the db portfolios
    # populate_table
    # adjust_view
    # write_to_file('test_file.ppt')
  end
end
