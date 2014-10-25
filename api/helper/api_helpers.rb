module ApiHelpers
  def exist_check!(name)
    unless Container.exists? name
      error!({error: "container \"#{params[:name]}\" does not found."}, 400)
    end
  end

  def not_exist_check!(name)
    if Container.exists? name
      error!({error: "container \"#{params[:name]}\" already exists."}, 400)
    end
  end
end
