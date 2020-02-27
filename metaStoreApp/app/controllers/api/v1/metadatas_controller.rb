module Api
  module V1
    require 'csv'

    class MetadatasController < ApplicationController
      def create          
        Metadata.delete_all
        saved = []
        unsaved = []
        CSV.foreach(params[:id], headers: true) do |row|
          hash_value = row.to_hash
          if Media.exists? asset_id: hash_value["media_id"]
            type = Media.where(asset_id: hash_value["media_id"]).pluck(:media_type)[0]
            if type == "audio"
              audio_instance = AudiosController.new
              hash_value["timecode"] = audio_instance.duration_tc((hash_value["duration"]).to_i)
            elsif type == "video"
              video_instance = VideosController.new
              hash_value["timecode"] = video_instance.duration_tc((hash_value["duration"]).to_i)
            end
          end
          metadata = Metadata.new(hash_value)
          if metadata.save
            saved.append(hash_value)   
          else
            unsaved.append(hash_value)  
          end
        end
        render json: { status: 'SUCCESS', message: 'Loaded metadata', saved_data: saved, 
        unsaved_data: unsaved }, status: :ok 
      end
    end
  end
end
