class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  def batch_registration
  end

  def batch_create
    params.permit!
    date = params['date'].to_date
    if date.wday != 1
      flash.now[:alert] = '月曜日の日付を入力してね'
      render :batch_registration
    else
      set_menu_batch(date)
    end
    redirect_to(menus_url)
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def eat_time_to_s(eat_time)
    case eat_time
    when 1
      '朝食'
    when 2
      '昼食'
    when 3
      '夕食'
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_menu
    @menu = Menu.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def menu_params
    params.require(:menu).permit(:menu1, :menu2, :date, :time, :user_id)
  end

  def set_menu_batch(date)
    suc = true
    al = '重複しているデータが存在します<br/><pre>'
    (1..7).each do |id|
      (1..3).each do |eat_time|
        @menu = Menu.new
        @menu.menu1 = params['menus'][id.to_s][eat_time.to_s]['menu1']
        @menu.menu2 = params['menus'][id.to_s][eat_time.to_s]['menu2']
        @menu.date  = date
        @menu.user_id = current_user.id
        @menu.time = eat_time
        if @menu.save
          current_user.points += 1
        else
          suc = false
          al << "\t" + date.to_s + 'の' + eat_time_to_s(eat_time) + 'は存在します<br/>'
        end
      end
      date += 1
    end
    flash[:alert] = al << '</pre>' unless suc
  end
end
