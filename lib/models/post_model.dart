class Post {
  final String username;
  final String avatarUrl;
  final String location;
  final String imageUrl;
  final int likes;
  final String caption;
  final int commentCount;
  final String timeAgo;

  const Post({
    required this.username,
    required this.avatarUrl,
    required this.location,
    required this.imageUrl,
    required this.likes,
    required this.caption,
    required this.commentCount,
    required this.timeAgo,
  });
}