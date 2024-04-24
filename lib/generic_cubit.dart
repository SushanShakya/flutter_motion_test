// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

class GenericCubit extends Cubit<List<int>> {
  final Stream<int> s;

  GenericCubit(
    this.s,
  ) : super([]) {
    s.listen((number) {
      emit([...state, number]);
    });
  }
}
