class FeaturedAssessmentDto {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final bool isPrivate;
  final bool isPremium;
  final List<String> categories;
  final int rating;

  FeaturedAssessmentDto(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl,
      required this.isPrivate,
      required this.isPremium,
      required this.categories,
      required this.rating});
}
