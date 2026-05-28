import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian atas biru + foto
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Background biru atas
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE3F6FD),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                  ),
                ),
                // Foto profil di tengah
                Positioned(
                  top: 40,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: const Color(0xFFB3E5FC),
                    backgroundImage: const AssetImage('assets/foto.jpg'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            // Nama
            const Text(
              'Yulius Laki',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Mahasiswa Teknik Informatika',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),

            const SizedBox(height: 24),

            // Info rows
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _InfoRow(icon: Icons.person_outline, value: 'PAB 2025'),
                  const Divider(height: 1, color: Colors.black12),
                  _InfoRow(icon: Icons.phone_outlined, value: '1462300221'),
                  const Divider(height: 1, color: Colors.black12),
                  _InfoRow(
                    icon: Icons.email_outlined,
                    value: 'yuliuslaki@gmail.com',
                  ),
                  const Divider(height: 1, color: Colors.black12),
                  _InfoRow(icon: Icons.location_on_outlined, value: 'Surabaya'),
                  const Divider(height: 1, color: Colors.black12),
                  _InfoRow(
                    icon: Icons.account_circle_outlined,
                    value: 'yuliuslaki2026',
                  ),
                  const Divider(height: 1, color: Colors.black12),
                  _InfoRow(icon: Icons.class_outlined, value: 'Kelas A-1'),
                  const Divider(height: 1, color: Colors.black12),
                  _InfoRow(
                    icon: Icons.assignment_outlined,
                    value: 'Tugas Aktivitas 2',
                  ),
                  const Divider(height: 1, color: Colors.black12),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String value;

  const _InfoRow({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Icon(icon, size: 22, color: const Color(0xFF0288D1)),
          const SizedBox(width: 16),
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
