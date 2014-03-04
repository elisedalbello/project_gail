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

    session[:avaliacao_id] = 1

    respond_to do |format|

     if @paciente.valid?
      session[:paciente] = @paciente
      format.html{ redirect_to new_endereco_path }
      format.json{render :json =>  @paciente, :status => :created, :location => @paciente}

     else
	   format.html{render :action => "new"}
       format.json{render :json =>  @paciente.errors, :status => :unprocessable_entity}
     end
    end
  end

end
