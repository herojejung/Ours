class User::HomesController < ApplicationController
def index
  @homes = Home.all.includes(:post_images)
end

end