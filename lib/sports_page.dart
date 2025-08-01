import 'package:flutter/material.dart';

class SportsOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFA07A),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Sports",
          style: TextStyle(
            color: Color(0xFFFFA07A),
            fontSize: 24, // Set font size
            fontFamily: 'Courier', // Custom font family
            fontWeight: FontWeight.bold, // Set font weight
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xFFFFA07A)),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildOption(
              context,
              "Chicago Bulls",
              'pic/chi.webp',
              'pic/game1.webp',
              "The Bulls are the only NBA franchise to win multiple championships while never losing an NBA Finals series in their history",
              "The Chicago Bulls won six NBA championships in the 1990s.",
              "United Center, 1901 W Madison St, Chicago, IL 60612",
            ),
            const SizedBox(height: 20),
            _buildOption(
              context,
              "White Sox",
              'pic/sox.webp',
              'pic/sox2.webp',
              "The Chicago White Sox are a Major League Baseball team based in Chicago, Illinois. The team was founded in 1900.",
              "The Chicago White Sox were originally named the White Stockings, but were shortened to White Sox by local sportswriters",
              "Guaranteed Rate Field, 333 W 35th St, Chicago, IL 60616",
            ),
            const SizedBox(height: 20),
            _buildOption(
              context,
              "Chicago Fire",
              'pic/fire.webp',
              'pic/gamesoccer.webp',
              "The Chicago Fire Football Club is a professional soccer team based in Chicago, Illinois. It was founded in 1997.",
              "The Chicago Fire mascot is a Dalmatian named Sparky.",
              "Soldier Field, 1410 S Museum Campus Dr, Chicago, IL 60605",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, String title, String imagePath,
      String triviaImagePath, String description, String trivia, String address) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SportsDetailPage(
              title: title,
              imagePath: imagePath,
              triviaImagePath: triviaImagePath,
              description: description,
              trivia: trivia,
              address: address,
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
                    fontSize: 20, // Set font size
                    fontWeight: FontWeight.w600, // Set font weight
                    color: Color(0xFFBF360C), // Darker orange
                    fontFamily: 'Courier', // Custom font family
                    letterSpacing: 1.2, // Set letter spacing
                  ),
                ),
                Text(
                  address,
                  style: const TextStyle(
                    fontSize: 14,
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

class SportsDetailPage extends StatefulWidget {
  final String title;
  final String imagePath;
  final String triviaImagePath;
  final String description;
  final String trivia;
  final String address;

  const SportsDetailPage({
    required this.title,
    required this.imagePath,
    required this.triviaImagePath,
    required this.description,
    required this.trivia,
    required this.address,
  });

  @override
  _SportsDetailPageState createState() => _SportsDetailPageState();
}

class _SportsDetailPageState extends State<SportsDetailPage> {
  bool _showTrivia = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA07A),
        iconTheme: IconThemeData(color: Colors.blueGrey),
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 26, // Set font size
            fontFamily: 'Courier', // Custom font family
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0, // Set letter spacing
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                _showTrivia ? widget.triviaImagePath : widget.imagePath),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Times New Roman', // Custom font family for title
                letterSpacing: 1.5, // Set letter spacing
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.address,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _showTrivia ? widget.trivia : widget.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.greenAccent,
                fontFamily: 'Arial', // Custom font family for description
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
          _showTrivia
              ? Icons.sports_volleyball_outlined
              : Icons.sports_martial_arts,
          color: Colors.blueGrey,
        ),
        backgroundColor: Color(0xFFFFA07A),
      ),
    );
  }
}