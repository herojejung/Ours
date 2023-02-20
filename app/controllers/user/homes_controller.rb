class User::HomesController < ApplicationController
  before_action :authenticate_user!
def index
  @homes = Home.all.includes(:post_images)
end

end