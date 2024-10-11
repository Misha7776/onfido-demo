class WebhookEventsController < ApplicationController
  before_action :set_webhook_event, only: %i[ show edit update destroy ]

  # GET /webhook_events or /webhook_events.json
  def index
    @webhook_events = WebhookEvent.all
  end

  # GET /webhook_events/1 or /webhook_events/1.json
  def show
  end

  # GET /webhook_events/new
  def new
    @webhook_event = WebhookEvent.new
  end

  # GET /webhook_events/1/edit
  def edit
  end

  # POST /webhook_events or /webhook_events.json
  def create
    @webhook_event = WebhookEvent.new(webhook_event_params)

    respond_to do |format|
      if @webhook_event.save
        format.html { redirect_to @webhook_event, notice: "Webhook event was successfully created." }
        format.json { render :show, status: :created, location: @webhook_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @webhook_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webhook_events/1 or /webhook_events/1.json
  def update
    respond_to do |format|
      if @webhook_event.update(webhook_event_params)
        format.html { redirect_to @webhook_event, notice: "Webhook event was successfully updated." }
        format.json { render :show, status: :ok, location: @webhook_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @webhook_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webhook_events/1 or /webhook_events/1.json
  def destroy
    @webhook_event.destroy!

    respond_to do |format|
      format.html { redirect_to webhook_events_path, status: :see_other, notice: "Webhook event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webhook_event
      @webhook_event = WebhookEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def webhook_event_params
      params.fetch(:webhook_event, {})
    end
end
