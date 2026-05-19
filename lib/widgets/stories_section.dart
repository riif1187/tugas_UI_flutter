import 'package:flutter/material.dart';
import 'story_item.dart';

// Data dummy stories — nanti bisa diganti dari API
final List<Map<String, dynamic>> _dummyStories = [
  {
    'name': 'story anda',
    'imageUrl': 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
    'isOwn': true,
  },
  {
    'name': 'alya.desaign',
    'imageUrl': 'https://plus.unsplash.com/premium_photo-1769077701522-2d85a38e80a7?q=80&w=685&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'isOwn': false,
  },
  {
    'name': 'highway',
    'imageUrl': 'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
    'isOwn': false,
  },
  {
    'name': 'cicada',
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9-liIPevhkQM-AjaVhibnsuJL46jwRyUsbQ&s',
    'isOwn': false,
  },
  {
    'name': 'kuyang.ngesot',
    'imageUrl': 'https://media.tenor.com/8E0eDC0Iir0AAAAM/scared-ass-cheese-spongebob.gif',
    'isOwn': false,
  },
  {
    'name': 'natural.field',
    'imageUrl': 'https://images.unsplash.com/photo-1689670181996-af1a8b4eb5ef?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'isOwn': false,
  },
];

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFDBDBDB), width: 0.5),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        itemCount: _dummyStories.length,
        itemBuilder: (context, index) {
          final story = _dummyStories[index];
          return StoryItem(
            name: story['name'],
            imageUrl: story['imageUrl'],
            isOwn: story['isOwn'],
          );
        },
      ),
    );
  }
}