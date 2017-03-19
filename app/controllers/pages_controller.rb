class PagesController < ApplicationController

  def home
    @spaces = Space.all
    @space_art = Space.all.select{|space| space.category_ids.include?(7)}.sample
    @space_event = Space.all.select{|space| space.category_ids.include?(8)}.sample
    @space_meeting = Space.all.select{|space| space.category_ids.include?(9)}.sample
    @space_cafe = Space.all.select{|space| space.category_ids.include?(1)}.sample
    @space_office = Space.all.select{|space| space.category_ids.include?(5)}.sample
    @space_residential = Space.all.select{|space| space.category_ids.include?(6)}.sample
    @space_retail = Space.all.select{|space| space.category_ids.include?(4)}.sample
  end

end
