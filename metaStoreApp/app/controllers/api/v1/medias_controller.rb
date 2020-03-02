module Api
  module V1
    class MediasController < AccountsController
      require 'csv'

      # displays all the medias
      def index
        @@medias = Media.all
        render json: { status: 'SUCCESS', message: 'Loaded medias', data: @@medias }, status: :ok 
      end

      # creates a new media
      def create
        @@media = Media.new(params_media)
      end

      # shows a specfic media based on asset_id
      def show
        @@media = Media.find_by_asset_id(params[:id])
        if @@media == nil
          render json: { status: 'NOT FOUND', message: 'Desired asset_id of Media does not exists' }, status: :ok
        else
          render json: { status: 'SUCCESS', message: 'Loaded Media', data: @@media }, status: :ok
        end
      end

      # deletes a specific media based on asset_id
      def destroy
        @@del_media = Media.find_by_asset_id(params[:id])
        @@del_media.destroy
      end
      
      # uploads the metadata submitted by user via .csv file
      def update   
        saved = []
        unsaved = [] 
        CSV.foreach(params[:id], headers: true) do |row|
          hash_value = row.to_hash
          if Media.exists? asset_id: hash_value["asset_id"]
            type = Media.where(asset_id: hash_value["asset_id"]).pluck(:media_type)[0]
            if type == "audio"
              hash_value["timecode"] = Audio.duration_tc((hash_value["duration"]).to_i)
            elsif type == "video"
              hash_value["timecode"] = Video.duration_tc((hash_value["duration"]).to_i)
            end
            @metadata = Media.find_by_asset_id(hash_value["asset_id"])
            if @metadata.update_attributes(hash_value)
              saved.append(hash_value)   
            end
          else
            unsaved.append(hash_value)
          end
        end
        render json: { status: 'SUCCESS', message: 'Loaded metadata', saved_data: saved, 
        unsaved_data: unsaved }, status: :ok 
      end

      private 
      
      def params_media
        params.permit(:asset_id, :account_id, :media_type)
      end
    end
  end
end
