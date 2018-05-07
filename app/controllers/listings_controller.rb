class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :verify]
  # GET /listings
  # GET /listings.json
  def index
    if params == ""
      @listings = Listing.all.order(:country).paginate(:page => params[:page], :per_page => 9)
    else
      @listings = Listing.property_type(params[:property_type]).paginate(:page => params[:page], :per_page => 9)
    end
  end

  def verify
    @listing = Listing.find(params[:id])
      if @listing.verification == "no" || nil
          @listing.verification = "yes"
          @listing.save
          redirect_to :back
      else
        @listing.verification = "no"
        @listing.save
        redirect_to :back
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show

  end

  # GET /listings/new
     def new
      # authorization code
          @listing = Listing.new
          

      # if current_user.customer?
      #   flash[:notice] = "Sorry. You are not allowed to perform this action."
      #   return redirect_to :back, notice: "Sorry. You do not have the permission to verify a property."
      # end
      # end authorization code

      # other code to make the new action work!
    end

  # GET /listings/1/edit
  def edit
    # if current_user.id != @listing.user_id
    #    return redirect_to :back, notice: "Sorry. You do not have the permission to edit a property."
    # end
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :place_type, :property_type, :room_number, :bed_number, :guest_number, :country, :state, :city, :zipcode, :address, :price, :description, {:images => []})
    end


end
