module CustomerFilter
  module_function

  def results(params)
    if params[:name].present? && params[:street].present?
      Customer.by_street(params[:street]).by_name(params[:name])
    elsif params[:street].present?
      Customer.by_street(params[:street])
    elsif params[:name].present?
      Customer.by_name(params[:name])
    else
      Customer.all
    end

  end
end
