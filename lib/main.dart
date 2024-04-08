import 'package:bloclearning/bloc/switch_example/bloc/switch_example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/add_edit_bloc/bloc/add_and_edit_bloc.dart';
import 'bloc/api_bloc/bloc/api_integration_bloc.dart';
import 'bloc/counter_bloc/counter_bloc.dart';
// import 'view/counter_screen.dart';
// import 'view/switch_example.dart';
import 'bloc/forms_bloc/bloc/forms_bloc_bloc.dart';
import 'bloc/to_do_bloc/bloc/to_do_bloc.dart';
import 'view/add_edit_test/added_main_page.dart';
// import 'view/api_integration.dart';
// import 'view/to_do_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (_) => SwitchExampleBloc(),),
        BlocProvider(create: (_) => CounterBlock(),),
        BlocProvider(create: (_) => ToDoBloc(),),
        BlocProvider(create: (_) => ApiIntegrationBloc(),),
        BlocProvider(create: (_) => AddAndEditBloc(),),
        BlocProvider(create: (_) => FormsBlocBloc(),),
      ],//
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ShowAddedItem(),
      ),
    );
  }
}
