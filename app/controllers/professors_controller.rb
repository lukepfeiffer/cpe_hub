class ProfessorsController < ApplicationController
  expose :professor
  expose :professors do
    Professor.all
  end
end
