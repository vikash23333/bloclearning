import 'package:flutter/material.dart';

import 'add_and_edit_form_page.dart';

class ShowAddedItem extends StatefulWidget {
  const ShowAddedItem({super.key});

  @override
  State<ShowAddedItem> createState() => _ShowAddedItemState();
}

class _ShowAddedItemState extends State<ShowAddedItem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(),
      body: const Center(child: Text('No Data found'),),
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const AddEditForm()));
            }, child: const Icon(Icons.add)),
    ));
  }
}