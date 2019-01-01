class User::Sources::SidebarController < User::ApplicationController
  def show
    source = Source.find_or_initialize_by(source_params)
    @facade = SourceFacade.new(source)
    render layout: 'sidebar'
  end
end
