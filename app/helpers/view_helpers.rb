NatTape.helpers do
  def format_seconds t
    mm, ss = t.divmod(60)            #=> [4515, 21]
    hh, mm = mm.divmod(60)           #=> [75, 15]
    dd, hh = hh.divmod(24)           #=> [3, 3]

    ret = "#{ss}"
    ret = "#{mm}:#{ss}" if mm > 0
    ret = "#{hh}:#{mm}:#{ss}" if hh > 0
    ret = "#{dd}:#{hh}:#{mm}:#{ss}" if dd > 0

    return ret
  end

  def logged_in?
    if !session[:user]
      redirect '/auth'
    end

    return true
  end
end
