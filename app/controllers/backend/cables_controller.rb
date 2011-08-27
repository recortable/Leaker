class Backend::CablesController < Backend::ResourceController
  def resource
    @cable = Cable.get params[:id]
  end
end

