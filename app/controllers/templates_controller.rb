class TemplatesController < ApplicationController
    def show
        @template = Template.find(params[:id])
        @templates = Template.all
        @template_cards = @template.te_work_names.split(",")
    end
    def index
        @template = Template.first
        @templates = Template.all
    end
    def category
        @templates = Template.all
        @template = Template.first
    end
end
