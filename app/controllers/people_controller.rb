class PeopleController < ApplicationController
  before_action :authenticate_user
  before_action :repair_nested_params, only: [:index]
  before_action :set_person, only: [:show, :update, :destroy]

  # GET /people
  def index
    query = params[:q].try(:permit!).try(:to_h) || {}
    order = params[:order].try(:permit!).try(:to_h) || { name: :asc }
    @people = Person.where(query).order(order)
    render json: @people
  end

  # GET /people/1
  def show
    render json: @person
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def person_params
      params.require(:person).permit(:name, :age, :oss_projects)
    end

    def repair_nested_params(obj = params)
      obj.each do |key, value|
        if value.is_a?(ActionController::Parameters) || value.is_a?(Hash)
          if value.keys.find {|k, _| k =~ /\D/ }
            repair_nested_params(value)
          else
            obj[key] = value.values
            value.values.each {|h| repair_nested_params(h) }
          end
        end
      end
    end
end
