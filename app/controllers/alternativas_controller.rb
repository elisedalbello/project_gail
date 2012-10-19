#alteração pra testar o commit


class AlternativasController < ApplicationController
  # GET /alternativas
  # GET /alternativas.json
  def index
    @alternativas = Alternativa.all

    respond_to do |format|
      format.html # index.html.erb
      format.json{render :json @alternativas}
    end
  end

  # GET /alternativas/1
  # GET /alternativas/1.json
  def show
    @alternativa = Alternativa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json @alternativa }
    end
  end

  # GET /alternativas/new
  # GET /alternativas/new.json
  def new
    @alternativa = Alternativa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json @alternativa }
    end
  end

  # GET /alternativas/1/edit
  def edit
    @alternativa = Alternativa.find(params[:id])
  end

  # POST /alternativas
  # POST /alternativas.json
  def create
    @alternativa = Alternativa.new(params[:alternativa])

    respond_to do |format|
      if @alternativa.save
        format.html { redirect_to @alternativa, :notice 'Alternativa was successfully created.' }
        format.json { render :json @alternativa, :status :created, location: @alternativa }
      else
        format.html { render :action "new" }
        format.json { render :json @alternativa.errors, :status :unprocessable_entity }
      end
    end
  end

  # PUT /alternativas/1
  # PUT /alternativas/1.json
  def update
    @alternativa = Alternativa.find(params[:id])

    respond_to do |format|
      if @alternativa.update_attributes(params[:alternativa])
        format.html { redirect_to @alternativa, :notice 'Alternativa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action "edit" }
        format.json { render :json @alternativa.errors, :status :unprocessable_entity }
      end
    end
  end

  # DELETE /alternativas/1
  # DELETE /alternativas/1.json
  def destroy
    @alternativa = Alternativa.find(params[:id])
    @alternativa.destroy

    respond_to do |format|
      format.html { redirect_to alternativas_url }
      format.json { head :no_content }
    end
  end
end
