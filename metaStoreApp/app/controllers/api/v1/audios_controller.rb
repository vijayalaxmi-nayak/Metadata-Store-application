module Api
  module V1
    class AudiosController < MediasController
      def create
        super
        if (@@media.save)
          render json: { status: 'SUCCESS', message: 'saved audio', data: @@media }, status: :ok
        else
          render json: { status: 'ERROR', message: 'failed to save audio', data: @@media.errors }, status: :unprocessable_entity
        end
      end
    
      def destroy
        super
        render json: { status: 'SUCCESS', message: 'Deleted audio', data: @@del_media }, status: :ok 
      end

      def duration_tc(duration)
        milliseconds = (duration % 1000)
        seconds = (duration / 1000) % 60
        minutes = (duration / (1000 * 60)) % 60
        hours = (duration / (1000 * 60 * 60)) % 24
        hours = (hours < 10) ? "0" + hours.to_s : hours.to_s
        minutes = (minutes < 10) ? "0" + minutes.to_s : minutes.to_s
        seconds = (seconds < 10) ? "0" + seconds.to_s : seconds.to_s
        return hours.to_s + ":" + minutes.to_s + ":" + seconds.to_s + "." + milliseconds.to_s
      end
    end
  end
end