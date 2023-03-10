class NumbersController < ApplicationController
  before_action :set_number, only: %i[ show edit update destroy ]

  # GET /numbers or /numbers.json
  def index
    @numbers = Number.all
  end

  # GET /numbers/1 or /numbers/1.json
  def show
  end

  # GET /numbers/new
  def new
    @number = Number.new
  end

  # GET /numbers/1/edit
  def edit
  end

  # POST /numbers or /numbers.json
  def create
    @number = Number.new(number_params)

    respond_to do |format|
      if @number.save
        format.html { redirect_to number_url(@number), notice: "Number was successfully created." }
        format.json { render :show, status: :created, location: @number }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /numbers/1 or /numbers/1.json
  def update
    respond_to do |format|
      if @number.update(number_params)
        format.html { redirect_to number_url(@number), notice: "Number was successfully updated." }
        format.json { render :show, status: :ok, location: @number }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /numbers/1 or /numbers/1.json
  def destroy
    @number.destroy

    respond_to do |format|
      format.html { redirect_to numbers_url, notice: "Number was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /
  def root
    @number = Number.new(value: 3)
    @rows = [
      # ['',2,3,5],
      # [2,4,6,10],
      # [3,6,9,15],
      # [5,10,15,25]
    ]
    if params[:number]
      @number = Number.new(number_params)
      if @number.valid?
        @number.generate_primes(@number.value)
        @rows = @number.generate_multiplication_table
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number
      @number = Number.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def number_params
      params.require(:number).permit(:value, :prime)
    end
end
