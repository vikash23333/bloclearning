import 'package:bloclearning/bloc/switch_example/bloc/switch_example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/api_bloc/bloc/api_integration_bloc.dart';
import 'bloc/counter_bloc/counter_bloc.dart';
// import 'view/counter_screen.dart';
// import 'view/switch_example.dart';
import 'bloc/to_do_bloc/bloc/to_do_bloc.dart';
import 'view/api_integration.dart';
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
        BlocProvider(create: (context) => CounterBlock(),),
        BlocProvider(create: (context) => ToDoBloc(),),
        BlocProvider(create: (context) => ApiIntegrationBloc(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ApiIntegration(),
      ),
    );
  }
}
