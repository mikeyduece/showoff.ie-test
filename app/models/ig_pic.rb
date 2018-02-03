class IgPic

  attr_reader :ig_user, :image, :caption, :likes, :tags

  def initialize(params)
    @ig_user = params[:user]
    @image = params[:images][:standard_resolution][:url]
    @caption = params[:caption][:text] unless params[:caption].nil?
    @likes   = params[:likes][:count].to_i
    @tags    = params[:tags]
  end
end
