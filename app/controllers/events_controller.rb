class EventsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :search_event, only: [:index, :search]

  def index
    @events = Event.all.order(start_date: "ASC")
    @user = User.all
    require 'date'
    @date = DateTime.now
    @notification = Notification.all
    set_event_column
    set_user_column
  end

  def show
    @comment = Comment.new
    @comments = @event.comments.includes(:user)
  end

  def new
    @event = Event.new
  end

  def edit
    unless user_signed_in? && current_user.id == @event.user_id
      redirect_to root_path
    end
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @results = @e.result.includes(:user)
    @events = Event.all.order(start_date: "ASC")
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def search_event
      @e = Event.ransack(params[:q])  
    end

    def set_event_column
      @event_title = Event.select("title").distinct
    end

    def set_user_column
      @user_name = User.select("name").distinct
    end

    def event_params
      params.require(:event).permit(:title, :body, :address, :start_date, :end_date).merge(user_id: current_user.id)
    end
end
