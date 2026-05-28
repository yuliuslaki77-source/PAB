import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, String>> images = [
    {
      'url':
          'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=800&auto=format',
      'label': 'Konsultasi',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1579684385127-1ef15d508118?w=800&auto=format',
      'label': 'Pemeriksaan',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1584820927498-cfe5211fd8bf?w=800&auto=format',
      'label': 'Laboratorium',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=800&auto=format',
      'label': 'Radiologi',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1551076805-e1869033e561?w=800&auto=format',
      'label': 'Operasi',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1631815589968-fdb09a223b1e?w=800&auto=format',
      'label': 'Farmasi',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=800&auto=format',
      'label': 'Pediatri',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=800&auto=format',
      'label': 'Kardiologi',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1530497610245-94d3c16cda28?w=800&auto=format',
      'label': 'Ortopedi',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1504813184591-01572f98c85f?w=800&auto=format',
      'label': 'Onkologi',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1526256262350-7da7584cf5eb?w=800&auto=format',
      'label': 'Neurologi',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1543333995-a78aea2eee50?w=800&auto=format',
      'label': 'Dermatologi',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
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
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner utama full width
            _buildImageCard(
              images[0]['url']!,
              images[0]['label']!,
              aspectRatio: 16 / 7,
            ),
            const SizedBox(height: 12),

            // Section: Layanan Unggulan (2 kolom)
            _sectionTitle('Layanan Unggulan'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildImageCard(
                    images[1]['url']!,
                    images[1]['label']!,
                    aspectRatio: 1,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildImageCard(
                    images[2]['url']!,
                    images[2]['label']!,
                    aspectRatio: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Section: Fasilitas (full width)
            _sectionTitle('Fasilitas'),
            const SizedBox(height: 8),
            _buildImageCard(
              images[3]['url']!,
              images[3]['label']!,
              aspectRatio: 16 / 8,
            ),
            const SizedBox(height: 12),

            // Section: Spesialisasi (grid 2 kolom)
            _sectionTitle('Spesialisasi'),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                return _buildImageCard(
                  images[index + 4]['url']!,
                  images[index + 4]['label']!,
                );
              },
            ),
            const SizedBox(height: 12),

            // Section: Info Terkini (2 gambar full width)
            _sectionTitle('Info Terkini'),
            const SizedBox(height: 8),
            _buildImageCard(
              images[10]['url']!,
              images[10]['label']!,
              aspectRatio: 16 / 7,
            ),
            const SizedBox(height: 10),
            _buildImageCard(
              images[11]['url']!,
              images[11]['label']!,
              aspectRatio: 16 / 7,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildImageCard(
    String url,
    String label, {
    double aspectRatio = 3 / 4,
  }) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              url,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Container(
                  color: Colors.grey[200],
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF4FC3F7),
                      strokeWidth: 2,
                    ),
                  ),
                );
              },
              errorBuilder: (_, __, ___) => Container(
                color: Colors.grey[300],
                child: const Icon(
                  Icons.broken_image,
                  color: Colors.white54,
                  size: 36,
                ),
              ),
            ),
            // Gradient label di bawah gambar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
