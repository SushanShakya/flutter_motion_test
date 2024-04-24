class StreamTimer {
  Future<void> delay() async {
    await Future.delayed(const Duration(milliseconds: 100));
  }
}
