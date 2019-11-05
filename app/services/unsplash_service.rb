class UnsplashService
  def get_image(query)
    response = connection(query).get('photos/random')
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def connection(query)
    Faraday.new(
    url: 'https://api.unsplash.com/',
    params: { client_id: ENV['UNSPLASH_ACCESS_KEY'],
              query: "#{query} nature"
            }
    )
  end
end
