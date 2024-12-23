class LinksController < ApplicationController
  before_action :prevent_unauthorized_user_access, only: [:new, :edit]
  before_action :prevent_unauthorized_user_access, except: [:show, :index]
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to root_path, notice: 'Link successfully created'
    else
      render :new
    end
  end

  def show
    @link = Link.find_by(id: params[:id])
    @comments = @link.comments
    @links = Link.all   
    unless @link
      redirect_to root_path, notice: "Link not found."
    end
  end

  def edit
    link = Link.find_by(id: params[:id])

    if current_user.owns_link?(link)
      @link = link
    else
      redirect_to root_path, notice: 'Not authorized to edit this link'
    end
  end

  def update
    @link = current_user.links.find_by(id: params[:id])

    if @link.update(link_params)
      redirect_to root_path, notice: 'Link successfully updated'
    else
      render :edit
    end
  end


  def destroy
    link = Link.find_by(id: params[:id])

    if current_user.owns_link?(link)
      link.destroy
      redirect_to root_path, notice: 'Link successfully deleted'
    else
      redirect_to root_path, notice: 'Not authorized to delete this link'
    end
  end

  def upvote
    link = Link.find_by(id: params[:id])

    if current_user.upvoted?(link)
      current_user.remove_vote(link)
    elsif current_user.downvoted?(link)
      current_user.remove_vote(link)
      current_user.upvote(link)
    else
      current_user.upvote(link)
    end

    redirect_to root_path
  end



  def downvote
    link = Link.find_by(id: params[:id])

    if current_user.downvoted?(link)
      current_user.remove_vote(link)
    elsif current_user.upvoted?(link)
      current_user.remove_vote(link)
      current_user.downvote(link)
    else
      current_user.downvote(link)
    end

    redirect_to root_path
  end

  def showcase
    @showcase_links = Link.where("LOWER(title) LIKE ?", "showcase:%")
  end

  def generate_summary
    @link = Link.find(params[:id])
  
    # Generate the summary
    @link.update(summary: scrape_summary(@link.url))
    
    respond_to do |format|
      format.js  
      format.html { redirect_to show_summary_link_path(@link), notice: 'Summary generated!' }
    end
  end
  
  def show_summary
    @link = Link.find(params[:id]) 
  end
  

  private

  def link_params
    params.require(:link).permit(:title, :url, :description)
  end

  def scrape_summary(url)
    require 'nokogiri'
    require 'open-uri'

    begin
      
      doc = Nokogiri::HTML(URI.open(url))
      description =doc.at('span').text.strip if doc.at('span')

      

      # description ||= "No meta description found."

    rescue OpenURI::HTTPError => e
      description = "Failed to fetch summary. Error: #{e.message}"
    rescue StandardError => e
      description = "An error occurred: #{e.message}"
    end

    description
  end
end
