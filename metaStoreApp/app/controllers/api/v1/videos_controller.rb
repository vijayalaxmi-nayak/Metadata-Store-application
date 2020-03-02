module Api
    module V1
      class VideosController < MediasController
        # creates a new video
        api :POST, '/videos/', "Creates a new video"
        param :asset_id, String, :desc => "Asset Id", :required => true
        param :media_type, String, :desc => "Media Type(Audio or Video)", :required => true
        param :account_id, String, :desc => "Account Id", :required => true
        param :title, String, :desc => "Title of the video"
        param :duration, :number, :desc => "Duration of the video in milliseconds"
        param :location, String, :desc => "File location where the video is stored"
        param :recorded_time, String, :desc => "Recorded time of the video"
        example %(
        POST api/v1/videos
        Input:
        {
        "asset_id":"VH100",
        "media_type":"video",
        "account_id":"2"
        }
      
        Server response:
        {
        "status": "SUCCESS",
        "message": "saved video",
        "data": {
          "asset_id": "VH100",
          "media_type": "video",
          "account_id": 2,
          "title": null,
          "duration": 0,
          "location": null,
          "recorded_time": null,
          "timecode": null,
          "created_at": "2020-03-02T11:29:48.000Z",
          "updated_at": "2020-03-02T11:29:48.000Z"
        }
        }
        )
        def create
          super
          if (@@media.save)
            render json: { status: 'SUCCESS', message: 'saved video', data: @@media }, status: :ok
          else
            render json: { status: 'ERROR', message: 'failed to save video', data: @@media.errors }, status: :unprocessable_entity
          end
        end
      
        # deletes a specific video based on asset_id
        api :DELETE, '/videos/:id', "Deletes a specific video based on asset_id"
        param :asset_id, String, :desc => "Asset Id"
        example %(
        DELETE api/v1/videos/VH100
        {
        "status": "SUCCESS",
        "message": "Deleted video",
        "data": {
          "asset_id": "VH100",
          "media_type": "video",
          "account_id": 2,
          "title": null,
          "duration": 0,
          "location": null,
          "recorded_time": null,
          "timecode": null,
          "created_at": "2020-03-02T11:29:48.000Z",
          "updated_at": "2020-03-02T11:29:48.000Z"
        }
        }
        )
        def destroy
          super
          render json: { status: 'SUCCESS', message: 'Deleted video', data: @@del_media }, status: :ok 
        end
      end
    end
  end
