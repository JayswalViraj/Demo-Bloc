import 'package:bloc_demo/counter/counter_bloc.dart';
import 'package:bloc_demo/counter/counter_event.dart';
import 'package:bloc_demo/counter/counter_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              if (state is IncrementState) {
                return Text(state.data.toString());
              } else if (state is DecrementState) {
                return Text(state.data.toString());
              } else {
                return Text("0 no data");
              }
            }),
            ElevatedButton(onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementEvent(0));
            }, child: Text("Increment")),
            ElevatedButton(onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(DecrementEvent(0));

            }, child: Text("Decrement")),
          ],
        ),
      ),
    );
  }
}
