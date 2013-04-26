class CoursesController < ApplicationController
  def index
    @courses = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    # zips programme together coupling names with links
    names = @course.programmes.map(&:name)
    urls = @course.programmes.map(&:url)
    @programme_names_urls = names.zip(urls)

    # zips staff together coupling names with links
    names = @course.staffs.map(&:name)
    urls = @course.staffs.map(&:url)
    @staff_names_urls = names.zip(urls) 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  def bookmarked
    if !params[:bookmarked_courses].blank?
      @courses = ActiveSupport::JSON.decode(params[:bookmarked_courses])
    end  
      respond_to do |format|
        format.html 
        format.json { render json: @courses }
      end
  end

  def taking
    if !params[:taking_courses].blank?
      @courses = ActiveSupport::JSON.decode(params[:taking_courses])
    end
      respond_to do |format|
        format.html 
        format.json { render json: @courses }
      end
  end

  def recent
    if !params[:recent_courses].blank?
      @courses = ActiveSupport::JSON.decode(params[:recent_courses])
    end

    respond_to do |format|
      format.html 
      format.json { render json: @courses }
    end
  end

  def result
  # checks for all parameters if it exists and searches courses for that parameter
  # adds up parameters if multiple are given
    if !params[:n].blank?
      @results = Course.where("name like '%" + params[:n] + "%'")
    end

    if !params[:i].blank?
      if @results
        @results = @results.where("institute like '%" + params[:i] + "%'")
      else
        @results = Course.where("institute like '%" + params[:i] + "%'")
      end
    end

    if !params[:c].blank?
      if @results
        @results = @results.where("catalog_number like '%" + params[:c] + "%'")
      else
        @results = Course.where("catalog_number like '%" + params[:c].upcase + "%'")
      end
    end

    if !params[:ec].blank?
      if @results
        @results = @results.where("ec like '%" + params[:ec] + "%'")
      else
        @results = Course.where("ec like '%" + params[:ec] + "%'")
      end
    end

    if !params[:m].blank?
      if @results
        @results = @results.where("maximum like '%" + params[:m] + "%'")
      else
      @results = Course.where("maximum like '%" + params[:m] + "%'")
      end
    end

    if !params[:p].blank?
      if @results
        @results = @results.where("period like '%" + params[:p] + "%'")
      else
        @results = Course.where("period like '%" + params[:p] + "%'")
      end
    end

    if !params[:b1].blank?
      if @results
        @results = @results.where("blok like '%" + params[:b1] + "%'")
      else
      @results = Course.where("blok like '%" + params[:b1] + "%'")
      end
    end

    if !params[:b2].blank?
      if @results
        @results = @results.where("blok like '%" + params[:b2] + "%'")
      else
      @results = Course.where("blok like '%" + params[:b2] + "%'")
      end
    end

    if !params[:s].blank?
      ids = Staff.where("name like '%" + params[:s] + "%'").map(&:courses).flatten(1).map(&:id)
      if @results
        @results = @results.where("id in (?)", ids)
      else
        @results = Course.where("id in (?)", ids)
      end
    end

    if (@results)
      @results = @results.paginate(:page => params[:page], :per_page => 10)
    end
    # @results = Course.where("name like '%" + params[:n] + "%' AND 
    #                         institute like '%" + params[:i] + "%' AND
    #                         catalog_number like '%" + params[:c].upcase + "%' AND
    #                         ec like '%" + params[:ec] + "%' AND
    #                         description like '%" + params[:d] + "%' AND
    #                         id in (?) AND
    #                         maximum like '%" + params[:m] + "%' AND
    #                         period like '%" 'semester ' + params[:p] + "%' AND
    #                         blok like '%" + params[:b1] + "%' AND '%" + params[:b2] + "%'", ids)
    
    respond_to do |format|
      format.html 
      format.json { render json: @results }
    end
  end
end