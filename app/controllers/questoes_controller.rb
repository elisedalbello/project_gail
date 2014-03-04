class QuestoesController < ApplicationController

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

end
