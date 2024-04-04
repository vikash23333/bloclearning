import 'dart:developer';

import 'package:flutter/material.dart';
import '../../utils/function.dart';
import '../../utils/widgets.dart';

class AddEditForm extends StatefulWidget {
  const AddEditForm({super.key});
  @override
  State<AddEditForm> createState() => _AddEditFormState();
}
  final _formKey = GlobalKey<FormState>();
  TextEditingController t1=TextEditingController();
  TextEditingController t2 =TextEditingController();
  final List searchFieldList =[];
class _AddEditFormState extends State<AddEditForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textFormField(t1,label: 'Text 1',isRequried: true),
              const SizedBox(height: 10,),
              textFormField(t2,label: 'Text 2',validateFunction: (value) {
                log('xxxxxx${double.tryParse('$value')==null}');
                if ( double.tryParse('$value')==null) {
                  return 'Text 2 is not a number';
                }
              },),
              const SizedBox(height: 10,),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: SizedBox(
              height: 50,
              child: clearCancelApplyFunc(
                  clearOnTap: (){
                    _formKey.currentState!.reset();
                  },
                  applyOnTap: (){
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {

                    }
                  },
                  leftpadding: MediaQuery.of(context).size.width * 0.10,
                  rightpadding: MediaQuery.of(context).size.width * 0.10,
                  cancelClr: Colors.red,
                  clearClr:  Colors.grey,
                  applyClr:  const Color(0xff004772))),
        ),
    ));
  }
}