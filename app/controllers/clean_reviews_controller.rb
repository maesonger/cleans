class CleanReviewsController < ApplicationController
  def index
    
    # 【吉田コメント : こういう風に、Rails 的に実装できます！】
    # id で検索をする場合は、find_by じゃなく find で良いですよ！
    @company = CleanCompany.find(params[:clean_company_id])
    @reviews = @company.clean_reviews
  end
  
  def new
    @review = CleanReview.new
    @company = CleanCompany.find_by(id: params[:clean_company_id])
  end

  def create
    company = CleanCompany.find(params[:clean_company_id])
    @review = company.clean_reviews.new(
      user_id: params[:user_id],
      point: params[:point],
      comment: params[:clean_review][:comment]
    )

    if @review.save
      flash[:success] = 'レビューを投稿しました。'
      redirect_to clean_company_url(company)
    else
      flash.now[:danger] = 'レビューの投稿に失敗しました。'
      render new_clean_company_clean_review_url
    end
  end

  def destroy
  end
  
  private

  # Strong Parameter
  def review_params
    params.require(:clean_review).permit(:user_id, :clean_company_id, :point, :comment)
  end
end
