import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/forms_bloc/bloc/forms_bloc_bloc.dart';
import '../../model/api_integration_model.dart';
import '../../utils/function.dart';
import '../../utils/searchable_dropdown.dart';
import '../../utils/widgets.dart';

class AddEditForm extends StatefulWidget {
  const AddEditForm({super.key});
  @override
  State<AddEditForm> createState() => _AddEditFormState();
}

final _formKey = GlobalKey<FormState>();
final List<CommentApiModel> searchFieldList = [
  CommentApiModel(name: 'Vikash', id: 1),
  CommentApiModel(name: 'Niraj', id: 2),
  CommentApiModel(name: 'Jeet', id: 3),
  CommentApiModel(name: 'Dev', id: 4),
];
CommentApiModel? selectedItem;
final snackBar = SnackBar(
  content: const Text('Added Successfully'),
  backgroundColor: Colors.blue, // Optional: customize background color
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () {
      // Perform undo action
    },
  ),
);

class _AddEditFormState extends State<AddEditForm> {
  @override
  Widget build(BuildContext context) {
    final contextToSetData = context.read<FormsBlocBloc>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber,),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<FormsBlocBloc, FormsBlocState>( 
                builder: (context, state) {
                  return CommonSearchableDropDown<CommentApiModel>(
                    textToViewInDropDown: (p0) => '${p0?.name}',
                    compareFn: (p0, p1) => '${p0.name}' == '${p1.name}',
                    hintText: 'Name *',
                    options: searchFieldList,
                    selectedValue: state.selectedData,
                    onChanged: (p0) =>
                        contextToSetData.add(SetNameModel(p0)),
                    validatorFunction: (p0) {
                      if (p0 == null || p0.id == null) {
                        return "Please Enter Name";
                      }
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<FormsBlocBloc, FormsBlocState>( 
                builder: (context, state) { 
                  return textFormField(
                      ctlr: state.comment,
                      label: 'Comment',
                      isRequried: true);
                },
              ),
              const SizedBox(height: 10,),
              BlocBuilder<FormsBlocBloc, FormsBlocState>(
                // buildWhen: (previous, current) =>previous.email.text != current.email.text,
                builder: (context, state) {
                  return textFormField(
                    ctlr: state.email,
                    label: 'Email',
                    validateFunction: (value) {
                      log("${isValidEmail('$value')}");
                      if (!isValidEmail('$value')) {
                        return 'Enter valid Email';
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
            height: 50,
            child: clearCancelApplyFunc(
                clearOnTap: () {
                  _formKey.currentState!.reset();
                  contextToSetData.add(FormResetWhileAdding());
                },
                applyOnTap: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    contextToSetData.add(FormSubmitEvent());
                    _formKey.currentState!.reset();
                    contextToSetData.add(FormResetWhileAdding());
                    Navigator.pop(context);
                  }
                },
                leftpadding: MediaQuery.of(context).size.width * 0.10,
                rightpadding: MediaQuery.of(context).size.width * 0.10,
                cancelClr: Colors.red,
                clearClr: Colors.grey,
                applyClr: const Color(0xff004772))),
      ),
    ));
  }
}
