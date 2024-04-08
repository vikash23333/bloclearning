import 'package:bloclearning/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import '../../bloc/forms_bloc/bloc/forms_bloc_bloc.dart';
import 'add_and_edit_form_page.dart';

class ShowAddedItem extends StatefulWidget {
  const ShowAddedItem({super.key});

  @override
  State<ShowAddedItem> createState() => _ShowAddedItemState();
}

class _ShowAddedItemState extends State<ShowAddedItem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(backgroundColor: Colors.green,),
      body: BlocBuilder<FormsBlocBloc, FormsBlocState>(
        // buildWhen: (previous, current) => previous.allAddedData!=current.allAddedData,
        builder: (context, state) {
          return Visibility(
            visible: state.allAddedData.isNotEmpty,
              replacement: const Center(child: 
              Text('No Data found'),
              ),
              child: ListView.builder(
                itemCount: state.allAddedData.length,
                itemBuilder: (context, index) => 
                cardDesign(
                  child: Column(
                    children: [
                      commonWidget('Id', '${state.allAddedData[index].id}'),
                      commonWidget('Name', '${state.allAddedData[index].name}'),
                      commonWidget('Email', '${state.allAddedData[index].email}'),
                      commonWidget('Comment', '${state.allAddedData[index].body}')
                    ],
                  )
                ),
              )
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const AddEditForm()));
            }, child: const Icon(Icons.add)),
    ));
  }
}