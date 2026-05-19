import 'package:flutter/material.dart';
import '../widgets/post_card.dart';
import '../models/post_model.dart';


//----Data Dummy----//
final List<Post> _dummyPosts = [
  const Post(
    username: 'syafiq.dev',
    avatarUrl: 'https://images.unsplash.com/photo-1457449940276-e8deed18bfff?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbCUyMGluc3RhZ3JhbXxlbnwwfHwwfHx8MA%3D%3D',
    location: 'Location',
    imageUrl: 'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?w=800',
    likes: 1247,
    caption: 'engineer is easy',
    commentCount: 89,
    timeAgo: '2 hours ago',
  ),
  const Post(
    username: 'flutter.id',
    avatarUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRlnAzWnTQfjwm5bAtSQUNtF3O9qFUWxmIDQ&s',
    location: 'Jakarta, Indonesia',
    imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
    likes: 832,
    caption: 'Another beautiful day 🏔️ #nature #photography',
    commentCount: 42,
    timeAgo: '5 hours ago',
  ),
  const Post(
    username: 'gina.docker',
    avatarUrl: 'https://media.licdn.com/dms/image/v2/C4D10AQFMbWrYCIKq0Q/image-shrink_800/image-shrink_800/0/1669336391316?e=2147483647&v=beta&t=cMauHwd-SHyG_4_JU8C3xJ932cJr7nZXqEjrtk4NSkU',
    location: 'kalimantan, Indonesia',
    imageUrl: 'https://images.unsplash.com/photo-1736523075712-398e8a18767a?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    likes: 832,
    caption: 'Hari cerah #nature #photography',
    commentCount: 42,
    timeAgo: '1 hours ago',
  ),
];

class FeedPages extends StatelessWidget {
  const FeedPages({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: ListView(
        children: [

 
          // ── Daftar post ──
          ..._dummyPosts.map((post) => PostCard(post: post)),
        ],
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