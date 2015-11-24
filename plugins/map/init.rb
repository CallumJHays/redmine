require 'redmine'
# require_dependency 'map/hooks'

Redmine::Plugin.register :map do
  name 'Map plugin'
  author 'GeoSynergy'
  description 'GIS plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  project_module :map do
    permission :view_map, { :index => [:index] }
  end
  menu :project_menu, :map, { :controller => 'index', :action => 'index' }, :caption => 'Map', :after => :activity, :param => :project_id

  add_tab :map, :partial => 'tab/map'
  tab_settings :default => {'iframe_url' => 'http://truffala.com.au'}
end
