module ReservationsHelper
  def status_span_index(status)
    case status
    when "pending"
      "bg-purple-200 text-purple-600 py-1 px-3 rounded-full text-xs"
    when "booked"
      "bg-blue-200 text-blue-600 py-1 px-3 rounded-full text-xs"
    when "cancelled"
      "bg-red-200 text-red-600 py-1 px-3 rounded-full text-xs"
    when "canceling"
      "bg-orange-200 text-orange-600 py-1 px-3 rounded-full text-xs"
    when "expired"
      "bg-yellow-200 text-yellow-600 py-1 px-3 rounded-full text-xs"
    end
  end

  def status_span_show(status)
    case status
    when "pending"
      "bg-purple-200 text-purple-600 py-2 px-3 rounded-full text-sm"
    when "booked"
      "bg-blue-200 text-blue-600 py-2 px-3 rounded-full text-sm"
    when "cancelled"
      "bg-red-200 text-red-600 py-2 px-3 rounded-full text-sm"
    when "canceling"
      "bg-orange-200 text-orange-600 py-2 px-3 rounded-full text-sm"
    when "expired"
      "bg-yellow-200 text-yellow-600 py-2 px-3 rounded-full text-sm"
    end
  end
end
