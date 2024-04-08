import 'package:flutter/material.dart';

import '../../model/api_integration_model.dart';

class FormFieldClass{
    TextEditingController comment;
    TextEditingController email;
    CommentApiModel? selectedData;  FormFieldClass({required this.comment, required this.email, this.selectedData});
    // const FormFieldClass(
    //   this.comment =TextEditingController(text: '');
    //   this.email =TextEditingController();
    //   this.selectedData=CommentApiModel();
    // );
}