
pdf.font "Helvetica"
pdf.draw_text "Reg. No.: "+@partnership_deed.registration_number, :at => [270,760], :size => 8
pdf.draw_text "Date: "+Date.today.to_s, :at => [285,750], :size => 8
pdf.move_down(20)
pdf.draw_text "FORM II", :at => [200,720], :size =>10
pdf.draw_text "[SEE RULE 3]", :at => [194,710], :size =>9
pdf.move_down(60)
pdf.bounding_box([75,pdf.bounds.top-70], :width => 516, :height => 680) do

table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Statement of alteration in the name of the firm or in the location of the principal place of business",:inline_format => true, :border_width => 0,:width=>270,:size=>9)
    
  ]]

pdf.table table_data
pdf.move_down(10)
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Presented or forwarded to the Registrar of firms for filing by "+@partnership_deed.filled_by,:inline_format => true, :border_width => 0,:width=>270,:size=>9)
    
  ]]

pdf.table table_data
pdf.move_down(10)
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"We, the undersigned, being the partners of the firm hereby supply the following particulars pursuants to section 60(1) of the Indian Partnership Act 1932;",:inline_format => true, :border_width => 0,:width=>270,:size=>9)
    
  ]]

pdf.table table_data

if @address_changed
pdf.move_down(20)
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"PLACE OF BUSINESS",:inline_format => true,:align=>:center, :border_width => 1,:width=>270,:size=>9)
    
  ]]

pdf.table table_data
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Previous Place",:inline_format => true,:align=>:center, :border_width => 1,:width=>135,:size=>9),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"New Place",:inline_format => true,:align=>:center, :border_width => 1,:width=>135,:size=>9)
  ]]


pdf.table table_data
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>@old_address,:inline_format => true,:align=>:center, :border_width => 1,:width=>135,:size=>9),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>@partnership_deed.firm_address,:inline_format => true,:align=>:center, :border_width => 1,:width=>135,:size=>9)
  ]]

pdf.table table_data
end

if @name_changed
pdf.move_down(20)
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Previous Name",:inline_format => true,:align=>:center, :border_width => 1,:width=>135,:size=>9),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"New Name",:inline_format => true,:align=>:center, :border_width => 1,:width=>135,:size=>9)
  ]]


pdf.table table_data
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>@old_name,:inline_format => true,:align=>:center, :border_width => 1,:width=>135,:size=>9),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>@partnership_deed.firm_name,:inline_format => true,:align=>:center, :border_width => 1,:width=>135,:size=>9)
  ]]

pdf.table table_data
end
pdf.move_down(30)

table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Station:",:inline_format => true, :border_width => 0,:width=>135,:size=>9),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Signature of the partner or their specially Authorised agent",:inline_format => true,:align=>:center, :border_width => 0,:width=>135,:size=>9)
  ]]

pdf.table table_data

table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Date:",:inline_format => true, :border_width => 0,:width=>270,:size=>9)
    
  ]]

pdf.table table_data
pdf.move_down(30)
@partnership_deed.firm_partners.each do |partner|
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"I, #{partner.first_name}, Son of #{partner.father_name}, #{partner.age} years of age of #{partner.religion} do hereby declare that the above statement is true and correct to the best of my knowldege and beleif.",:inline_format => true,:align=>:center, :border_width => 0,:width=>270,:size=>9)
]]

pdf.table table_data
pdf.move_down(20)

table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Date: ",:inline_format => true, :width=>135,:size=>9, :border_width => 0),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Signature",:inline_format => true,:width=>135,:size=>9, :border_width => 0)
  ]]

pdf.table table_data
pdf.move_down(10)
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"Witness:",:inline_format => true, :border_width => 0,:width=>270,:size=>9)
    
  ]]

pdf.table table_data

pdf.move_down(20)
end

end