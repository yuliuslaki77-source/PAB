import 'package:flutter/material.dart';

// ─────────────────────────────────────────
// DATA DOKTER
// ─────────────────────────────────────────
const List<Map<String, String>> daftarDokter = [
  {
    'nama': 'dr. Kevin Alvaro',
    'spesialis': 'Dokter Umum',
    'foto': 'assets/dokter_umum.jpg',
    'jadwal': 'Senin - Jumat, 08.00 - 17.00',
    'bio':
        'Dokter umum berpengalaman lebih dari 8 tahun dalam menangani berbagai penyakit umum dan keluhan sehari-hari.',
    'rating': '4.6',
  },
  {
    'nama': 'dr. Alicia Vanya',
    'spesialis': 'Dokter Gigi',
    'foto': 'assets/dokter_gigi.jpg',
    'jadwal': 'Senin - Sabtu, 09.00 - 16.00',
    'bio':
        'Dokter gigi spesialis dengan pengalaman lebih dari 7 tahun dalam perawatan gigi dan mulut.',
    'rating': '4.7',
  },
  {
    'nama': 'dr. Callista',
    'spesialis': 'Dokter Anak',
    'foto': 'assets/dokter_anak.jpg',
    'jadwal': 'Senin - Jumat, 08.00 - 17.00',
    'bio':
        'Dokter spesialis anak dengan pengalaman lebih dari 10 tahun di bidang klinis pediatri.',
    'rating': '4.5',
  },
  {
    'nama': 'drh. Keisha Amara',
    'spesialis': 'Dokter Hewan',
    'foto': 'assets/dokter_hewan.jpg',
    'jadwal': 'Senin - Sabtu, 08.00 - 16.00',
    'bio':
        'Dokter hewan berpengalaman lebih dari 6 tahun dalam menangani berbagai jenis hewan peliharaan.',
    'rating': '4.8',
  },
];

// ─────────────────────────────────────────
// DOKTER SCREEN (menu kategori)
// ─────────────────────────────────────────
class DokterScreen extends StatelessWidget {
  const DokterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.medical_services_outlined,
      Icons.masks_outlined,
      Icons.child_care_outlined,
      Icons.pets_outlined,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'PRAKTIKUM PAB',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner dokter dari link URL
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 160,
                width: double.infinity,
                color: const Color(0xFFB3E5FC),
                child: Stack(
                  children: [
                    Image.network(
                      'https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=800',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (_, __, ___) =>
                          Container(color: const Color(0xFF0288D1)),
                    ),
                    Container(color: Colors.black.withOpacity(0.3)),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HealthHub:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Your health partner',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Menu kategori dokter
            ...List.generate(daftarDokter.length, (index) {
              final dokter = daftarDokter[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _MenuButton(
                  icon: icons[index],
                  label: dokter['spesialis']!,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DokterDetailPage(dokter: dokter),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFE3F6FD),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF0288D1), size: 24),
            const SizedBox(width: 14),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// DOKTER DETAIL PAGE
// ─────────────────────────────────────────
class DokterDetailPage extends StatelessWidget {
  final Map<String, String> dokter;

  const DokterDetailPage({super.key, required this.dokter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto dokter
            SizedBox(
              width: double.infinity,
              height: 260,
              child: Image.asset(
                dokter['foto']!,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Container(
                  color: const Color(0xFFB3E5FC),
                  child: const Center(
                    child: Icon(Icons.person, size: 100, color: Colors.white),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama + favorit
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dokter['nama']!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              dokter['spesialis']!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Jadwal
                  const Text(
                    'JADWAL PRAKTIK',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dokter['jadwal']!,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 16),

                  // Biografi
                  const Text(
                    'BIOGRAFI SINGKAT',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dokter['bio']!,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Rating
                  Row(
                    children: [
                      ...List.generate(
                        4,
                        (_) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                      ),
                      const Icon(
                        Icons.star_half,
                        color: Colors.amber,
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        dokter['rating']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Tombol buat janji
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => KonfirmasiDialog(dokter: dokter),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Buat Janji Temu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// KONFIRMASI DIALOG
// ─────────────────────────────────────────
class KonfirmasiDialog extends StatelessWidget {
  final Map<String, String> dokter;

  const KonfirmasiDialog({super.key, required this.dokter});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF4FC3F7).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.calendar_month,
                color: Color(0xFF4FC3F7),
                size: 30,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Konfirmasi Janji Temu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Ingin menjadwalkan\nkonsultasi dengan\n${dokter['nama']}?',
              style: const TextStyle(fontSize: 13, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black54,
                      side: const BorderSide(color: Colors.black26),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Batal'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => JanjiSuksesPage(dokter: dokter),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4FC3F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// JANJI SUKSES PAGE
// ─────────────────────────────────────────
class JanjiSuksesPage extends StatelessWidget {
  final Map<String, String> dokter;

  const JanjiSuksesPage({super.key, required this.dokter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Janji Temu',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner sukses
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: const Color(0xFF4FC3F7),
              child: const Column(
                children: [
                  Icon(Icons.check_circle, color: Colors.white, size: 60),
                  SizedBox(height: 10),
                  Text(
                    'Janji Temu Berhasil Dibuat!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Foto dokter
            SizedBox(
              width: double.infinity,
              height: 220,
              child: Image.asset(
                dokter['foto']!,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Container(
                  color: const Color(0xFFB3E5FC),
                  child: const Center(
                    child: Icon(Icons.person, size: 100, color: Colors.white),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dokter['nama']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    dokter['spesialis']!,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'DETAIL JANJI TEMU',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _DetailRow(
                    icon: Icons.calendar_today,
                    label: 'Tanggal',
                    value: 'Senin, 26 Mei 2026',
                  ),
                  const SizedBox(height: 10),
                  _DetailRow(
                    icon: Icons.access_time,
                    label: 'Waktu',
                    value: '09:00 AM',
                  ),
                  const SizedBox(height: 10),
                  _DetailRow(
                    icon: Icons.location_on,
                    label: 'Lokasi',
                    value: 'Klinik HealthHub, Lantai 2',
                  ),
                  const SizedBox(height: 10),
                  _DetailRow(
                    icon: Icons.person,
                    label: 'Pasien',
                    value: 'Yulius Laki',
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.popUntil(context, (route) => route.isFirst),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Kembali ke Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF4FC3F7)),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 11, color: Colors.black45),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
