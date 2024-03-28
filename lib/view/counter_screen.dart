import 'package:bloclearning/bloc/counter_bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc/counter_bloc.dart';
import '../bloc/counter_bloc/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Counter page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBlock, CounterState>(
            builder: (context, state) {
              return  Text(
                state.counter.toString(),
                style:const TextStyle(fontSize: 60),
              );
            },
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                context.read<CounterBlock>().add(IncrementCounter());
              }, child: const Text('Increment')),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(onPressed: () {
                context.read<CounterBlock>().add(DecrimentCounter());
              }, child: const Text('Decriment')),
            ],
          )
        ],
      ),
    ));
  }
}
