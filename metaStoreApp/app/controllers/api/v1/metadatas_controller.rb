module Api
    module V1
        require 'csv'
        class MetadatasController < MediasController

            def create
                
                print "entered\n"
                Metadata.delete_all
                saved=[]
                unsaved=[]
                CSV.foreach(params[:id], headers: true) do |row|
                    #add_data row.to_hash
                    #metadata = Metadata.new(add_data row.to_hash)
                    #metadata.save
                    print "\n************************\n"
                    print row.to_hash
                    print "\n************************\n"
                    metadata = Metadata.new(row.to_hash)
                    if metadata.save
                        saved.append(row.to_hash)   
                    else
                        unsaved.append(row.to_hash)  
                    end
                end
                render json: {status: 'SUCCESS', message:'Loaded metadata',saved_data:saved,unsaved_data:unsaved}, status: :ok 
            
            end

           

        end
    end
end
