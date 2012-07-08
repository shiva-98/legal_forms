pdf.font "Helvetica"


pdf.draw_text "FORM II - A", :at => [185,720], :size =>10
pdf.draw_text "FORM OF DECLARATION", :at => [155,700], :size =>10
pdf.draw_text "[See Rule 3A]", :at => [185,690], :size =>8
pdf.move_down(30)
pdf.bounding_box([75,pdf.bounds.top-60], :width => 516, :height => 680) do

table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Name of the firm: ",:inline_format => true,:align=>:right, :border_width => 0,:width=>135,:size=>9),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>@partnership_deed.firm_name,:inline_format => true,:align=>:center, :border_width => 0,:width=>135,:size=>9)
  ]]
   pdf.table table_data

table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Registration Number: ",:inline_format => true,:align=>:right, :border_width => 0,:width=>135,:size=>9),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"#{@partnership_deed.registration_number}",:inline_format => true,:align=>:center, :border_width => 0,:width=>135,:size=>9)
  ]]
   pdf.table table_data
 
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Date of Registration: ",:inline_format => true,:align=>:right, :border_width => 0,:width=>135,:size=>9),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"#{@partnership_deed.date_of_registration}",:inline_format => true,:align=>:center, :border_width => 0,:width=>135,:size=>9)
  ]]
   pdf.table table_data
   
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Place of Business: ",:inline_format => true,:align=>:right, :border_width => 0,:width=>135,:size=>9),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"#{@partnership_deed.firm_address} #{@partnership_deed.firm_address1}",:inline_format => true,:align=>:center, :border_width => 0,:width=>135,:size=>9)
  ]]
   pdf.table table_data
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Period of Declaration: ",:inline_format => true,:align=>:right, :border_width => 0,:width=>135,:size=>9),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"",:inline_format => true,:align=>:center, :border_width => 0,:width=>135,:size=>9)
  ]]
   pdf.table table_data
 table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Date of Declaration: ",:inline_format => true,:align=>:right, :border_width => 0,:width=>135,:size=>9),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"",:inline_format => true,:align=>:center, :border_width => 0,:width=>135,:size=>9)
  ]]
   pdf.table table_data  
    table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"We the Partners of the above firm declare that the above firms is functioning as on date declaration with",:inline_format => true,:align=>:center, :border_width => 0,:width=>270,:size=>9)
  ]]
   pdf.table table_data
     table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"SI No.",:inline_format => true,:align=>:center, :border_width => 1,:width=>47,:size=>9),
  Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Name of the Partner",:inline_format => true,:align=>:center, :border_width => 1,:width=>87,:size=>9),
  Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Date of Joining",:inline_format => true,:align=>:center, :border_width => 1,:width=>67,:size=>9),
  Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Signature",:inline_format => true,:align=>:center, :border_width => 1,:width=>67,:size=>9)
  ]]
   pdf.table table_data
   i=1
   for partner in @partnership_deed.firm_partners
        table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"#{i}",:inline_format => true,:align=>:center, :border_width => 1,:width=>47,:size=>9),
  Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"#{partner.first_name} #{partner.last_name}",:inline_format => true,:align=>:center, :border_width => 1,:width=>87,:size=>9),
  Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"#{partner.date_of_joining.strftime("%d-%m-%Y")}",:inline_format => true,:align=>:center, :border_width => 1,:width=>67,:size=>9),
  Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"",:inline_format => true,:align=>:center, :border_width => 1,:width=>67,:size=>9)
  ]]
   pdf.table table_data
   i=i+1
   end
end  