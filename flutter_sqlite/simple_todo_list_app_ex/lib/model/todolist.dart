class TodoList{
  //property
  final int? seq;
  final String doit;
  final String? date;

  //Constructor 생성자
  TodoList(
    {
      this.seq,
      required this.doit,
      this.date,
    }
  );

  TodoList.fromMap(Map<String,dynamic>res)
  :seq= res['seq'],
  doit = res['doit'],
  date = res['date'];
}