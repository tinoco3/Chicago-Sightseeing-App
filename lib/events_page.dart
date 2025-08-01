import 'package:flutter/material.dart';

class EventsOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFA07A),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Events",
          style: TextStyle(
            color: Color(0xFFFFA07A),
            fontSize: 24,
            fontFamily: 'Courier',
            fontWeight: FontWeight.bold,
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
              "5 de Mayo",
              "2600 S Kedzie Ave, Chicago, IL 60623",
              'pic/cinco.webp',
              'pic/mexico5.jpg',
              "In Chicago, Cinco de Mayo is celebrated with cultural events, food, and music.",
              "In Mexico, 5 de Mayo is a significant day in the state of Puebla.",
            ),
            const SizedBox(height: 20),
            _buildOption(
              context,
              "Lollapalooza",
              "Grant Park, Chicago, IL 60601",
              'pic/lollapalooza3.webp',
              'pic/rain.webp',
              "Lollapalooza is a four-day music festival featuring multiple genres.",
              "Lollapalooza started in 1991 as a farewell tour for Jane's Addiction.",
            ),
            const SizedBox(height: 20),
            _buildOption(
              context,
              "Taste of Chicago",
              "Grant Park, Chicago, IL 60601",
              'pic/taste.webp',
              'pic/food.jpg',
              "Taste of Chicago is a popular food festival featuring top vendors and entertainment.",
              "The festival evolved from ChicagoFest, which debuted two years earlier.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, String title, String address, String imagePath,
      String triviaImagePath, String description, String trivia) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailPage(
              title: title,
              address: address,
              imagePath: imagePath,
              triviaImagePath: triviaImagePath,
              description: description,
              trivia: trivia,
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
                    color: Colors.black54,
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

class EventDetailPage extends StatefulWidget {
  final String title;
  final String address;
  final String imagePath;
  final String triviaImagePath;
  final String description;
  final String trivia;

  const EventDetailPage({
    required this.title,
    required this.address,
    required this.imagePath,
    required this.triviaImagePath,
    required this.description,
    required this.trivia,
  });

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
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
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _showTrivia ? widget.trivia : widget.description,
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
          _showTrivia ? Icons.emoji_events : Icons.elderly,
          color: Colors.blueGrey,
        ),
        backgroundColor: Color(0xFFFFA07A),
      ),
    );
  }
}
