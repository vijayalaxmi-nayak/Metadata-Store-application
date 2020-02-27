module Api
    module V1
      class VideosController < MediasController
        def create
          super
          if (@@media.save)
            render json: { status: 'SUCCESS', message: 'saved video', data: @@media }, status: :ok
          else
            render json: { status: 'ERROR', message: 'failed to save video', data: @@media.errors }, status: :unprocessable_entity
          end
        end
      
        def destroy
          super
          render json: { status: 'SUCCESS', message: 'Deleted video', data: @@del_media }, status: :ok 
        end

        def duration_tc(duration)
          seconds = (duration / 1000) % 60
          #Assume that there are 60 frames per second
          #1 frame = 50 / 3 milliseconds
          frames = ((duration - (seconds * 1000)) * 3 / 50).round
          minutes = (duration / (1000 * 60)) % 60
          hours = (duration / (1000 * 60 * 60)) % 24
          hours = (hours < 10) ? "0" + hours.to_s : hours.to_s
          minutes = (minutes < 10) ? "0" + minutes.to_s : minutes.to_s
          seconds = (seconds < 10) ? "0" + seconds.to_s : seconds.to_s
          frames = (frames < 10) ? "0" + frames.to_s : frames.to_s
          return hours.to_s + ":" + minutes.to_s + ":" + seconds.to_s + ":" + frames.to_s
        end
      end
    end
  end