import 'package:daily_task/todo/functions/models/todo_model.dart';
import 'package:daily_task/todo/screens/add_todo_screen.dart';
import 'package:flutter/material.dart';

class TodoScreens extends StatefulWidget {
  const TodoScreens({super.key});

  @override
  State<TodoScreens> createState() => _TodoScreensState();
}

class _TodoScreensState extends State<TodoScreens> {
  final List<TodoModel> todoList=[];

  void _addTodo(TodoModel todo){
    todoList.add(todo);
    setState(() {

    });
  }
  void _deleteTodo(int index){
    todoList.removeAt(index);
    setState(() {

    });
  }
  void _updateTodo(int index,TodoModel todo){
    todoList[index]=todo;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: ()async{
       TodoModel? todo=     await Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const AddTodoScreens()));
       if(todo!=null){
         _addTodo(todo);
       }
       },
              child: Icon(Icons.add,color: Colors.red,),
      ),


appBar: AppBar(title: Text("todo list"),),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context,index){
            var getTodo= todoList[index];
            return ListTile(
              title: Text(getTodo.title),
              subtitle:Text(getTodo.description),
              trailing: IconButton(onPressed: (){
                _deleteTodo(index);
              },
                  icon: Icon(Icons.delete)),
            );
          
        
      }
      ),
    );
  }
}
