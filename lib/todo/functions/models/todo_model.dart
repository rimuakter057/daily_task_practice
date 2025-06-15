class TodoModel{
   String title;
   String description;
   TodoStatus? status;

   TodoModel({required this.title, required this.description, this.status});
}
enum TodoStatus {
idle,inProgress,done
}