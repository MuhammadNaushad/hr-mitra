class DocumentsController < ApplicationController
   before_action :set_document, only: [ :show, :edit, :update, :destroy ]

  def index
    @documents = Document.all
  end

  def show
    # @document= Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def edit
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      flash[:success] = "Document successfully created"
      redirect_to documents_path
    else
      puts @document.errors.full_messages
      flash[:error] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @document.update(document_params)
      flash[:success] = "Document was successfully updated"
      redirect_to documents_path
    else
      flash[:error] = "Something went wrong"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @document.destroy
    flash[:success] = "Document was successfully deleted"
    redirect_to documents_path
  end

  private

  def set_document
    @document = Document.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    flash[:success] = error
    redirect_to documents_path
  end

  def document_params
    params.require(:document).permit(
      :name, :doc_type, :employee_id, :image
    )
  end
end
