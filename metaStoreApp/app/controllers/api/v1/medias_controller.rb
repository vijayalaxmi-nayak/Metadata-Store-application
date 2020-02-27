module Api
  module V1
    class MediasController < AccountsController
      def index
        @@medias = Media.all
        render json: { status: 'SUCCESS', message: 'Loaded medias', data: @@medias }, status: :ok 
      end

      def show
        @@media = Media.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded media', data: @@media }, status: :ok 
      end

      def create
        @@media = Media.new(params_media)
      end

      def destroy
        @@del_media = Media.find_by_asset_id(params[:id])
        @@del_media.destroy
      end

      private 
      
      def params_media
        params.permit(:asset_id, :account_id, :media_type)
      end
    end
  end
end
