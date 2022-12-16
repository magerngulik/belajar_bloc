// ignore_for_file: public_member_api_docs, sort_constructors_first
class CounterEvent {
  int? data;
  CounterEvent({
    this.data,
  });
}

class Increment extends CounterEvent {
  int value;
  Increment({
    required this.value,
  }) : super(data: value);
}

class Decrement extends CounterEvent {}
