import 'package:flutter/material.dart';

class NeighborhoodsOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFA07A), // Salmon background
      appBar: AppBar(
        backgroundColor: Colors.blueGrey, // BlueGrey AppBar background
        title: const Text(
          "Neighborhoods",
          style: TextStyle(
            color: Color(0xFFFFA07A), // Salmon title text
            fontSize: 24,
            fontFamily: 'Courier',
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFFFA07A)),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildOption(
              context,
              "Little Village",
              "2600 S Kedzie Ave, Chicago, IL 60623",
              'pic/littlevillage.jpeg',
              'pic/villita2.webp',
              "Little Village, also known as La Villita, is a vibrant neighborhood in Chicago known for its Mexican-American culture and rich history.",
            ),
            const SizedBox(height: 20),
            _buildOption(
              context,
              "Chinatown",
              "2206 S Wentworth Ave, Chicago, IL 60616",
              'pic/chinatown.jpg',
              'pic/chinatown2.jpg',
              "Chinatown in Chicago is known for its Asian-American culture, delicious cuisine, and vibrant festivals. It is one of the largest Chinatowns in the U.S.",
            ),
            const SizedBox(height: 20),
            _buildOption(
              context,
              "Little Italy",
              "1431 W Taylor St, Chicago, IL 60607",
              'pic/littleitaly.png',
              'pic/12134.webp',
              "Little Italy is a neighborhood with a strong Italian-American heritage, featuring delicious Italian restaurants and cultural landmarks.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, String title, String address,
      String imagePath, String triviaImagePath, String description) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NeighborhoodDetailPage(
              title: title,
              address: address,
              imagePath: imagePath,
              triviaImagePath: triviaImagePath,
              description: description,
            ),
          ),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFBF360C),
                    fontFamily: 'Courier',
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  address,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NeighborhoodDetailPage extends StatefulWidget {
  final String title;
  final String address;
  final String imagePath;
  final String triviaImagePath;
  final String description;

  const NeighborhoodDetailPage({
    super.key,
    required this.title,
    required this.address,
    required this.imagePath,
    required this.triviaImagePath,
    required this.description,
  });

  @override
  _NeighborhoodDetailPageState createState() => _NeighborhoodDetailPageState();
}

class _NeighborhoodDetailPageState extends State<NeighborhoodDetailPage> {
  bool _showTrivia = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFA07A),
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 26,
            fontFamily: 'Courier',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(_showTrivia ? widget.triviaImagePath : widget.imagePath),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Times New Roman',
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.address,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.greenAccent,
                fontFamily: 'Arial',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showTrivia = !_showTrivia;
          });
        },
        child: Icon(
          _showTrivia ? Icons.location_city : Icons.emoji_people,
          color: Colors.blueGrey,
        ),
        backgroundColor: const Color(0xFFFFA07A),
      ),
    );
  }
}
