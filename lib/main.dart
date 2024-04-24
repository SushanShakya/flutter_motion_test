import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/generic_cubit.dart';
import 'package:test/streams.dart';
import 'package:test/timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Streams streams;

  late GenericCubit c1;
  late GenericCubit c2;
  late GenericCubit c3;

  @override
  void initState() {
    super.initState();
    streams = Streams(timer: StreamTimer());
    c1 = GenericCubit(streams.data1);
    c2 = GenericCubit(streams.data2);
    c3 = GenericCubit(streams.data3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<GenericCubit, List<int>>(
              bloc: c1,
              builder: (context, a) {
                return Column(
                  children:
                      List.generate(a.length, (i) => Text(a[i].toString())),
                );
              },
            ),
            BlocBuilder<GenericCubit, List<int>>(
              bloc: c2,
              builder: (context, b) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        List.generate(b.length, (i) => Text(b[i].toString())),
                  ),
                );
              },
            ),
            BlocBuilder<GenericCubit, List<int>>(
              bloc: c3,
              builder: (context, c) {
                return Column(
                  children:
                      List.generate(c.length, (i) => Text(c[i].toString())),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
