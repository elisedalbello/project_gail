class PacientesRespostasController < ApplicationController
  
  # POST /paciente_resposta
  # POST /paciente_resposta.json
  def create
        
    @paciente_resposta = PacienteResposta.create(params[:paciente_resposta])

    @questao = Questao.find(@paciente_resposta.questao_id, @paciente_resposta.avaliacao_id)

    respond_to do |format|
    
      if @paciente_resposta.save
        format.html { redirect_to @questao.next }
        #format.json { render :json => @paciente_resposta, :status => :created, location: @paciente_resposta }
      else
        #format.html { render :action => "new" }
        #format.json { render :json => @paciente_resposta.errors, :status => :unprocessable_entity }
      end
    end
  end

end
