import 'package:mobx/mobx.dart';
import 'package:todomobx/stores/todo_store.dart';
part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  
  @observable
  String newTodoTitle = '';

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  ObservableList<TodoStore> todoList = new ObservableList();

  @action
  void addTodo(){
    todoList.insert(0, new TodoStore(newTodoTitle)); 
    newTodoTitle = "";   
  } 
}