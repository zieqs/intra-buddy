import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/document_item.dart';

part 'document_model.g.dart';

@JsonSerializable()
class DocumentModel {
  final int id;

  @JsonKey(name: 'item_name')
  final String itemName;

  @JsonKey(name: 'file_path')
  final String filePath;

  @JsonKey(name: 'file_type')
  final String? fileType;

  @JsonKey(name: 'uploaded_at')
  final DateTime uploadedAt;

  final String? notes;

  const DocumentModel({
    required this.id,
    required this.itemName,
    required this.filePath,
    this.fileType,
    required this.uploadedAt,
    this.notes,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentModelToJson(this);

  DocumentItem toEntity() => DocumentItem(
    id: id,
    itemName: itemName,
    filePath: filePath,
    fileType: fileType,
    uploadedAt: uploadedAt,
    notes: notes,
  );
}
