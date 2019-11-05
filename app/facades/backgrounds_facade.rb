class BackgroundsFacade
  def initialize(json)
    @id = 7
    @description = json[:description]
    @url = json[:urls][:regular]
  end
end
