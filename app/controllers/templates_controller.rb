class TemplatesController < ApplicationController
    def show
        @template = Template.find(params[:id])
        @templates = Template.all
        @template_cards = @template.te_work_names.split(",")
    end
end
