import 'package:flutter/material.dart';
import 'package:todo/database/repository.dart';
import 'package:todo/models/todoModel.dart';

class ListsView extends StatefulWidget {
  const ListsView({super.key});

  @override
  State<ListsView> createState() => _ListsViewState();
}

class _ListsViewState extends State<ListsView> {
     final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TodoRepository _todoRepository = TodoRepository();
   List<ListModel> Lists = [];
   @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  void _loadTodos() async {
    final todos = await _todoRepository.getAllTodos();
    setState(() {
      Lists = todos;
    });
  }

  void _addTodo() async {
    final name = _nameController.text;
    final description = _descriptionController.text;
    if (name.isNotEmpty && description.isNotEmpty) {
      final todo = ListModel(name: name, description: description);
      await _todoRepository.insert(todo);
      _nameController.clear();
      _descriptionController.clear();
      _loadTodos();
    }
  }

  void _updateTodo(ListModel todo) async {
    final updatedTodo = ListModel(
      id: todo.id,
      name: _nameController.text,
      description: _descriptionController.text,
      
    );
    await _todoRepository.update(updatedTodo);
    _nameController.clear();
    _descriptionController.clear();
    _loadTodos();
  }

  void _deleteTodo(int id) async {
    await _todoRepository.delete(id);
    _loadTodos();
  }

  void createNewList(){
    showDialog(context: context, builder:(context) {
      var theme = Theme.of(context);
      var dH = MediaQuery.of(context).size.height;
      return AlertDialog(
        title: const Text('Yeni Liste Oluştur'),
        content: SizedBox(
          height: dH * 0.3,
          child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Liste adı'),
                      ),
                    ),
                    SizedBox(height: dH*0.01),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Açıklama'),
                      ),
                    ),
                  
                  ],
                ),
        ),
              actions: [Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () { Navigator.pop(context);}, child: Text('Vazgeç'),),
                  ElevatedButton(onPressed: () {  _addTodo();},child: Text('Ekle')),
                ],
              )],
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
     var theme = Theme.of(context);
    var dW = MediaQuery.of(context).size.width;
    var dH = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: createNewList,child: Icon(Icons.add),),
      appBar: AppBar(
        title: const Text('Listelerim'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
               
             
              Container(
                height: dH * 0.5,
                width: dW,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child:ListView.builder(
                      itemCount: Lists.length,
                      itemBuilder: (context, index) {
                        final todo = Lists[index];
                        return ListTile(
                          title: Text(todo.name!),
                          subtitle: Text(todo.description!),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _nameController.text = todo.name!;
                              _descriptionController.text = todo.description!;
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('Edit Todo'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: _nameController,
                                        decoration:
                                            InputDecoration(labelText: 'Todo Name'),
                                      ),
                                      TextField(
                                        controller: _descriptionController,
                                        decoration:
                                            InputDecoration(labelText: 'Description'),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _updateTodo(todo);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Update'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text('Delete Todo'),
                                content: Text(
                                    'Are you sure you want to delete this todo?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _deleteTodo(todo.id!);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Delete'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
              )
              ),
            ],
          ),
        ),
      )
    );
  }
}