module Api
    module V1
        require 'csv'
        class MetadatasController < MediasController

            def add_data
                metadata = Metadata.new(params_metadata)
                metadata.save
            end

            def create
                #params[:file].path
                print "entered\n"
                Metadata.delete_all
                CSV.foreach(params[:id], headers: true) do |row|
                    #add_data row.to_hash
                    #metadata = Metadata.new(add_data row.to_hash)
                    #metadata.save
                    print "\n************************\n"
                    print row.to_hash
                    print "\n************************\n"
                    metadata = Metadata.new(row.to_hash)
                    metadata.save
                end
                render json: {status: 'SUCCESS', message:'Loaded metadata'}, status: :ok 
            
            end

            private def params_metadata1
                params.permit(:media_id,:title,:duration,:location,:recorded_time)
            end
            

        end
    end
end
