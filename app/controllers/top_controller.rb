class TopController < ApplicationController

    before_action :redirect_to_role!

    def index
        @templates = Template.all
    end
end
