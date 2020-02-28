module Api
  module V1
    class AccountsController < ApplicationController
      # displays the data of all the accounts
      def index
        accounts = Account.all;
        render json: { status: 'SUCCESS', message: 'Loaded accounts', data: accounts }, status: :ok 
      end

      # displays the details of specific account based on the id
      def show
        account = Account.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded account', data: account }, status: :ok 
      end

      # creates a new account
      def create
        account = Account.new(params_account)
        if account.save
          render json: { status: 'SUCCESS', message: 'Saved account', data: account}, status: :ok 
        else
          render json: { status: 'ERROR', message: 'Account not saved', data: account.errors}, status: :unprocessable_entity
        end 
      end
     
      # deletes a specific account based on the id
      def destroy
        account = Account.find(params[:id])
        account.destroy
        render json: { status: 'SUCCESS', message: 'Deleted account', data: account }, status: :ok 
      end

      # updates a specific account based on the id
      def update
        account = Account.find(params[:id])
        if account.update_attributes(params_account)
          render json: { status: 'SUCCESS', message: 'Updated account', data: account }, status: :ok 
        else
          render json: { status: 'ERROR', message: 'Account not updated', data: account.errors }, status: :unprocessable_entity
        end
      end

      # displays medias(audios/videos) of specific account based on the id
      def show_media
        account = Account.find(params[:id])
        medias = account.medias.all
        render json: { status: 'SUCCESS', message: 'Loaded media', data: medias }, status: :ok 
      end

      # displays medias(audios/videos) of specific account based on the account code
      def show_media_by_code
        account = Account.find_by_code(params[:id])
        medias = account.medias.all
        render json: { status: 'SUCCESS', message: 'Loaded media', data: medias }, status: :ok 
      end

      private 
      
      def params_account
        params.permit(:code, :name, :password)
      end
    end
  end
end