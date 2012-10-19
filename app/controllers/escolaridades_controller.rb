class EscolaridadesController < ApplicationController
  # GET /escolaridades
  # GET /escolaridades.json
  def index
    @escolaridades = Escolaridade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json @escolaridades }
    end
  end

  # GET /escolaridades/1
  # GET /escolaridades/1.json
  def show
    @escolaridade = Escolaridade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json @escolaridade }
    end
  end

  # GET /escolaridades/new
  # GET /escolaridades/new.json
  def new
    @escolaridade = Escolaridade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json @escolaridade }
    end
  end

  # GET /escolaridades/1/edit
  def edit
    @escolaridade = Escolaridade.find(params[:id])
  end

  # POST /escolaridades
  # POST /escolaridades.json
  def create
    @escolaridade = Escolaridade.new(params[:escolaridade])

    respond_to do |format|
      if @escolaridade.save
        format.html { redirect_to @escolaridade, :notice 'Escolaridade was successfully created.' }
        format.json { render :json @escolaridade, :status :created, location: @escolaridade }
      else
        format.html { render :action "new" }
        format.json { render :json @escolaridade.errors, :status :unprocessable_entity }
      end
    end
  end

  # PUT /escolaridades/1
  # PUT /escolaridades/1.json
  def update
    @escolaridade = Escolaridade.find(params[:id])

    respond_to do |format|
      if @escolaridade.update_attributes(params[:escolaridade])
        format.html { redirect_to @escolaridade, :notice 'Escolaridade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action "edit" }
        format.json { render :json @escolaridade.errors, :status :unprocessable_entity }
      end
    end
  end

  # DELETE /escolaridades/1
  # DELETE /escolaridades/1.json
  def destroy
    @escolaridade = Escolaridade.find(params[:id])
    @escolaridade.destroy

    respond_to do |format|
      format.html { redirect_to escolaridades_url }
      format.json { head :no_content }
    end
  end
end
