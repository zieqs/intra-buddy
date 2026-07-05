// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentModel _$DocumentModelFromJson(Map<String, dynamic> json) =>
    DocumentModel(
      id: (json['id'] as num).toInt(),
      itemName: json['item_name'] as String,
      filePath: json['file_path'] as String,
      fileType: json['file_type'] as String?,
      uploadedAt: DateTime.parse(json['uploaded_at'] as String),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$DocumentModelToJson(DocumentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_name': instance.itemName,
      'file_path': instance.filePath,
      'file_type': instance.fileType,
      'uploaded_at': instance.uploadedAt.toIso8601String(),
      'notes': instance.notes,
    };
