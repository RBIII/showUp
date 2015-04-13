def read_shows
  counter = 1
  until counter >= 20
    HTTParty.get("http://api.seatgeek.com/2/events?per_page=5000&page=#{counter}")["events"].each do |event|
      if (event["venue"]["city"].downcase == "boston" || event["venue"]["city"].downcase == "cambridge") && event["type"].downcase == "concert"

        if Venue.find_by(name: event["venue"]["name"])
          venue = Venue.find_by(name: event["venue"]["name"])
        else
          venue = Venue.create!(name: event["venue"]["name"], latitude: event["venue"]["location"]["lat"], longitude: event["venue"]["location"]["lon"])
        end

        if Band.find_by(name: event["performers"].first["name"])
          band = Band.find_by(name: event["performers"].first["name"])
        else
          band = Band.create!(name: event["performers"].first["name"])
        end

        Show.create!(date: event["datetime_local"].split("T")[0], time: event["datetime_local"].split("T")[1],
        ticket_url: event["url"], image_url: event["performers"].first["image"], avg_price: event["stats"]["average_price"],
        band_id: band.id, venue_id: venue.id)
      end
    end
    counter += 1
  end
end

read_shows
