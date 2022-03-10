class DealsController < ApplicationController
  def index
    @users = User.all
    @room = Room.find(params[:room_id])
    @deal = Deals.all
    # @deals = policy_scope(Deal).order(created_at: :desc)
  end

  def new
    @room = Room.find(params[:room_id])
    @deal = Deal.new
    # authorize @deal
  end

  def create
    @deal = Deal.new(order_params)
    @room = Room.find(params[:room_id])
    @deal.room = @room
    @deal.user = current_user
    # authorize @deal

    if @deal.save
      redirect_to rooms_path, notice: 'Deal was successfully created.'
    else
      render :new
    end
  end

  def update
    set_deal
    @deal.update(deal_params)
    redirect_to rooms_path
  end

  def destroy
    set_deal
    @deal.destroy
    redirect_to rooms_path
  end

  def show
    set_deal
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
    # authorize @deal
  end

  def deal_params
    params.require(:deal).permit(
      :room_id,
      :user_id
    )
  end
end
