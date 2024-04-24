import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/streams.dart';
import 'package:test/timer.dart';
import 'package:collection/collection.dart';

class TimerMock extends Mock implements StreamTimer {}

void main() {
  late StreamTimer timer;
  late Streams streams;

  setUp(() {
    timer = TimerMock();
    streams = Streams(timer: timer);
  });
  test('Stream returns a stream of number in the given interval inclusive',
      () async {
    var l = List.generate(101, (i) => i);
    when(() => timer.delay()).thenAnswer((a) => Future.delayed(Duration.zero));

    var data = await streams.streamGenerator(0, 100).toList();

    final bool equal = const ListEquality().equals(l, data);
    expect(equal, true);
  });
  test('data1 returns data from 0 to 100', () async {
    var l = List.generate(101, (i) => i);
    when(() => timer.delay()).thenAnswer((a) => Future.delayed(Duration.zero));

    var data = await streams.data1.toList();

    final bool equal = const ListEquality().equals(l, data);
    expect(equal, true);
  });
  test('data2 returns data from  100 to 200', () async {
    var l = List.generate(101, (i) => i + 100);
    when(() => timer.delay()).thenAnswer((a) => Future.delayed(Duration.zero));

    var data = await streams.data2.toList();

    final bool equal = const ListEquality().equals(l, data);
    expect(equal, true);
  });
  test('data3 returns data from 200 to 300', () async {
    var l = List.generate(101, (i) => i + 200);
    when(() => timer.delay()).thenAnswer((a) => Future.delayed(Duration.zero));

    var data = await streams.data3.toList();

    final bool equal = const ListEquality().equals(l, data);
    expect(equal, true);
  });
}
