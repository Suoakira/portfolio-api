class Api::V1::ContactController < ApplicationController


    def index
        @contact = Contact.all 
        render json: @contact
    end

    def show
        @contact = Contact.find_by(id: params[:id])
        if @contact
            render json: @contact
        else
            render json: {error: 'contact not found.'}, status: 400
        end
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            render json: @contact
        else
            render json: {error: 'Unable to create contact.'}, status: 400
        end
    end

    def destroy
        @contact = Contact.find_by(id: params[:id])
        if @contact
        @contact.destroy()
            render json: {message: 'contact has been deleated!'}
        else
            render json: {error: 'contact not found.'}, status: 400
        end
    end

    def update
        @contact = Contact.find_by(id: params[:id])
        if @contact.update(contact_params)
            render json: @contact
        else
            render json: {error: 'Unable to update contact.'}, status: 400
        end
    end

    private


    def contact_params
        params.require(:contact).permit(:name, :subject, :email, :context)
    end


end
