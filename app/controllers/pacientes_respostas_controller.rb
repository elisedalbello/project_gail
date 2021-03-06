class PacientesRespostasController < ApplicationController

  # POST /paciente_resposta
  # POST /paciente_resposta.json
  def responder

    @paciente_resposta = PacienteResposta.new(params[:paciente_resposta])

    @alternativa_selecionada = Alternativa.find(@paciente_resposta.alternativa_id, @paciente_resposta.questao_id ,@paciente_resposta.avaliacao_id)

    respond_to do |format|

      if(!session[:respostas])
        session[:respostas] = []
      end

      session[:respostas].push(@paciente_resposta)

      @proxima_questao = @alternativa_selecionada.proxima_questao

      if (!@proxima_questao)

          format.html { redirect_to resultado_path(@paciente_resposta.paciente_id) }
      else
       format.html { redirect_to  @proxima_questao}
     end
    end


  end

end
