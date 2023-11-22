import 'package:actors/actors.dart';
import 'package:collection/collection.dart';

void main(List<String> arguments) async {
  final map = {
    'a': [1, 2, 3],
    'b': [4, 5, 6],
    'c': [7, 8, 9],
  };
  // Call `toList()` to force evaluation of the iterable.
  final values = map.values.flattened;
  final actor = Actor<Iterable<int>, Iterable<int>>.of((message) {
    return message.map((e) => e * 2);
  });
  final result = await actor.send(values);
  await actor.close();
  print('Calculated: $result');
}
