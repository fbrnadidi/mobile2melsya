import 'package:flutter/material.dart';

void main() {
  runApp(const livescore());
}

class livescore extends StatelessWidget {
  const livescore({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: const TabBarView(
          children: <Widget>[
            HomeContent(),
            FinishedMatchesSliderWidget(),
            LiveMatchScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Glad to see you!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            const Text(
              "Esther Howard!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            // Modified TextField with rounded border and prefix icon
            TextField(
              decoration: InputDecoration(
                hintText: "Find your favorite club",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // Rounded border
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                prefixIcon: const Icon(Icons.search), // Prefix icon
                fillColor: Colors.white30, // Background color
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Live Match",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  LiveScoreWidget(
                    homeTeam: "Arsenal",
                    awayTeam: "Chelsea",
                    homeScore: 2,
                    awayScore: 1,
                    homeLogoUrl: 'assets/arsenal.png',
                    awayLogoUrl: 'assets/chelsea.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                },
                child: const Text("Live"),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Finished Match",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            FinishedMatchesSliderWidget(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class LiveScoreWidget extends StatelessWidget {
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final String homeLogoUrl;
  final String awayLogoUrl;

  const LiveScoreWidget({
    Key? key,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.homeLogoUrl,
    required this.awayLogoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClubLogoWidget(logoUrl: homeLogoUrl),
        const SizedBox(width: 8),
        Text(
          '$homeScore - $awayScore',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        ClubLogoWidget(logoUrl: awayLogoUrl),
      ],
    );
  }
}

class ClubLogoWidget extends StatelessWidget {
  final String logoUrl;

  const ClubLogoWidget({
    Key? key,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(logoUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FinishedMatchesSliderWidget extends StatelessWidget {
  const FinishedMatchesSliderWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 400,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          String homeLogoUrl = '';
          String awayLogoUrl = '';
          String score = '';
          String matchTitle = '';
          String time = '';
          if (index == 0) {
            homeLogoUrl = 'assets/Juventus.png';
            awayLogoUrl = 'assets/paris.png';
            score = '1 - 0';
            matchTitle = 'Skor Liga Champions';
            time = 'Yesterday';
          } else if (index == 1) {
            homeLogoUrl = 'assets/munchen.png';
            awayLogoUrl = 'assets/BVB.png';
            score = '0 - 2';
            matchTitle = 'League B';
            time = '15 July 2020';
          }

          return MatchContainer(
            homeLogoUrl: homeLogoUrl,
            awayLogoUrl: awayLogoUrl,
            score: score,
            matchTitle: matchTitle,
            time: time,
          );
        },
      ),
    );
  }
}

class MatchContainer extends StatelessWidget {
  final String homeLogoUrl;
  final String awayLogoUrl;
  final String score;
  final String matchTitle;
  final String time;

  const MatchContainer({
    Key? key,
    required this.homeLogoUrl,
    required this.awayLogoUrl,
    required this.score,
    required this.matchTitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      width: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            matchTitle,
            style: TextStyle(fontSize: 20, color: Colors.black ),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClubLogoWidget(logoUrl: homeLogoUrl),
              const SizedBox(width: 10),
              Text(
                score,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              ClubLogoWidget(logoUrl: awayLogoUrl),
            ],
          ),
        ],
      ),
    );
  }
}

class LiveMatchScreen extends StatelessWidget {
  const LiveMatchScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Live Match",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red), // Border merah
              borderRadius: BorderRadius.circular(20), // Border rounded
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Arsenal vs Chelsea",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red, // Warna latar merah
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Detik ke 78",
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
