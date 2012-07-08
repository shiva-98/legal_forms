class PartnershipDeedsController < ApplicationController
 
  def index
    @partnership_deeds = PartnershipDeed.all
  end
  
  def show
    @partnership_deed = PartnershipDeed.find(params[:id])
  
  
   render :action=>"show",:formats=>'pdf',:layout=>false
  end 

  def new
    @partnership_deed = PartnershipDeed.new
    1.times { @partnership_deed.firm_partners.build }
  end

  def create
    @partnership_deed = PartnershipDeed.new(params[:partnership_deed])
    @partnership_deed.next_renewal_date = "01-04-"+(Time.new.year+1).to_s
    if @partnership_deed.save
      redirect_to @partnership_deed, :notice => "Successfully created partnership deed."
    else
      render :action => 'new'
    end
  end

  def edit
    @partnership_deed = PartnershipDeed.find(params[:id])
  end

  def update
    
    @partnership_deed = PartnershipDeed.find(params[:id])
    @old_name=@partnership_deed.firm_name
    @old_address=@partnership_deed.firm_address
    @partnership_deed.firm_name=params[:partnership_deed][:firm_name]
    @partnership_deed.firm_address=params[:partnership_deed][:firm_address]
    pdf_generation=false
    if @partnership_deed.firm_name_changed?
     pdf_generation=true 
     @name_changed=true
    end
    if @partnership_deed.firm_address_changed?
      pdf_generation=true
      @address_changed=true
    end
   
    if @partnership_deed.update_attributes(params[:partnership_deed])
       if pdf_generation
          prawnto :prawn => { :page_size => 'A4', 
                     :left_margin => 50,    
                     :right_margin => 50,   
                     :top_margin => 50,    
                     :bottom_margin => 50}, 
             :filename => "form_3", :inline => true
         render :action=>"form_2",:formats=>'pdf',:layout=>false
       else  
        
         
         redirect_to :action=>:index
       end
    else
      render :action => 'edit'
    end
  end

  def destroy
    @partnership_deed = PartnershipDeed.find(params[:id])
    @partnership_deed.destroy
    redirect_to partnership_deeds_url, :notice => "Successfully destroyed partnership deed."
  end
  
  def add_remove_member
    @partnership_deed = PartnershipDeed.find(params[:id])
  end
  
  def save_add_remove_member
    
    @new_partner=""
    @remove_partner=""
    if(params[:partnership_deed]!=nil)
    params[:partnership_deed][:"firm_partners_attributes"].each_pair do |key,value|
      if key.include?("new_")
      @new_partner+= "#{value[:first_name]} #{value[:last_name]},\nS/O #{value[:father_name]},\n #{value[:address1]} \n#{value[:address2]}\n Date of his joining to be partner: #{value[:date_of_joining]}\n\n"
      elsif (value["_destroy"]=="1") 
      @remove_partner+= "#{value[:first_name]} #{value[:last_name]},\nS/O #{value[:father_name]},\n #{value[:address1]} \n#{value[:address2]}\n\n" 
      end
    end
    end
    @partnership_deed = PartnershipDeed.find(params[:id])
    
    if @partnership_deed.update_attributes(params[:partnership_deed])
      if @new_partner!="" or @remove_partner!=""
           prawnto :prawn => { :page_size => 'A4', 
                     :left_margin => 50,    
                     :right_margin => 50,   
                     :top_margin => 50,    
                     :bottom_margin => 50}, 
             :filename => "form_3", :inline => true
         render :action=>"form_5",:formats=>'pdf',:layout=>false
      else
        redirect_to :action=>"index"
      end       
    else
      render :action => 'add_remove_member',:id=>@partnership_deed.id
    end
  end
  
  def renewal
    
    @partnership_deed = PartnershipDeed.find(params[:id])
     prawnto :prawn => { :page_size => 'A4', 
                     :left_margin => 50,    
                     :right_margin => 50,   
                     :top_margin => 50,    
                     :bottom_margin => 50}, 
             :filename => "renewal", :inline => true
         render :action=>"renewal",:formats=>'pdf',:layout=>false
  end
end
