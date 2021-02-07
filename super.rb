class User
  def log_in
    @logged_in = true
  end
end



class Student < User
  def log_in
    super
    @in_class = true
  end
end