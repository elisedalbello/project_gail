class EnderecosController < ApplicationController

  # GET /enderecos/new
  # GET /enderecos/new.json
  def new
    @endereco = Endereco.new
    @estados = Estado.all

    @paciente = session[:paciente]

    if @paciente.nil?
      redirect_to new_paciente_path
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @endereco }
    end
  end

  # POST /enderecos
  # POST /enderecos.json
  def create
    @endereco = Endereco.new(params[:endereco])

    @paciente = session[:paciente]

    respond_to do |format|
      if @endereco.save

        @paciente.endereco_id = @endereco.id

        if @paciente.save

          session[:paciente] = @paciente

          session.delete(:respostas)

          format.html { redirect_to "/questoes/1,1", :notice => 'Cadastro efetuado com sucesso.' }
          format.json { render :json => @paciente, :status => :created, location: @paciente }
        end

      else
        format.html { render :action => "new" }
        format.json { render :json => @endereco.errors, :status => :unprocessable_entity }
      end
    end
  end

end
