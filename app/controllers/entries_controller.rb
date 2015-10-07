class EntriesController < ApplicationController
  def show
    @entry = entry.find(params[:id])
  end

  def new
    @entry = Entry.new
    @user = User.find(params[:user_id])
  end

  def create
    @entry = Entry.new(entry_params)
    @user = current_user
    @entry.user = @user
    if @entry.save
      flash[:success] = 'New journal entry created!'
      redirect_to user_path(@user)
    else
      flash[:warning] = @entry.errors.full_messages.join(', ')
      render :new
    end
  end

  protected

  def entry_params
    params.require(:entry).permit(
      :title, :body, :location_id, :country_id, :region_id, :date
    )
  end
end
