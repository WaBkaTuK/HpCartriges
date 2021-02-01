class PrintersController < ApplicationController
  def index
    @printers = Printer.order("id desc").all
  end

  def show
    @printer = Printer.find(params[:id])
  end

  def new
    @printer = Printer.new
  end

  def edit
    @printer = Printer.find(params[:id])
  end

  def create
    printer_params[:photo].original_filename = "#{Time.now.to_i}" << printer_params[:photo].original_filename

    file_upload(printer_params[:photo])

    @printer = Printer.new(
      :title => printer_params[:title],
      :description => printer_params[:description],
      :cartrige_id => printer_params[:cartrige_id],
      :photo => printer_params[:photo].original_filename)

    if @printer.save
      redirect_to @printer
    else
      render "new"
    end
  end

  def update
    @printer = Printer.find(params[:id])
    file_remove(@printer.photo)
    printer_params[:photo].original_filename = "#{Time.now.to_i}" << printer_params[:photo].original_filename
    file_upload(printer_params[:photo])

    if @printer.update(
      :title => printer_params[:title],
      :description => printer_params[:description],
      :cartrige_id => printer_params[:cartrige_id],
      :photo => printer_params[:photo].original_filename)
      redirect_to @printer
    else
      render "edit"
    end
  end

  def destroy
    @printer = Printer.find(params[:id])
    file_remove(@printer.photo)

    @printer.destroy
    redirect_to printers_path
  end

  private
  def printer_params
    params.require(:printer).permit(:title,:description,:cartrige_id,:photo)
  end

  def file_remove(file_name)
    File.delete(Rails.root.join('app','assets','images','printers',
       file_name)) if File.exist?(Rails.root.join('app','assets','images','printers',
          file_name))
  end

  def file_upload(file)
    File.open(Rails.root.join('app','assets','images','printers',
       file.original_filename), 'wb') do |f|
       f.write(file.read)
    end
  end
end
