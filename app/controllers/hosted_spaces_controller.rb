class HostedSpacesController < ApplicationController

  def index
  @hosted_spaces = current_user.hosted_spaces
  end

end
