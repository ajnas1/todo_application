class TodoModel {
  bool isFinish;
  String todoTitle;

  TodoModel({required this.isFinish,required this.todoTitle});

  factory TodoModel.fromJson(Map<String,dynamic> json)=>TodoModel(isFinish:  json["isFinish"], todoTitle: json['todoTitle']);
  Map<String,dynamic> toJson()=>{
    "isFinish": isFinish,
    "todoTitle": todoTitle,
  };
  TodoModel copyWith({bool? isFinish,String? todoTitle}) {
     return TodoModel(isFinish: isFinish ?? this.isFinish, todoTitle: todoTitle ?? this.todoTitle);
  }
}