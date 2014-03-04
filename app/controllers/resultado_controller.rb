class ResultadoController < ApplicationController

    def show

        @paciente = Paciente.find(params[:id])

        respond_to do |format|

            if(!@paciente)

                format.html { redirect_to root_path, :notice => 'Paciente não encontrado' }
            
            else

                @respostas = session[:respostas]
                
                if(!@respostas.nil? and PacienteResposta.salva_resposta(@respostas))
                    session.clear()
                end
                
                @resultado = Avaliacao.calcula_indice_gail(@paciente.id)

                format.html # show.html.erb
            end
        end
    end

end
