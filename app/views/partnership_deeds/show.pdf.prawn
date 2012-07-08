

pdf.draw_text "FORM NO. 1", :at => [70,710], :size => 13
pdf.draw_text "Filling Fee       ", :at => [400,710], :size => 13
pdf.draw_text "(See Rule 3)", :at => [70,690], :size => 12
pdf.draw_text " Rs.", :at => [400,690], :size => 12
pdf.move_down(60)
pdf.text "THE INDIAN PARTNERSHIP ACT, 1932",:align=>:center,:size=>16,:style => :bold
pdf.move_down(20)

table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content => "Application for registration of firm by the name",
                                              :inline_format => true, :border_width => 0,:width=>270),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :inline_format => true, :content => @partnership_deed.firm_name, :border_width => 0,:width=>230 )
  ]]

pdf.table table_data 

table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content => "Presented or forwarded to the Registrar of Firms of filing by",
                                              :inline_format => true, :border_width => 0,:width=>270),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :inline_format => true, :content => @partnership_deed.filled_by.upcase, :border_width => 0,:width=>230 )
  ]]

  pdf.table table_data
  
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content => "We, the undersigned, being the partners of the firm",
                                              :inline_format => true, :border_width => 0,:width=>270),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :inline_format => true, :content => @partnership_deed.firm_name, :border_width => 0,:width=>230 )
  ]]

pdf.table table_data   
pdf.move_down(20)
pdf.text "hereby apply, for registration of the said firm and for theat purpose, supply the following particulars in pursuance of section 58 of the Indian Partnership Act, 1932"
pdf.move_down(20)
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content => "I)	The Firm's Name",
                                              :inline_format => true, :border_width => 0,:width=>270),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :inline_format => true, :content => @partnership_deed.firm_name, :border_width => 0,:width=>230 )
  ]]

pdf.table table_data 
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content => "II)	Place of business",
                                              :inline_format => true, :border_width => 0,:width=>270),
   
  ]]

pdf.table table_data 
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content => " a)	Principal Place",
                                              :inline_format => true, :border_width => 0,:width=>270),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :inline_format => true, :content =>"b)	Other Place", :border_width => 0,:width=>230 )
  ]]

pdf.table table_data 
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content => @partnership_deed.firm_address.upcase,
                                              :inline_format => true, :border_width => 0,:width=>270),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :inline_format => true, :content =>"nil", :border_width => 0,:width=>230 )
  ]]

pdf.table table_data 
pdf.move_down(20)
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"SI No",
                                              :inline_format => true,:align=>:center, :border_width => 0,:width=>100),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :inline_format => true,:align=>:center, :content =>"(a) Name of partner in full", :border_width => 0,:width=>140 ),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :inline_format => true,:align=>:center, :content =>"(b) Date of Joining the firm", :border_width => 0,:width=>140 ),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :inline_format => true,:align=>:center, :content =>"( c) Permanent address in full", :border_width => 0,:width=>140 )
  ]]

pdf.table table_data

i=1
for firm_partner in @partnership_deed.firm_partners 
table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>i.to_s,
                                              :inline_format => true,:align=>:center, :border_width => 0,:width=>100),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :inline_format => true,:align=>:center, :content =>firm_partner.first_name+" "+firm_partner.last_name+" "+firm_partner.father_name, :border_width => 0,:width=>140 ),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :inline_format => true,:align=>:center, :content =>firm_partner.date_of_joining.strftime("%d-%m-%Y"), :border_width => 0,:width=>140 ),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :inline_format => true,:align=>:center, :content =>firm_partner.address1, :border_width => 0,:width=>140 )
  ]]

pdf.table table_data
i=i+1
end

pdf.move_down(20)

table_data = 
  [[Prawn::Table::Cell::Text.new( pdf, [0,0], :content =>"(iv) Duration of the firm",
                                              :inline_format => true, :border_width => 0,:width=>270),
    Prawn::Table::Cell::Text.new( pdf, [0,0], :inline_format => true, :content =>"At Will", :border_width => 0,:width=>230 )
  ]]

pdf.table table_data 

pdf.move_down(20)

for firm_partner in @partnership_deed.firm_partners 
pdf.text "I, "+firm_partner.first_name+" son of "+firm_partner.father_name+" "+firm_partner.age.to_s+" years of age, of "+firm_partner.religion+" religion, do hereby declare that the above statement is true and correct to the best of my knowledge and belief."
pdf.move_down(20)
pdf.text "DATE:"
pdf.text "WITNESS"
pdf.move_down(20)
pdf.text "Signature with name, designation and full permanent address"
pdf.move_down(20)
end

