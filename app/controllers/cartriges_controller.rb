class CartrigesController < ApplicationController
  def index
    @cartriges = Cartrige.order("id desc").all
  end

  def show
    @cartrige = Cartrige.find(params[:id])
  end

  def new
    @cartrige = Cartrige.new
  end

  def edit
    @cartrige = Cartrige.find(params[:id])
  end

  def create
    cartrige_params[:photo].original_filename = "#{Time.now.to_i}" << cartrige_params[:photo].original_filename

    #File.open(Rails.root.join('app','assets','images',
      #cartrige_params[:photo].original_filename), 'wb') do |f|
        #f.write(cartrige_params[:photo].read)
      #end
    file_upload(cartrige_params[:photo])


    @cartrige = Cartrige.new(
      :title => cartrige_params[:title],
      :description => cartrige_params[:description],
      :color => cartrige_params[:color],
      :resource => cartrige_params[:resource],
      :photo => cartrige_params[:photo].original_filename)
    if @cartrige.save
       redirect_to @cartrige
    else
      render "new"
    end
  end

  def update
    @cartrige = Cartrige.find(params[:id])
    file_remove(@cartrige.photo)
    cartrige_params[:photo].original_filename = "#{Time.now.to_i}" << cartrige_params[:photo].original_filename
    file_upload(cartrige_params[:photo])

    if @cartrige.update(
      :title => cartrige_params[:title],
    :description => cartrige_params[:description],
    :color => cartrige_params[:color],
    :resource => cartrige_params[:resource],
    :photo => cartrige_params[:photo].original_filename)
      redirect_to @cartrige
    else
      render "edit"
    end
  end

  def destroy
    @cartrige = Cartrige.find(params[:id])
    file_remove(@cartrige.photo)

   @cartrige.destroy
   redirect_to cartriges_path
  end

private
  def cartrige_params
    params.require(:cartrige).permit(:title,:description,:color,:resource,:photo)
  end

  def file_remove(file_name)
    File.delete(Rails.root.join('app','assets','images','cartriges',
       file_name)) if File.exist?(Rails.root.join('app','assets','images','cartriges',
          file_name))
  end

  def file_upload(file)
    File.open(Rails.root.join('app','assets','images','cartriges',
       file.original_filename), 'wb') do |f|
       f.write(file.read)
    end
  end
end
