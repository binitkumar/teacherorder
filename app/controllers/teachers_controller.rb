class TeachersController < ApplicationController
  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teachers }
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teacher }
    end
  end

  # GET /teachers/new
  # GET /teachers/new.json
  def new
    @teacher = Teacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacher }
    end
  end

  # GET /teachers/1/edit
  def edit
    @teacher = Teacher.find(params[:id])
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(params[:teacher])
    TeacherMailer.registration(@teacher.teacher_email).deliver
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to confirmation_teachers_path, notice: 'Order mail sent successfully.' }
        format.json { render json: @teacher, status: :created, location: @teacher }
      else
        format.html { render action: "register" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teachers/1
  # PUT /teachers/1.json
  def update
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url }
      format.json { head :no_content }
    end
  end

  def register
    @teacher = Teacher.new
  end

  def order
    @teacher = Teacher.find_by_teacher_email(params[:email])
    if @teacher
      @order = Order.new
      @order.vendors.build
      @order.vendors.each do |t|
        t.items.build
      end
    else
      render text: "Invalid email", layout: true
    end
  end
end
