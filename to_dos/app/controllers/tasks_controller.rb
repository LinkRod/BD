class TasksController
  def initialize(args)
    @view = TasksView.new
  end

  def index
    # TIP: Aquí debes de llamar al método del mismo nombre de @view
  end

  def add
    new_task = Task.new(adding)
    @model.add(new_task)
    @view.add(adding)
  end

  def delete
    tasks_list = @model.index
    deleted = tasks_list.delete_at(num.to_i - 1)
    deleting_task = @model.delete(tasks_list,deleted) 
    @view.delete(deleting_task)
  end

  def complete
    tasks_list = @model.index
    tasks_list[task_done.to_i - 1].status = "true"
    completed = tasks_list[task_done.to_i - 1]
    completed_task = @model.complete(tasks_list, completed)
    @view.complete(completed_task)
  end
end
