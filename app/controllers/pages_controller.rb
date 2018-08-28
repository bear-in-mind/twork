class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

  end

  private

  def search_discogs(query)
    # @results = search_discogs("louis sommer")
    token = "" # see .env file
    # token = ENV['DISCOGS_TOKEN']
    auth_wrapper = Discogs::Wrapper.new(
      "twork",
      user_token: token,
    )
    artist_id = auth_wrapper.search(query).results.first.id
    return auth_wrapper.get_artist_releases(artist_id).releases
    # You can now perform authenticated requests.
  end

end
