class PagesController < ApplicationController

def home
  @pokes = Pokemon.all
end

end
