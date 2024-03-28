import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/to_do_bloc/bloc/to_do_bloc.dart';
class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.toDoList.isEmpty) {
            return const Center(child: Text('NO Data found'),);
          }else if(state.toDoList.isNotEmpty){
            return ListView.builder(
              itemCount: state.toDoList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(state.toDoList[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () =>context.read<ToDoBloc>().add(DeleteToDoEvent(obj:state.toDoList[index] )),
                ),
              ),
            );
          }else{
            return const SizedBox();
          }

        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        for (var i = 0; i < 5; i++) {
          context.read<ToDoBloc>().add(AddToDoEvent(task: 'TASK:- $i'));
        }
      },child:const Icon(Icons.add)),
    ));
  }
}
