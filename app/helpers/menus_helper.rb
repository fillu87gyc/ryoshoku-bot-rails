module MenusHelper
  def eat_time_to_s(eat_time)
    case eat_time
    when 1
      '朝食'
    when 2
      '昼食'
    when 3
      '夕食'
    end
  end


end
