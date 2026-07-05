class ChecklistItem {
  final int id;
  final int checklistItemId;
  final String title;
  final String? description;
  final bool isCompleted;
  final bool isRequired;
  final DateTime? completedAt;
  final int displayOrder;

  const ChecklistItem({
    required this.id,
    required this.checklistItemId,
    required this.title,
    this.description,
    required this.isCompleted,
    this.isRequired = true,
    this.completedAt,
    required this.displayOrder,
  });
}
