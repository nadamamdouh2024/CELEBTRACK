import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/Requests/ai_chat_request.dart';
import '../../Domains/models/chat_message_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final AiChatRequest aiChatRequest;

  ChatCubit(this.aiChatRequest) : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  final List<ChatMessageModel> messages = [];

  void sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    messages.add(ChatMessageModel(text: text, isUser: true));
    emit(ChatLoadingState(List.from(messages)));

    try {
      final botReply = await aiChatRequest.sendMessage(text);
      messages.add(ChatMessageModel(text: botReply, isUser: false));
      emit(ChatSuccessState(List.from(messages)));
    } catch (error) {
      emit(ChatErrorState(error.toString(), List.from(messages)));
    }
  }
}