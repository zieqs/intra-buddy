enum MessageStatus { complete, thinking, streaming }

class ChatMessage {
  final int id;
  final String sessionId;
  final String role;
  final String content;
  final int? matchedFaqId;
  final DateTime createdAt;
  final MessageStatus status;

  const ChatMessage({
    required this.id,
    required this.sessionId,
    required this.role,
    required this.content,
    this.matchedFaqId,
    required this.createdAt,
    this.status = MessageStatus.complete,
  });

  ChatMessage copyWith({
    int? id,
    String? sessionId,
    String? role,
    String? content,
    int? matchedFaqId,
    DateTime? createdAt,
    MessageStatus? status,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      role: role ?? this.role,
      content: content ?? this.content,
      matchedFaqId: matchedFaqId ?? this.matchedFaqId,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }
}
