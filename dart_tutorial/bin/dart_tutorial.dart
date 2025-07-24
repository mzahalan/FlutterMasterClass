import 'package:dart_tutorial/dart_tutorial.dart' as dart_tutorial;

void main(List<String> arguments) {
  print('Hello world: ${dart_tutorial.calculate()}!');
  print(interpolate("John", grade: 6, 30));
  print(interpolate(grade:7,"Jane", false));

  final myList = getList();

  myList.add("Blah");
  for (final item in myList) {
    print(item);
  }

  Collection col = Collection("My Collection", myList);
  print('Random Item: ${col.randomItem()}');
}




String interpolate(name, age, {required double grade}) {
  return "Hi my name is $name, and I am $age years old, and I'm in grade $grade";
}

List getList() {
  return ["John", "Jane", "Jack"];
}


class Collection {
  String name;
  List data;

  Collection(this.name, this.data);

  randomItem() {
    data.shuffle();
    return data.first;
  }
}