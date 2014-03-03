class QuestoesController < ApplicationController
  # GET /questao
  # GET /questao.json
  def index
    @questao = Questao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @questao }
    end
  end

  # GET /questao/1
  # GET /questao/1.json
  def show
    @questao = Questao.find(params[:id])
    @paciente_resposta = PacienteResposta.new
    @paciente = session[:paciente]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @questao }
    end
  end

  # GET /questao/new
  # GET /questao/new.json
  def new
    @questao = Questao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @questao }
    end
  end

  # GET /questao/1/edit
  def edit
    @questao = Questao.find(params[:id])
  end

  # POST /questao
  # POST /questao.json
  def create
    @questao = Questao.new(params[:questao])

    respond_to do |format|
      if @questao.save
        format.html { redirect_to @questao, :notice => 'Questao was successfully created.' }

      else
        format.html { render :action => "new" }
        format.json { render :json => @questao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questao/1
  # PUT /questao/1.json
  def update
    @questao = Questao.find(params[:id])

    respond_to do |format|
      if @questao.update_attributes(params[:questao])
        format.html { redirect_to @questao, :notice => 'Questao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @questao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questao/1
  # DELETE /questao/1.json
  def destroy
    @questao = Questao.find(params[:id])
    @questao.destroy

    respond_to do |format|
      format.html { redirect_to questao_url }
      format.json { head :no_content }
    end
  end
end
