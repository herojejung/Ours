class User::HomesController < ApplicationController
def index
  @post_image = PostImage.all
end

end