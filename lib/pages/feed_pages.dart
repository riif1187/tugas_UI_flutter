import 'package:flutter/material.dart';
import '../widgets/post_card.dart';
import '../models/post_model.dart';

//----Data Dummy----//
final List<Post> _dummyPosts = [
  const Post(
    username: 'syafiq.dev',
    avatarUrl: 'https://i.pravatar.cc/150?img=47',
    location: 'Location',
    imageUrl: 'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?w=800',
    likes: 1247,
    caption: 'engineer is easy',
    commentCount: 89,
    timeAgo: '2 hours ago',
  ),
  const Post(
    username: 'flutter.id',
    avatarUrl: 'https://i.pravatar.cc/150?img=12',
    location: 'Jakarta, Indonesia',
    imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
    likes: 832,
    caption: 'Another beautiful day 🏔️ #nature #photography',
    commentCount: 42,
    timeAgo: '5 hours ago',
  ),
];

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: ListView(

      ),
    );
  }

  //--AppBar: logo + icon notif + icon DM--//
  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(52),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Color(0xFFDBDBDB), width: 0.5),
          ),
        ),
        child: SafeArea(
          child: SizedBox(
            height: 52,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  const Text(
                    'Instagram',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: -0.5,
                      color: Colors.black,
                    ),
                  ),
 
                  // Aksi kanan
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border,
                            size: 26, color: Colors.black),
                        tooltip: 'Notifikasi',
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 40, minHeight: 40),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send_outlined,
                            size: 26, color: Colors.black),
                        tooltip: 'Pesan',
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 40, minHeight: 40),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}