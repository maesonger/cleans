class CleanThreadsController < ApplicationController
  def show
    @thread = CleanThread.find(params[:id])
    @messages = @thread.messages.order('created_at DESC')
    @company = CleanCompany.find(params[:clean_company_id])
  end

  def new
    @thread = CleanThread.new
    @message = Message.new
    @company = CleanCompany.find(params[:clean_company_id])
    @thread = @company.clean_threads.new(user_id: current_user.id)
    #if current_user.account_type == 1
      #@message = Message.new(clean_thread_id: )
    
    
  end
  
  def create
    
    @company = CleanCompany.find(params[:clean_company_id])
    @thread = @company.clean_threads.new(user_id: current_user.id)
    
    if @thread.save
    
    else
      flash[:danger] = 'メッセージを送信できません。'
      render :new
    end
     
    if current_user.account_type == 1
      @message = @thread.messages.new(clean_thread_id: @thread.id, user_id: current_user.id,content: params[:content])
    else
      @message = @thread.messages.new(clean_thread_id: @thread.id, company_id: params[:clean_company_id],content: params[:content])  
    end

    #binding.pry
    if @message.save
      flash[:success] = 'メッセージを送信しました。'
      redirect_to clean_company_clean_thread_path(params[:clean_company_id],@thread.id)
      
    else
      flash[:danger] = 'メッセージを送信できません。'
      render :new
    end
    
  end
  
  def postshow
    @company = CleanCompany.find(params[:clean_company_id])
    @thread = @company.clean_threads.new(user_id: current_user.id)
  end
  
  def post
    #binding.pry
    #@thread = @company.clean_threads.new(user_id: current_user.id)
    @thread = CleanThread.find(params[:id])
    
     
    if current_user.account_type == 1
      @message = Message.new(clean_thread_id: @thread.id, user_id: current_user.id,content: params[:content])
    else
      @message = Message.new(clean_thread_id: params[:id], clean_company_id: params[:clean_company_id],content: params[:content])  
    end

    if @message.save
      flash[:success] = 'メッセージを送信しました。'
      redirect_to clean_company_clean_thread_path(params[:clean_company_id], @thread.id)
    else
      flash[:danger] = 'メッセージを送信できません。'
      render :new
    end
  end
  
  private
    
  def message_params
    
  end
end