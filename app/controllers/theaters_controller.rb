class TheatersController < ApplicationController
  def new
    @theater = Theater.new
  end

  def index
    @theaters = Theater.order( created_at: :desc )

    respond_to do |format|
      format.json do
        render json: @theaters
      end

      format.html
    end
  end

  def show
    @theater = Theater.find(params.fetch(:id))
  end

  def create
    theater_attributes = params.require(:theater).permit(:name, :capacity, :screens)
    @theater = Theater.new(theater_attributes)

    if @theater.valid?
      @theater.save
      redirect_to(theaters_url,  notice: "Theater added successfully." )
    else
      render "new"
    end
  end

  def edit
    @theater = Theater.find(params.fetch(:id))
  end

  def update
    theater = Theater.find(params.fetch(:id))
    theater_attributes = params.require(:theater).permit(:name, :capacity, :screens)

    theater.update(theater_attributes)

    if theater.valid?
      theater.save
      redirect_to( theater_url(theater),  notice: "Theater updated successfully." )
    else
      redirect_to( theater_url(theater),  alert: "Theater failed to update successfully." )
    end
  end

  def destroy
    theater = Theater.find(params.fetch(:id))

    theater.destroy

    redirect_to theaters_url, notice: "Theater removed successfully."
  end
end
