class DocumentItem {
  final int id;
  final String itemName;
  final String filePath;
  final String? fileType;
  final DateTime uploadedAt;
  final String? notes;

  const DocumentItem({
    required this.id,
    required this.itemName,
    required this.filePath,
    this.fileType,
    required this.uploadedAt,
    this.notes,
  });
}
