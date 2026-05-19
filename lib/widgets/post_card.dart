import 'package:flutter/material.dart';
import '../models/post_model.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _isLiked = false;
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildImage(),
          _buildActionButtons(),
          _buildLikes(),
          _buildCaption(),
          _buildCommentLink(),
          _buildTimeAgo(),
          const SizedBox(height: 8),
          const Divider(height: 0.5, thickness: 0.5, color: Color(0xFFDBDBDB)),
        ],
      ),
    );
  }

  // ─── Header: avatar + nama + lokasi + titik tiga ───────────────────────────
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFFF58529), Color(0xFFDD2A7B), Color(0xFF8134AF)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            padding: const EdgeInsets.all(1.5),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(1.5),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: widget.post.avatarUrl.isNotEmpty
                    ? NetworkImage(widget.post.avatarUrl)
                    : null,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Nama + lokasi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post.username,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                if (widget.post.location.isNotEmpty)
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 10, color: Colors.black54),
                      const SizedBox(width: 2),
                      Text(
                        widget.post.location,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),

          // Tombol titik tiga
          IconButton(
            onPressed: _showMoreOptions,
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        ],
      ),
    );
  }

  // ─── Foto postingan ────────────────────────────────────────────────────────
  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: widget.post.imageUrl.isNotEmpty
          ? Image.network(
              widget.post.imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: Colors.grey.shade100,
                  child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.broken_image, color: Colors.grey, size: 40),
                );
              },
            )
          : Container(color: Colors.grey.shade200),
    );
  }

  // ─── Tombol aksi: like, komentar, share, simpan ────────────────────────────
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        children: [
          // Like
          IconButton(
            onPressed: () => setState(() => _isLiked = !_isLiked),
            icon: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: _isLiked ? Colors.red : Colors.black,
              size: 26,
            ),
          ),
          // Komentar
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.black, size: 24),
          ),
          // Kirim / Share
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send_outlined, color: Colors.black, size: 24),
          ),
          const Spacer(),
          // Simpan / Bookmark
          IconButton(
            onPressed: () => setState(() => _isSaved = !_isSaved),
            icon: Icon(
              _isSaved ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.black,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }

  // ─── Jumlah like ───────────────────────────────────────────────────────────
  Widget _buildLikes() {
    final totalLikes = _isLiked ? widget.post.likes + 1 : widget.post.likes;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Text(
        '${_formatNumber(totalLikes)} likes',
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  // ─── Caption: nama bold + teks caption ────────────────────────────────────
  Widget _buildCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 13, color: Colors.black),
          children: [
            TextSpan(
              text: '${widget.post.username} ',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: widget.post.caption),
          ],
        ),
      ),
    );
  }

  // ─── Link lihat semua komentar ─────────────────────────────────────────────
  Widget _buildCommentLink() {
    if (widget.post.commentCount == 0) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'View all ${widget.post.commentCount} comments',
          style: const TextStyle(fontSize: 13, color: Colors.black54),
        ),
      ),
    );
  }

  // ─── Waktu posting ─────────────────────────────────────────────────────────
  Widget _buildTimeAgo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Text(
        widget.post.timeAgo.toUpperCase(),
        style: const TextStyle(
          fontSize: 10,
          color: Colors.black38,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  // ─── Modal opsi titik tiga ─────────────────────────────────────────────────
  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
      ),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 12),
            _optionTile(Icons.link, 'Copy Link'),
            _optionTile(Icons.share_outlined, 'Share To...'),
            _optionTile(Icons.info_outline, 'Why you\'re seeing this post'),
            const Divider(height: 1),
            _optionTile(Icons.block, 'Unfollow', isDestructive: true),
          ],
        ),
      ),
    );
  }

  Widget _optionTile(IconData icon, String label, {bool isDestructive = false}) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : Colors.black, size: 22),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: isDestructive ? Colors.red : Colors.black,
        ),
      ),
      onTap: () => Navigator.pop(context),
    );
  }

  // ─── Format angka: 1247 → 1,247 ───────────────────────────────────────────
  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
  }
}