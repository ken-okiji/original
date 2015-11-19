class RecordsController < ApplicationController
    before_action :authenticate_user!
    
    def new
      @user = current_user
      @record = Record.new
    end
    
    def index
      @user = current_user
      @records= @user.records.order(date: :desc)
    end
  
    def show
      @user = current_user
      @record = Record.find(params[:id])
    end
    
    def edit
      @user = current_user
      @record = Record.find(params[:id])
    end

    def update
      @record = Record.find(params[:id])
      
      if @record.update(record_params)
        redirect_to records_path , notice: 'メッセージを編集しました'
      else
        render 'edit'
      end
    end
  
    def create
      @user = current_user
      
      @record = current_user.records.build(record_params)
      if @record.save
        flash[:success] = "登録が完了しました"
        redirect_to records_path
      else
        render 'users/show'
      end
    end
    
    def destroy
      @record = Record.find(params[:id])
      @record.destroy
      redirect_to records_path, notice: 'メッセージを削除しました'
    end

    private
    def record_params
      params.require(:record).permit(:date, :opponent_team, :content, :score, :goal, :assist, :participation_time, :redcard, :yellowcard)
    end
    
end