class PacientesController < ApplicationController

  # GET /pacientes/new
  # GET /pacientes/new.json
  def new
    @paciente = Paciente.new

    respond_to do |format|
      format.html # new.html.erb
      format.json{render :json => @paciente}
    end
  end

  # POST /pacientes
  # POST /pacientes.json
  def create

    @paciente = Paciente.new(params[:paciente])

    respond_to do |format|

     if @paciente.valid?
      session[:paciente] = @paciente
      format.html{ redirect_to new_endereco_path }

     else
	     format.html{render :action => "new"}
     end
    end
  end

end
