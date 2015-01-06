class EventsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @event=Event.new
    render :new
  end
  def create
    if (event_params["date"].split(",").count>1)
      event_params["date"].split(",").each do |event_date|
        p event_date
          current_user.events.create(:title=> event_params["title"],
            :description=> event_params["description"],
            :date=> event_date,
            :address=> event_params["address"],
            :area=> event_params["area"],
            :zipcode=> event_params["zipcode"],
            :eventTime=> event_params["eventTime"],
            :cost=> event_params["cost"],
            :category=> event_params["category"],
            :city=> event_params["cirt"],
            )
      end
    else
      current_user.events.create(event_params)
    end
    redirect_to "/"
  end
  def show
    @event =Event.find(params[:id])
     respond_to do| format|
      format.json{
        render :json => @event.to_json
      }

    end
  end
  def index
    @events=current_user.events.where(date: Date.today..1.month.from_now)

  end

  def edit
    @event=current_user.events.find(params[:id])

  end
   def update
    @event = current_user.events.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Profile updated"
      redirect_to "/"
    else
      render 'edit'
    end
  end

  def destroy
    @event=current_user.events.find(params[:id])
    @event.destroy

    redirect_to events_path
  end
  private
  def event_params
    params.require(:event).permit(:title,:description,:date,:address,:city,:area,:zipcode,:eventTime,:cost,:category,:latitude,:longtitude)
  end
end

