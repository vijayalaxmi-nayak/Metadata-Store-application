module Api
  module V1
    class AudiosController < MediasController
      # creates a new audio
      api :POST, '/audios/', "Creates a new audio"
      param :asset_id, String, :desc => "Asset Id", :required => true
      param :media_type, String, :desc => "Media Type(Audio or Video)", :required => true
      param :account_id, String, :desc => "Account Id", :required => true
      param :title, String, :desc => "Title of the audio"
      param :duration, :number, :desc => "Duration of the audio in milliseconds"
      param :location, String, :desc => "File location where the audio is stored"
      param :recorded_time, String, :desc => "Recorded time of the audio"
      example %(
      POST api/v1/audios
      Input:
      {
      "asset_id":"AH100",
      "media_type":"audio",
      "account_id":"2"
      }
    
      Server response:
      {
      "status": "SUCCESS",
      "message": "saved audio",
      "data": {
        "asset_id": "AH100",
        "media_type": "audio",
        "account_id": 2,
        "title": null,
        "duration": 0,
        "location": null,
        "recorded_time": null,
        "timecode": null,
        "created_at": "2020-03-02T11:27:56.000Z",
        "updated_at": "2020-03-02T11:27:56.000Z"
      }
      }
      )
      def create
        super
        if (@@media.save)
          render json: { status: 'SUCCESS', message: 'saved audio', data: @@media }, status: :ok
        else
          render json: { status: 'ERROR', message: 'failed to save audio', data: @@media.errors }, status: :unprocessable_entity
        end
      end
    
      # deletes a specific audio based on asset_id
      api :DELETE, '/audios/:id', "Deletes a specific audio based on asset_id"
      param :asset_id, String, :desc => "Asset Id"
      example %(
      DELETE api/v1/audios/AH100
      {
      "status": "SUCCESS",
      "message": "Deleted audio",
      "data": {
        "asset_id": "AH100",
        "media_type": "audio",
        "account_id": 2,
        "title": null,
        "duration": 0,
        "location": null,
        "recorded_time": null,
        "timecode": null,
        "created_at": "2020-03-02T11:27:56.000Z",
        "updated_at": "2020-03-02T11:27:56.000Z"
      }
      }
      )
      def destroy
        super
        render json: { status: 'SUCCESS', message: 'Deleted audio', data: @@del_media }, status: :ok 
      end
    end
  end
end
