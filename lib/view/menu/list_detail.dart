import 'package:flutter/material.dart';
import 'package:todo/models/todoModel.dart';
class ListDetailView extends StatefulWidget {
  const ListDetailView({super.key});

  @override
  State<ListDetailView> createState() => _ListDetailViewState();
}

class _ListDetailViewState extends State<ListDetailView> {
List<ToDoListModel> toDoList = [ ToDoListModel(id: 1, title: "Test", isCompleted: false)];
final TextEditingController createTitleController = TextEditingController();
  void addNewItem() {
    showDialog(context: context, builder: (context) {
      var theme = Theme.of(context);
      var dW = MediaQuery.of(context).size.width;
      return AlertDialog(
        insetPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10),), 
        contentPadding: const EdgeInsets.all(16),
        content: SizedBox(height: 60,
          child: Column(
            children: [
              SizedBox(
                width: dW*0.9,
                child: TextField(
                  controller: createTitleController,
                  decoration: InputDecoration(
                    hintText: 'Yapılacak iş',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: theme.primaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          SizedBox(
            width: dW*0.35,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: theme.colorScheme.surface,
                foregroundColor: Colors.white,
              ),
              onPressed: () { Navigator.pop(context);}, child: Text('Vazgeç',style:theme.textTheme.bodyMedium!.copyWith(color: Colors.black54)),)
              ),
          SizedBox(
             width: dW*0.35,
            child: TextButton(onPressed: () {
              setState(() {
                toDoList.add(ToDoListModel(id: toDoList.last.id!+ 1, title:createTitleController.text, isCompleted:false));
              });
              Navigator.pop(context);
            }, child: Text('Onayla',)),
          ),
          ],
         )
        ],
      );
    });
  }
  void removeToDoItem(int id) {
    setState(() {
      toDoList.removeWhere((item) => item.id == id);
    });
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var dH = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addNewItem,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            
            const Text('Görev Listesi'),
            const Spacer(),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, '/settings');
            },icon: Icon(Icons.settings),),
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: dH*0.02,),
          //   SizedBox(
          //   width: dW * 0.95,
          //   height: dH * 0.5,
          //   child: ListView.builder(itemBuilder: (context, index) {
          //     var item = toDoList[index];
          //     return ToDoList(listItem:item,onDeleteItem: removeToDoItem,);
          //   }, itemCount: toDoList.length, shrinkWrap: true,),
          //  )
          
          ],
        ),
      ),
    );
  }
}