module Api
    module V1
        class AccountsController < ApplicationController

            def index
                accounts = Account.all;
                render json: {status: 'SUCCESS', message:'Loaded accounts', data: accounts}, status: :ok 
            end

            def show
                account = Account.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded account', data: account}, status: :ok 
            end

            def create
                account = Account.new(params_account)
                print "\n--------------------------------\n"
                print params_account
                print "\n--------------------------------\n"
                print account
                print "\n--------------------------------\n"
                if account.save
                    render json: {status: 'SUCCESS', message:'Saved account', data: account}, status: :ok 
                else
                    render json: {status: 'ERROR', message:'Account not saved', data: account.errors}, status: :unprocessable_entity
                end 
            end

            def destroy
                account = Account.find(params[:id])
                account.destroy
                render json: {status: 'SUCCESS', message:'Deleted account', data: account}, status: :ok 
            end

            def update
                account = Account.find(params[:id])
                if account.update_attributes(params_account)
                    render json: {status: 'SUCCESS', message:'Updated account', data: account}, status: :ok 
                else
                    render json: {status: 'ERROR', message:'Account not updated', data: account.errors}, status: :unprocessable_entity
                end
            end

            def showmedia
                account = Account.find(params[:id])
                medias = account.medias.all
                render json: {status: 'SUCCESS', message:'Loaded media', data: medias}, status: :ok 
            end

            private def params_account
                params.permit(:code,:name,:password)
            end
        end
    end
end