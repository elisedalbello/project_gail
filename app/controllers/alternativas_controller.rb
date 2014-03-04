class AlternativasController < ApplicationController
  
  # GET /alternativas/1
  # GET /alternativas/1.json
  def show
    @alternativa = Alternativa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @alternativa }
    end
  end

end
