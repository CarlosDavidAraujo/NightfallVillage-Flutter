class GameMessages {
  List<String> messages = [];

  GameMessages() {
    messages = [];
  }

  void setMessage(String message) {
    messages = [message];
  }

  void addMessage(String message) {
    if (!messages.contains(message)) {
      messages.add(message);
    }
  }
}
