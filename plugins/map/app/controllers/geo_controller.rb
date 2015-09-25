class GeoController < ApplicationController
  unloadable

  def load_feature_layer
    conn = PG.connect({:host => "127.0.0.1", :dbname => "kegs_glng", :port => 5432, :user => "sia", :password => "sia_1345"})

    conn.exec_params("SELECT id, tagnumber, st_asgeojson(st_transform(geo, 900913)) as geojson
        from geo.#{params[:layer]} where workpack_id = $1", [params[:workpack_id]]) do |result|
        render :json => pg_result_to_json(result)
    end
  end

  private
  def pg_result_to_json (pg_result=nil)
      if pg_result.nil? then
        return '[]'
      end
      geoJsonStr = '{"type": "FeatureCollection","features":['

      pg_result.each do |tuple|
        geoJsonStr << "{\"type\": \"Feature\", \"geometry\":#{tuple["geojson"]}"
        geoJsonStr << ",\"properties\": #{tuple.reject {|key,value| key.eql?("geojson") }.to_json}},";
      end
      geoJsonStr = geoJsonStr.chomp(",")
      geoJsonStr << ']}'
      return geoJsonStr

  end

end
