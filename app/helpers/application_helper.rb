module ApplicationHelper


  def format_date(date)
    date.strftime(" created at %m/%d/%Y at %l:%M%P %Z")
  end
end
