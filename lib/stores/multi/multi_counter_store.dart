import 'package:mobx/mobx.dart';

part 'multi_counter_store.g.dart';

class SingleCounter = _SingleCounter with _$SingleCounter;

abstract class _SingleCounter with Store {
  final counters  = ObservableList<SingleCounter>();

  @observable
  int value = 0;

  @action
  void reset() {
    value = 0;
  }

  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }

  @action
  void addCounter() {
    counters.add(SingleCounter());
  }

  @action
  void removeCounter(int index) {
    counters.removeAt(index);
  }
}

