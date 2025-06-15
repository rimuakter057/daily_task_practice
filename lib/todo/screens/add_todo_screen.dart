import 'package:daily_task/todo/functions/models/todo_model.dart';
import 'package:flutter/material.dart';

class AddTodoScreens extends StatefulWidget {
  const AddTodoScreens({super.key});

  @override
  State<AddTodoScreens> createState() => _AddTodoScreensState();
}

class _AddTodoScreensState extends State<AddTodoScreens> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("todo add"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintText: "title"
                      ),
                      validator: (value) =>
                      value!.isEmpty
                          ? 'title cannot be blank'
                          : null,

                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                          hintText: "description"
                      ),
                      validator: (value) =>
                      value!.isEmpty
                          ? 'description cannot be blank'
                          : null,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    TodoModel todo= TodoModel(
                        title: titleController.text.trim(),
                        description: descriptionController.text.trim(),
                    );

                    Navigator.pop(context,todo);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                  clear();
                },
                child: const Text('continue'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void clear() {

    titleController.clear();
    descriptionController.clear();
  }

}

