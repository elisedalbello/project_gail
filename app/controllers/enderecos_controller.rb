class EnderecosController < ApplicationController
  # GET /enderecos
  # GET /enderecos.json
  def index
    @enderecos = Endereco.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @enderecos }
    end
  end

  # GET /enderecos/1
  # GET /enderecos/1.json
  def show
    @endereco = Endereco.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @endereco }
    end
  end

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

  # GET /enderecos/1/edit
  def edit
    @endereco = Endereco.find(params[:id])
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
          
          format.html { redirect_to "/questoes/1,1", :notice => 'Cadastro efetuado com sucesso.' }
          format.json { render :json => @paciente, :status => :created, location: @paciente }
        end  

      else
        format.html { render :action => "new" }
        format.json { render :json => @endereco.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /enderecos/1
  # PUT /enderecos/1.json
  def update
    @endereco = Endereco.find(params[:id])

    respond_to do |format|
      if @endereco.update_attributes(params[:endereco])
        format.html { redirect_to @endereco, :notice => 'Endereco was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @endereco.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /enderecos/1
  # DELETE /enderecos/1.json
  def destroy
    @endereco = Endereco.find(params[:id])
    @endereco.destroy

    respond_to do |format|
      format.html { redirect_to enderecos_url }
      format.json { head :no_content }
    end
  end
end
