class PacientesRespostasController < ApplicationController
  # GET /paciente_resposta
  # GET /paciente_resposta.json
  def index
    @paciente_resposta = Paciente_resposta.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @paciente_resposta }
    end
  end

  # GET /paciente_resposta/1
  # GET /paciente_resposta/1.json
  def show
    @paciente_resposta = Paciente_resposta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @paciente_resposta }
    end
  end

  # GET /paciente_resposta/new
  # GET /paciente_resposta/new.json
  def new
    @paciente_resposta = Paciente_resposta.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @paciente_resposta }
    end
  end

  # GET /paciente_resposta/1/edit
  def edit
    @paciente_resposta = Paciente_resposta.find(params[:id])
  end

  # POST /paciente_resposta
  # POST /paciente_resposta.json
  def create
    @paciente_resposta = Paciente_resposta.new(params[:paciente_resposta])

    respond_to do |format|
      if @paciente_resposta.save
        format.html { redirect_to @paciente_resposta, :notice => 'Paciente resposta was successfully created.' }
        format.json { render :json => @paciente_resposta, :status => :created, location: @paciente_resposta }
      else
        format.html { render :action => "new" }
        format.json { render :json => @paciente_resposta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /paciente_resposta/1
  # PUT /paciente_resposta/1.json
  def update
    @paciente_resposta = Paciente_resposta.find(params[:id])

    respond_to do |format|
      if @paciente_resposta.update_attributes(params[:paciente_resposta])
        format.html { redirect_to @paciente_resposta, :notice => 'Paciente resposta was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @paciente_resposta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /paciente_resposta/1
  # DELETE /paciente_resposta/1.json
  def destroy
    @paciente_resposta = Paciente_resposta.find(params[:id])
    @paciente_resposta.destroy

    respond_to do |format|
      format.html { redirect_to paciente_resposta_url }
      format.json { head :no_content }
    end
  end
end
