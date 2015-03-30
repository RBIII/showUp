def read_shows
  shows = []
  counter = 1
  until counter >= 5
    HTTParty.get("http://api.seatgeek.com/2/events?per_page=5000&page=#{counter}")["events"].each do |event|
      if (event["venue"]["city"].downcase == "boston" || event["venue"]["city"].downcase == "cambridge") && event["type"].downcase == "concert"
        shows << {band: event["performers"].first["name"], date: event["datetime_local"].split("T")[0],
          time: event["datetime_local"].split("T")[1], venue: event["venue"]["name"],
          ticket_url: event["url"], image_url: event["performers"].first["image"],
          avg_price: event["stats"]["average_price"]}
      end
    end
    counter += 1
  end
  return shows
end
