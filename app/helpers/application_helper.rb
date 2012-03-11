module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end
  def sortable(column, title = nil)
  	title ||= column.titleize
  	css_class = (column == sort_column) ? "label label-info": nil  
  	direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}  	
  end
end