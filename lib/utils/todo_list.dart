import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/todoModel.dart';
class ToDoList extends StatefulWidget {
  const ToDoList({super.key,required this.listItem,required this.onDeleteItem});
  final ToDoListModel listItem;
  final Function(int) onDeleteItem;
  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final TextEditingController editTitleController = TextEditingController();

  void editItem(){
    showDialog(context: context, builder: (context) {
      var theme = Theme.of(context);
      var dW = MediaQuery.of(context).size.width;
                        editTitleController.text = widget.listItem.title!;
                        return AlertDialog(
                          insetPadding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                          title: Center(child: const Text('Düzenle')),
                          content: SizedBox(height: 100,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: dW*0.9,
                                  child: TextField(

                                    controller: editTitleController,
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
                            SizedBox(width: dW*0.35,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: theme.colorScheme.surface,
                                  foregroundColor: Colors.black54,
                                ),
                              onPressed: () { Navigator.pop(context);}, 
                              child: const Text('Vazgeç')),
                            ),
                            SizedBox(width: dW*0.35,
                              child: TextButton(onPressed: () {
                                setState(() {
                                  widget.listItem.title = editTitleController.text;
                                });
                                Navigator.pop(context);
                              
                              },
                              child: const Text('Onayla')),
                            ),
                              ],
                            )
                          
                          ],
                        );
                      }
                      );
  }

  @override
  Widget build(BuildContext context) {
    var dW = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Slidable(
        key: ValueKey(0),
        endActionPane: ActionPane(motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
                    onPressed: (_) {
                    widget.onDeleteItem(widget.listItem.id!); 
                    },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Sil'
                    ),
        ]),
        child: Container(
                  padding: const EdgeInsets.all(16),
                  width: dW * 0.95,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: theme.cardColor),
                  child:Row(
                    children: [
                      Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(4)),
                      activeColor: theme.primaryColor,  
                      value: widget.listItem.isCompleted, onChanged: (value) { setState(() {    widget.listItem.isCompleted = value!; });
                      },),
                      Text(
                        widget.listItem.title!,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          decoration: widget.listItem.isCompleted! ? TextDecoration.lineThrough : TextDecoration.none,),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: editItem,
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                  ),
      ),
    );
  }
}