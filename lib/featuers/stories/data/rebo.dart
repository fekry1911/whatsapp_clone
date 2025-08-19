import 'model.dart';

final List<StoryUser> fakeStoryUsers = [
  StoryUser(
    name: "Ahmed Ali",
    profileImage: "https://randomuser.me/api/portraits/men/11.jpg",
    stories: [
      StoryItem(url: "https://picsum.photos/500/800?random=1"),
      StoryItem(url: "https://picsum.photos/500/800?random=2"),
    ],
  ),
  StoryUser(
    name: "Sara Mohamed",
    profileImage: "https://randomuser.me/api/portraits/women/33.jpg",
    stories: [
      StoryItem(url: "https://picsum.photos/500/800?random=3"),
      StoryItem(url: "https://picsum.photos/500/800?random=4"),
      StoryItem(url: "https://picsum.photos/500/800?random=5"),
    ],
  ),
  StoryUser(
    name: "Omar Hassan",
    profileImage: "https://randomuser.me/api/portraits/men/22.jpg",
    stories: [
      StoryItem(url: "https://picsum.photos/500/800?random=6"),
    ],
  ),
];