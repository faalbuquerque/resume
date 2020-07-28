class DashboardController < ApplicationController
    before_action :authenticate_admin!
    
	def index
        @personal_infos = PersonalInfo.all
    end     

end
