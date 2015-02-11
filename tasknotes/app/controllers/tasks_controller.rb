class TasksController < ApplicationController
    
    #load_and_authorize_resource
    
    def index
    
        @task = Task.all
    
    end
    
    def show
        
        @task = Task.find(params[:id])
    
    end
    
    def new
        
        @task = Task.new
        
    end
    
    def create
        
        @task = Task.create(task_params)
        @task.save
            
        redirect_to @task
    end

    def edit
       
        @task = Task.find(params[:id])
        #authorize! :edit
        
    end
    
    def update
        
        @task = Task.find(params[:id])
        @task.update(task_params)
        
        
        redirect_to :controller => "tasks", :action => 'show', :task_id => '@task'
    end
    
    def destroy
        
        @task = Task.find(params[:id])
        @task.destroy
        
        redirect_to (:back)
    end
    
    private
    
        def task_params
           
            params.require(:task).permit(:activity)
            
        end

end
