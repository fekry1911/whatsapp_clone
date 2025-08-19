class StoryItem {
  final String url;
  final Duration duration;

  StoryItem({required this.url, this.duration = const Duration(seconds: 5)});
}

class StoryUser {
  final String name;
  final String profileImage;
  final List<StoryItem> stories;

  StoryUser({
    required this.name,
    required this.profileImage,
    required this.stories,
  });
}