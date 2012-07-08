module ApplicationHelper
  def fields_for_firm_partner(firm_partner, &block)
    
    prefix = firm_partner.new_record? ? 'new' : 'existing'
    fields_for("project[#{prefix}_firm_partner_attributes][]", firm_partner, &block)
  end

  def add_firm_partner_link(name)
    link_to_function(name,"alert('Hello world!')") do |page|
      page.insert_html :bottom, :firm_partners, :partial => 'firm_partner', :object => FirmPartner.new
    end
  end
  

  def side_menus
    menus = {}
    menus["Customer List"]  = []
    menus["Customer List"] << {:name=>"List Customers", :url=>"/users", :controller=>"/users", :action=>"index", :class=>"icon-list"}
    menus["Customer List"] << {:name=>"Add Customer", :url=>"/users/new", :controller=>"/users", :action=>"new", :class=>"icon-plus-sign"}
    menus["Partnership Deeds"]  = []
    menus["Partnership Deeds"] << {:name=>"List Partnership Deeds", :url=>"/partnership_deeds", :controller=>"/partnership_deeds", :action=>"index", :class=>"icon-list"}
    menus["Partnership Deeds"] << {:name=>"Add Partnership Deed", :url=>"/partnership_deeds/new", :controller=>"/partnership_deeds", :action=>"new", :class=>"icon-plus-sign"}
    
    
    menus.sort
  end
  
  def active_controller?(menu_item, parameters={})
    menu_controller_action = menu_item[:action]
    menu_controller_name = (menu_item[:controller].gsub(/^\//,'')+"_controller").camelize
    
    # Validate if the controller's params include the params specified by the menu
    hash = menu_item.dup.delete_if{|k,v| [:name,:controller,:action,:url,:class].include?(k)}
    (menu_controller_name==controller.class.to_s && menu_controller_action==controller.action_name && params_include_menu_params?(hash) )  
  end
  
  def params_include_menu_params?(hash)
    included=true
    
    hash.each do |k,v|
      included &&= (params.has_key?(k) && params[k]==v.to_s)
    end
    
    included
  end  
  
  def profile_path
    link_to "<i class='icon-user'></i>&nbsp;Profile".html_safe, user_path(@curr_user)
  end
  
  def display_name
    @curr_user.display_name
  end


end
