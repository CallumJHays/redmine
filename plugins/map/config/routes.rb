# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'map', :to => 'index#index'
get 'geoserver', :to => 'index#gsproxy'
get 'geoserver-img', :to => 'index#gsimgproxy'
post 'save_config', :to => 'index#save_config'
get 'load_conf_wms', :to => 'index#load_conf_wms'
get 'load-feature-layer', :to => 'geo#load_feature_layer'
