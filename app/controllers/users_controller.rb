class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @entries = @user.entries.order(date: :desc)
    @photos = @user.photos
    @relation = current_user.relation_to(@user) if current_user
    if @entries.any?
      @activity = get_activity(@entries)
    end
  end

  def index
    if params[:search]
      @users = User.search(params[:search]).page(params[:page]).per(5)
    else
      @users = User.page(params[:page]).per(5)
    end
    if current_user
      @friends = current_user.friends
    end
    @friendship = Friendship.new
  end
end

def convert_month(month_number)
  months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep',
    'Oct', 'Nov', 'Dec'
  ]
  months[month_number - 1]
end

def get_activity(entries)
  start_date = entries.last.date
  start_date = start_date - (start_date.day - 1)
  today = Date.today
  date = start_date
  months = []
  sessions = []
  while (date <= today)
    months << convert_month(date.month) + ", " + date.year.to_s
    sessions << entries.where(date: date..(date >> 1) - 1).length
    date = date >> 1
  end
  { months: months, sessions: sessions }
end
