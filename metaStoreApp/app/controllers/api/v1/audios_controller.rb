module Api
  module V1
    class AudiosController < MediasController
      # creates a new audio
      def create
        super
        if (@@media.save)
          render json: { status: 'SUCCESS', message: 'saved audio', data: @@media }, status: :ok
        else
          render json: { status: 'ERROR', message: 'failed to save audio', data: @@media.errors }, status: :unprocessable_entity
        end
      end
    
      # deletes a specific audio based on asset_id
      def destroy
        super
        render json: { status: 'SUCCESS', message: 'Deleted audio', data: @@del_media }, status: :ok 
      end
    end
  end
end
