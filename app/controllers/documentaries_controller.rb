class DocumentariesController < ApplicationController
  def show
    @documentary = Documentary.find(params[:id])
    @documentary_user = User.find(@documentary.uploader_user).username
    @review = Review.where({user_id: session[:user_id],
    documentary_id: @documentary.id}).first || Review.new
    @reviews = Review.where('documentary_id' => @documentary.id)
  end

  def new
    @documentary = Documentary.new
    @select_list = ['youtube']
    @category_list = ['Other', 'Rome', 'World War 2', 'World War 1']
  end

  def create
    if !current_user
      redirect_to root_url
    end

    @select_list = ['youtube']
    @category_list = ['Other', 'Rome', 'World War 2', 'World War 1']

    @documentary = Documentary.new(documentary_params)
    @documentary.uploader_user = session[:user_id]
    @documentary.likes = 0
    @documentary.dislikes = 0
    @documentary.total_rating = 0;
    @documentary.thumbnail_url = "https://img.youtube.com/vi/" \
        "#{params[:documentary][:video_source]}/mqdefault.jpg"

    if @documentary.save
      redirect_to root_url :notice => 'Documentary created!'
    else
      flash.now.alert = 'Error'
      render :new
    end
  end

  def edit
    @documentary = Documentary.find(params[:id])

    @select_list = ['youtube']
    @category_list = ['Other', 'Rome', 'World War 2', 'World War 1']
  end

  def update
    @documentary = Documentary.find(params[:id])

    if @documentary.update(documentary_params)
      redirect_to(documentary_path(@documentary))
    else
      render('edit')
    end
  end
end

private
  def documentary_params
    params.require(:documentary).permit(:title,
        :description, :video_source, :video_service, :category)
  end
