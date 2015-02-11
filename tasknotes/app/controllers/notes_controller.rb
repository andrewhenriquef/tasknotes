class NotesController < ApplicationController
    
    def index
        
    end
    
    def show
      # /tasks/:task_id/notes/:id(.:format)      notes#show
        @task = Task.find(params[:task_id]) 
        @note = @task.notes.find(params[:id])
        
    end
    
    def new
        #new_task_note GET    /tasks/:task_id/notes/new(.:format)      notes#new
        @task = Task.find(params[:task_id])
        @note = @task.notes.new
        
    end
    
    def create
       
        @task = Task.find(params[:task_id])
        @note = @task.notes.create(notes_params)
        @note.save
        
        redirect_to (:back)
       
    end
    
    def edit
        
        @task = Task.find(params[:task_id]) 
        @note = @task.notes.find(params[:id])
        
    end
    
    def update
         
        @task = Task.find(params[:task_id]) 
        @note = @task.notes.find(params[:id])
        @note.update(notes_params)
        
        redirect_to :controller => "tasks", :action => 'show', :id => @task
        
    end
    
    def destroy
        
        @task = Task.find(params[:task_id])
        @note = @task.notes.find(params[:id])
        @note.destroy
        
        redirect_to (:back)
    end
    
    private
    
        def notes_params
            
            params.require(:note).permit(:title,:body)
            
        end
    
    
end
