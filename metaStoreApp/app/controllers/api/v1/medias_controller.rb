module Api
    module V1
        class MediasController < AccountsController

            def index
                medias = Media.all
                render json: {status: 'SUCCESS', message:'Loaded medias', data: medias}, status: :ok 
            end

            def show
               media = Media.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded media', data: media}, status: :ok 
            end

            def create
                media = Media.new(params_media)

                if (media.save)
                    render json: {status: 'SUCCESS', message:'saved media', data: media}, status: :ok
                else
                    render json: {status: 'ERROR', message:'failed to save media', data: media.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                media1 = Media.find_by_asset_id(params[:id])
                media1.destroy
                render json: {status: 'SUCCESS', message:'Deleted media', data: media1}, status: :ok 
            end

            private def params_media
                params.permit(:asset_id,:title,:duration,:location,:recorded_time,:account_id)
            end

        
        end
    end
end
