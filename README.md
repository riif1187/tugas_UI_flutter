# Tugas UI/UX Flutter — [Nama Aplikasi Pilihan]

## Identitas
- **Nama:** Muhammad Syarif
- **NIM:** 2455201110015
- **Pilihan:**  B 

## Deskripsi Singkat
Aplikasi ini merupakan implementasi tampilan Instagram Feed menggunakan Flutter.
Halaman yang dibuat pada tugas ini meliputi:

AppBar — Bagian atas layar berisi logo "Instagram" bergaya bold italic, ikon notifikasi (hati), dan ikon pesan (DM)
Stories Section — Baris scroll horizontal yang menampilkan avatar berbentuk lingkaran dengan border gradient oranye–pink–ungu, beserta nama akun di bawahnya. Item pertama ("Your Story") memiliki ikon + berwarna biru
Post Card — Kartu postingan lengkap berisi header (avatar + nama + lokasi + tombol opsi), foto postingan, tombol aksi (like, komentar, kirim, simpan), jumlah likes, caption, link komentar, dan timestamp

Seluruh tampilan mengacu pada desain asli Instagram dengan warna putih bersih, tipografi sederhana, dan interaksi dasar (like & bookmark bisa ditekan).

## Widget yang Digunakan
- lib/main.dart

MaterialApp — membungkus seluruh aplikasi dan mengatur tema global (warna, font, routing)
ThemeData — mengatur tema: warna putih, font Roboto, dan AppBarTheme
StatelessWidget — base class MyApp karena tidak ada state yang berubah

- lib/pages/feed_pages.dart

Scaffold — kerangka utama halaman dengan slot appBar dan body
PreferredSize — mengatur tinggi AppBar secara custom (52px)
SafeArea — mencegah konten tertutup notch atau status bar HP
Container — membungkus AppBar dengan garis bawah tipis
Row — menyusun logo dan ikon aksi secara horizontal
Text — menampilkan logo "Instagram" dengan gaya bold italic
IconButton — tombol ikon hati dan kirim di AppBar
ListView — body scrollable vertikal yang memuat StoriesSection dan PostCard

- lib/models/post_model.dart

class Post — model data postingan (bukan widget), menyimpan field: username, avatarUrl, location, imageUrl, likes, caption, commentCount, timeAgo

- lib/widgets/story_item.dart

GestureDetector — mendeteksi ketukan pada item story
Column — menyusun avatar dan nama secara vertikal
Stack — menumpuk CircleAvatar dengan ikon + untuk "Your Story"
Container — membuat border gradient oranye–pink–ungu pada avatar
CircleAvatar — menampilkan foto profil berbentuk lingkaran
NetworkImage — memuat gambar profil dari URL internet
Positioned — menempatkan ikon + di sudut kanan bawah avatar
Icon — ikon tanda + berwarna biru pada avatar "Your Story"
Text — menampilkan nama akun, maks 1 baris dengan ellipsis

- lib/widgets/stories_section.dart

Container — membungkus section dengan tinggi tetap 105px dan garis bawah
ListView.builder — daftar StoryItem efisien dengan arah scroll horizontal
StoryItem — widget custom yang dipanggil per item dalam daftar

- lib/widgets/post_card.dart

StatefulWidget — base class karena ada state yang berubah (like & bookmark)
Column — menyusun semua bagian post secara vertikal
Row — menyusun elemen header dan tombol aksi secara horizontal
CircleAvatar — foto profil pemilik post di header
Expanded — mengisi sisa ruang di antara avatar dan tombol titik tiga
AspectRatio — memastikan foto post selalu berbentuk persegi (rasio 1:1)
Image.network — memuat dan menampilkan foto post dari URL
CircularProgressIndicator — indikator loading saat foto sedang dimuat
Spacer — mendorong tombol bookmark ke sisi kanan
setState — memperbarui tampilan saat tombol like atau bookmark ditekan
RichText — menampilkan caption dengan nama bold dan teks biasa dalam satu baris
TextSpan — segmen teks dengan gaya berbeda di dalam RichText
GestureDetector — mendeteksi ketukan pada teks "View all X comments"
showModalBottomSheet — panel opsi dari bawah layar saat titik tiga ditekan
ListTile — satu baris opsi di dalam modal bottom sheet
Divider — garis pemisah tipis antar postingan

## Screenshot
![alt text](<screenshot/WhatsApp Image 2026-05-20 at 10.25.35 (1).jpeg>)
![alt text](<screenshot/WhatsApp Image 2026-05-20 at 10.25.35 (2).jpeg>)
![alt text](<screenshot/WhatsApp Image 2026-05-20 at 10.25.35.jpeg>)

## Wireframe
![alt text](<wireframe/Screenshot 2026-05-19 151553.png>)
## Kesulitan yang Ditemui
(ceritakan kendala dan cara mengatasinya)