class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Post was successfully created.' }
        format.json { render json: @course, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def bookmarked
    @courses = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  def result
    ids = Staff.where("name like '%" + params[:s] + "%'").map(&:courses).flatten(1).map(&:id)
    @results = Course.where("name like '%" + params[:n] + "%' AND 
                            institute like '%" + params[:i] + "%' AND
                            catalog_number like '%" + params[:c] + "%' AND
                            ec like '%" + params[:ec] + "%' AND
                            description like '%" + params[:d] + "%' AND
                            id in (?) AND
                            maximum like '%" + params[:m] + "%' AND
                            period like '%" 'semester ' + params[:p] + "%' AND
                            blok like '%" + params[:b] + "%'", ids)
    end
    respond_to do |format|
      format.html 
      format.json { render json: @results }
  end

def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
end