class CleanPrefecturesController < ApplicationController
  def new
    @prefecture = CleanPrefecture.new
  end
  
  def create

    if params[:prefecture_id].nil?
      # 完璧に正しくありませんが、このようにすると動きます
      @prefecture = CleanPrefecture.new
      flash.now[:danger] = '作業可能地域が入力されていません。'
      render :new and return
    end


    @prefecture = CleanPrefecture.new
    
    
    params[:prefecture_id].each do |p|

      # ブラウザバックの考慮として、既に都道府県が登録されている場合は、ループをスキップする
      if CleanPrefecture.exists?(clean_company_id: params[:clean_company_id], prefecture_id: p.to_i)
        next
      end

      @prefecture = CleanPrefecture.new(
        clean_company_id: params[:clean_company_id],
        prefecture_id: p.to_i
      )
      #binding.pry
      if @prefecture.save
        flash.now[:success] = '作業地域の登録しました。'
        next
      else
        flash.now[:danger] = '作業地域の登録に失敗しました。'
        render :new and return
      end
      
    end
    
    redirect_to new_clean_company_clean_charge_path(params[:clean_company_id]) and return
  end
  
  def edit
    @prefecture = CleanPrefecture.find(params[:clean_company_id])
  end
  
  def update
    if params[:prefecture_id].nil?
      # 完璧に正しくありませんが、このようにすると動きます
      @prefecture = CleanPrefecture.find(params[:clean_company_id])
      flash.now[:danger] = '作業可能地域が入力されていません。'
      render :edit and return
    end
    
    params[:prefecture_id].each do |p|

      # ブラウザバックの考慮として、既に都道府県が登録されている場合は、ループをスキップする
      if CleanPrefecture.exists?(clean_company_id: params[:clean_company_id], prefecture_id: p.to_i)
        next
      end

      #binding.pry
      if @prefecture = CleanPrefecture.update(clean_company_id: params[:clean_company_id],prefecture_id: p.to_i)
        flash.now[:success] = '作業地域の登録しました。'
        redirect_to clean_company_path(params[:clean_company_id]) and return
      else
        flash.now[:danger] = '作業地域の登録に失敗しました。'
        render :edit and return
      end
      
    end
    
  end
  
end
