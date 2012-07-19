Prawn::Document.generate "public/dissolved.pdf",:page_size => 'A4',:left_margin => 50,:right_margin => 50,:top_margin => 50,:bottom_margin => 50 do |pdf|
pdf.font "Helvetica"
pdf.draw_text "Reg. No.: "+@partnership_deed.registration_number, :at => [270,760], :size => 8
pdf.draw_text "Date: "+Date.today.to_s, :at => [285,750], :size => 8
pdf.move_down(20)
pdf.draw_text "FORM V", :at => [185,720], :size =>10

pdf.move_down(30)
pdf.bounding_box([75,pdf.bounds.top-30], :width => 516, :height => 680) do

table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Notice of change in Constitution of firm or of the dissolution of the firm",:inline_format => true,:align=>:center, :border_width => 0,:width=>270,:size=>9)
    
  ]]
  pdf.table table_data
pdf.move_down(10)  
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>@partnership_deed.firm_name,:inline_format => true,:align=>:center, :border_width => 0,:width=>270,:size=>10)
    
  ]]
  pdf.table table_data
  pdf.move_down(10)  
  table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Presented or forwarded to the Registrar of firms for filing by #{@partnership_deed.filled_by}.",:inline_format => true,:align=>:center, :border_width => 0,:width=>270,:size=>9)
    
  ]]
  pdf.table table_data 
    pdf.move_down(10)  
  table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Under section 63(1)of the Indian Partnership Act, 1932 notice as follows:",:inline_format => true,:align=>:center, :border_width => 0,:width=>270,:size=>9)
    
  ]]
  pdf.table table_data 

   pdf.move_down(10) 
 
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"The firm #{@partnership_deed.firm_name} has been dissolved with effect from the #{@partnership_deed.dissolved_date.strftime('%d-%m-%Y')}",:inline_format => true,:align=>:center, :border_width => 0,:width=>270,:size=>9)
  ]]
   pdf.table table_data
   
   


table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Station:",:inline_format => true, :border_width => 0,:width=>135,:size=>9),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Signature of the partner or their specially Authorised agent",:inline_format => true,:align=>:center, :border_width => 0,:width=>135,:size=>9)
  ]]

pdf.table table_data

table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Date:",:inline_format => true, :border_width => 0,:width=>270,:size=>9)
    
  ]]

pdf.table table_data
   
   
end  
end