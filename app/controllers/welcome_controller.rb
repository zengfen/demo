class WelcomeController < ApplicationController
    # before_filter :authenticate_user!
    authorize_resource  #在Controller中加入權限控管

    def say_hello

    end

    def index

    end
end
