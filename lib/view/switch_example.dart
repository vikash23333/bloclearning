import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/switch_example/bloc/switch_example_bloc.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notification'),
                BlocBuilder<SwitchExampleBloc, SwitchExampleState>(
                  buildWhen: (previous, current) => previous.notificationVal!=current.notificationVal,
                  builder: (context, state) {
                    return Switch(
                        value: state.notificationVal,
                        onChanged: (newValue) => context.read<SwitchExampleBloc>().add(EnableAndDisableNotification()));
                  },
                )
              ],
            ),
            const SizedBox( height: 30, ),
            BlocBuilder<SwitchExampleBloc, SwitchExampleState>(
              buildWhen: (previous, current) => previous.sliderVal!=current.sliderVal,
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.sliderVal),
                );
              },
            ),
            const SizedBox(height: 50,),
            BlocBuilder<SwitchExampleBloc, SwitchExampleState>(
              builder: (context, state) {
                return Slider(value: state.sliderVal, onChanged: (newValue) =>context.read<SwitchExampleBloc>().add(SliderEvent(slider: newValue)));
              },
            )
          ],
        ),
      ),
    ));
  }
}
