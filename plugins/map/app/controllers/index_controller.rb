class IndexController < ApplicationController
  unloadable

  before_filter :find_project, :authorize, :only => :index


  def index

  end

  private
  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
    @settings = TabSetting.get_settings(@project.id)
    # c = 0
    # custom_fields = @project.custom_field_values.each do |cf|
    #   if cf.custom_field.name.to_s.eql? "project_geo"
    #     @project_geo = cf.to_s;
    #     end
    #   if cf.custom_field.name.to_s.eql? "Workpack_id"
    #     @workpack_id = cf.to_s;
    #   end
    # end
    @workpack_id = @settings['map']['workpack_id']
    @userData = User.current.to_json
  end

end
