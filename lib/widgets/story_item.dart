import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isOwn;

  const StoryItem({
    super.key,
    required this.name,
    required this.imageUrl,
    this.isOwn = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAvatar(),
            const SizedBox(height: 4),
            _buildName(),
          ],
        ),
      ),
    );
  }

  // ─── Avatar dengan border gradient atau ikon tambah ────────────────────────
  Widget _buildAvatar() {
    return Stack(
      children: [
        // Border gradient (ungu-pink) untuk story orang lain
        Container(
          width: 66,
          height: 66,
          decoration: isOwn
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 1.5),
                )
              : const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFF58529), // oranye
                      Color(0xFFDD2A7B), // pink
                      Color(0xFF8134AF), // ungu
                      Color(0xFF515BD4), // biru
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
          padding: const EdgeInsets.all(2.5),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(2),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.grey.shade200,
              backgroundImage:
                  imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
              child: imageUrl.isEmpty
                  ? const Icon(Icons.person, color: Colors.grey)
                  : null,
            ),
          ),
        ),

        // Ikon tambah khusus "Your Story"
        if (isOwn)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Color(0xFF0095F6),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
      ],
    );
  }

  // ─── Teks nama di bawah avatar ─────────────────────────────────────────────
  Widget _buildName() {
    return SizedBox(
      width: 66,
      child: Text(
        name,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 11,
          color: Colors.black87,
        ),
      ),
    );
  }
}