int calculate() {
  return 6 * 7;
}
void main() async {
  for(var i = 0; i < 100; i++){
    print(calculate() + i);
    await Future.delayed(const Duration(seconds: 1));
  }
}

