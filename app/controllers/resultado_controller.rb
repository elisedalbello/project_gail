class ResultadoController < ApplicationController

    def show

        @paciente = Paciente.find(params[:id])

        PacienteResposta.salva_resposta(session[:respostas])

        respond_to do |format|

            if(!@paciente)

                format.html { redirect_to root_path, :notice => 'Paciente não encontrado' }
            else
                 @resultado = Avaliacao.calcula_indice_gail(@paciente.id)

                format.html # show.html.erb\
            end
        end
    end

end
