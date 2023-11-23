class Produk {
  final String judul;
  final double harga;
  final String imagePath;
  final String deskripsi;
  final String id;

  Produk(
      {required this.judul,
      required this.harga,
      required this.imagePath,
      required this.deskripsi,
      required this.id});
}

List<Produk> produkkatalog = [
  Produk(
      id: '001',
      judul: 'All Adobe License',
      harga: double.parse(
          '435000'.replaceAll(',', '')), // Mengonversi dan menghapus koma
      imagePath: 'lib/images/produk.jpg',
      deskripsi:
          'Lisensi Adobe adalah perjanjian yang memungkinkan pengguna untuk mengakses dan menggunakan beragam perangkat lunak dan layanan yang ditawarkan oleh Adobe Systems Incorporated. Ini mencakup produk seperti Adobe Creative Cloud, Adobe Acrobat, dan banyak lagi. Lisensi Adobe memberi Anda akses ke alat-alat kreatif, desain, dan produktivitas terkemuka yang dapat membantu memenuhi berbagai kebutuhan, baik untuk penggunaan pribadi maupun bisnis.'),
  Produk(
      id: '002',
      judul: 'All Microsoft License',
      harga: double.parse(
          '735000'.replaceAll(',', '')), // Mengonversi dan menghapus koma
      imagePath: 'lib/images/produk2.jpg',
      deskripsi:
          'Lisensi Microsoft adalah perjanjian yang memungkinkan pengguna untuk mengakses dan menggunakan berbagai perangkat lunak dan layanan yang dikembangkan oleh Microsoft Corporation. Ini mencakup produk seperti Microsoft Windows, Office Suite, Azure, dan berbagai solusi bisnis lainnya. Lisensi Microsoft memberi Anda akses ke beragam alat dan platform yang dapat meningkatkan produktivitas dan efisiensi dalam berbagai konteks, termasuk penggunaan pribadi dan bisnis.'),
  Produk(
      id: '003',
      judul: 'Filmora License',
      harga: double.parse(
          '135000'.replaceAll(',', '')), // Mengonversi dan menghapus koma
      imagePath: 'lib/images/produk3.jpg',
      deskripsi:
          'Wondershare Filmora adalah perangkat lunak video editing yang populer, dirancang untuk memungkinkan pengguna untuk membuat video berkualitas tinggi dengan mudah. Dengan berbagai fitur pengeditan dan efek yang intuitif, Filmora cocok untuk pemula dan pengguna berpengalaman yang ingin menghasilkan video kreatif. Ini adalah alat yang sempurna untuk mengedit video pribadi, vlog, konten media sosial, atau bahkan proyek-proyek multimedia yang lebih besar.'),
  Produk(
      id: '004',
      judul: 'Corel Draw x7 License',
      harga: double.parse(
          '100000'.replaceAll(',', '')), // Mengonversi dan menghapus koma
      imagePath: 'lib/images/produk4.jpg',
      deskripsi:
          'CorelDRAW X7 adalah perangkat lunak desain grafis yang kuat yang digunakan untuk membuat ilustrasi, desain, layout halaman, dan banyak lagi. Produk ini ditujukan untuk desainer grafis, ilustrator, dan profesional kreatif lainnya. CorelDRAW X7 menawarkan alat-alat canggih untuk membantu menciptakan karya seni dan desain yang memukau.'),
  Produk(
      judul: 'IT Consultant',
      harga: double.parse('132000'.replaceAll(',', '')),
      imagePath: 'lib/images/jasa2.jpg',
      deskripsi:
          'Layanan IT Consultant memberikan akses ke konsultan profesional di bidang teknologi informasi yang memiliki pengetahuan dan keahlian untuk membantu individu atau perusahaan mengelola, mengoptimalkan, dan memecahkan masalah teknologi informasi. Konsultan IT dapat memberikan saran dan solusi yang disesuaikan dengan kebutuhan teknologi informasi klien, baik dalam mengembangkan strategi TI, pemilihan perangkat keras dan perangkat lunak, atau masalah keamanan dan infrastruktur.',
      id: '005'),
  Produk(
      judul: 'Mobile/Web Developer',
      harga: double.parse('360000'.replaceAll(',', '')),
      imagePath: 'lib/images/jasa1.jpg',
      deskripsi:
          'Kami adalah tim pengembang web/mobile berbakat yang siap membantu Anda mewujudkan proyek digital Anda. Dengan keahlian dalam berbagai teknologi dan bahasa pemrograman, kami dapat merancang, mengembangkan, dan mengoptimalkan situs web dan aplikasi mobile yang sesuai dengan kebutuhan Anda. Kami fokus pada pengalaman pengguna yang unggul, kinerja yang cepat, dan keamanan yang solid. Percayakan proyek Anda kepada kami, dan kami akan membantu Anda menciptakan solusi teknologi yang memukau dan efektif untuk bisnis Anda.',
      id: '006'),
  Produk(
      judul: 'Troubleshooting',
      harga: double.parse('50000'.replaceAll(',', '')),
      imagePath: 'lib/images/jasa3.jpg',
      deskripsi:
          'Layanan PC/Laptop Troubleshooting adalah layanan yang menyediakan bantuan teknis untuk memecahkan masalah yang terkait dengan komputer pribadi atau laptop. Ini mencakup identifikasi, diagnosis, dan perbaikan masalah perangkat keras dan perangkat lunak yang mungkin dialami pengguna. Teknisi komputer akan membantu memulihkan kinerja perangkat dan memecahkan masalah teknis.',
      id: '007'),
];
