class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :get_boards

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.get_user_boards current_user, 1
    @subscribed_boards = Board.get_user_boards current_user, 0
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)
    @board.users << current_user
    @board.user_boards[0].owner = 1

    respond_to do |format|
      if @board.save
        format.js { render action: 'create', status: :created, location: @board }
      else
        format.js { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.json { head :no_content }
        format.js {}
      else
        format.json { render json: @board.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end
  
  # DELETE /boards/1
  # generate modal to confirm
  def delete
    @board = Board.find(params[:board_id])
    respond_to do |format|
      format.js {render action: "delete"}
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.js { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:name, :description)
    end
end
