class TasksView
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario

  def vista(tasks)
    tasks.each_with_index do |task, index|
      print "#{index + 1}. "#{task.name}""
      if task.status == "true"
        print "[ X ] "
      else 
        print "[   ] "
      end
      p "#{task.name}"
    end
  end


  def add(string)
    p "Agregaste la tarea: '#{string}' a tu lista."
  end

  def delete(string)
    p "Eliminaste la tarea: '#{string}' de tu lista."
  end

  def complete(string)
    p "Completaste la tarea: '#{string}'."
  end


  
	# def index
	# end

 #  def create
 #  end

 #  def delete
 #  end

 #  def update
 #  end

	# def error
	# end
end
