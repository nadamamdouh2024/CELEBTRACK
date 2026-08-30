import '../../Domains/models/chat_message_model.dart';

abstract class ChatState {}

class ChatInitialState extends ChatState {}

class ChatLoadingState extends ChatState {
  final List<ChatMessageModel> messages;
  ChatLoadingState(this.messages);
}

class ChatSuccessState extends ChatState {
  final List<ChatMessageModel> messages;
  ChatSuccessState(this.messages);
}

class ChatErrorState extends ChatState {
  final String errorMessage;
  final List<ChatMessageModel> messages;
  ChatErrorState(this.errorMessage, this.messages);
}