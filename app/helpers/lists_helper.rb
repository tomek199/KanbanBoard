module ListsHelper
  def new_list_input_disabled? lists_size
    if (lists_size >= 6)
      return {class: "form-control", disabled: "disabled", placeholder: "Maximum lists added"}
    else
      return {class: "form-control"}
    end
  end
end
