import 'package:counter/bloc/counter_bloc_bloc.dart';
import 'package:counter/bloc/counter_bloc_event.dart';
import 'package:counter/bloc/counter_bloc_state.dart';
import 'package:counter/bloc_observer.dart';
import 'package:counter/cubit/counter_cubit.dart';
import 'package:counter/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text('Counter App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => CounterBloc(),
                  child: const SecondScreen(),
                ),
              ),
            );
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // context.read<CounterCubit>().increment();
                    context.read<CounterBloc>().add(CounterIncrementEvent());
                  },
                  icon: const Icon(Icons.add),
                ),
                BlocConsumer<CounterBloc, CounterBlocState>(
                  listener: (context, state) {
                    if (state is CounterBlocIncrement) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Counter Incremented!'),
                          duration: Duration(milliseconds: 300),
                        ),
                      );
                    } else if (state is CounterBlocDecrement) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Counter Decremented!'),
                          duration: Duration(milliseconds: 300),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      '${state.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
                IconButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrementEvent());
                  },
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
              child: const Text('Go to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
