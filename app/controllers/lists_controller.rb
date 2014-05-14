class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy, :delete]
  before_action :get_boards

  # GET /lists
  # GET /lists.json
  def index
    @board = Board.find params[:board_id]
    @owner = UserBoard.owner? current_user, @board
    @lists = @board.lists.order(:order)
    @lists_size = List.get_size @board
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @board = Board.find params[:board_id]
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    name, board_id = params[:name], params[:board_id]
    @list = List.new
    @list.name = name
    @list.board_id = board_id
    @list.order = List.get_max_order board_id
    @lists_size = List.get_size board_id
    respond_to do |format|
      if @lists_size < 6 && @list.save
        @lists_size += 1
        format.js { render action: 'create', status: :created, location: @list}
      else
        format.js { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /lists/1
  # generate modal to confirm
  def delete
    respond_to do |format|
      format.js {render action: "delete"}
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy    
    respond_to do |format|
      format.js { }
    end
  end
  
  # POST /boards/1/lists/sort
  # Sort lists
  def sort
    i = 0;
    list_orders = Hash[params[:list].to_a.map {|k| [k, i+=1]}]
    lists = Board.find(params[:board_id]).lists.order(:order)
    lists.each do |list|
      list.order = list_orders[list.id.to_s]
      list.save
    end
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :board_id)
    end
end
