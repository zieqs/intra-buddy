import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/chat_message.dart';

part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessageModel {
  final int id;

  @JsonKey(name: 'session_id')
  final String sessionId;

  final String role;
  final String content;

  @JsonKey(name: 'matched_faq_id')
  final int? matchedFaqId;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final MessageStatus status;

  const ChatMessageModel({
    required this.id,
    required this.sessionId,
    required this.role,
    required this.content,
    this.matchedFaqId,
    required this.createdAt,
    this.status = MessageStatus.complete,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);

  ChatMessage toEntity() => ChatMessage(
    id: id,
    sessionId: sessionId,
    role: role,
    content: content,
    matchedFaqId: matchedFaqId,
    createdAt: createdAt,
    status: status,
  );

  ChatMessageModel copyWith({
    int? id,
    String? sessionId,
    String? role,
    String? content,
    int? matchedFaqId,
    DateTime? createdAt,
    MessageStatus? status,
  }) {
    return ChatMessageModel(
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
