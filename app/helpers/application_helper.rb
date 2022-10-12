module ApplicationHelper
  def navigation_items
    [
      { body: 'Listing', href: listings_path },
      { body: 'Reservations', href: reservations_path },
      { body: 'My Listing', href: host_listings_path }
    ]
  end

  def navigation_class(path)
    if current_page?(path)
      "bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium"
    else
      "text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium"
    end
  end

  def navigation_aria(page)
    if current_page?(page)
      "page"
    else
      "false"
    end
  end

  def unsplash_photo(keyword)
    random = rand(9)
    photo = Unsplash::Photo.search(keyword)
    photo[random]['width'] = 512
    photo[random]['height'] = 80
    photo[random]['urls']['raw']
  end
end
