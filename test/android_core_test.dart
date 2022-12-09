class Person {
  @override
  noSuchMethod(Invocation invocation) {
    print(invocation.memberName);
    print(invocation.isMethod);
    print(invocation.positionalArguments);
  }
}

main() {
  try {
    Person person = Person();
    (person as dynamic).call('tes', 'tes');
  } catch (e) {
    print(e);
  }
}
