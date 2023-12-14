import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_prak_mobile/shared/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _surah = [
    SurahTile(namaSurah: "An-Nas", noSurah: 114),
    SurahTile(namaSurah: "Al-Falaq", noSurah: 113),
    SurahTile(namaSurah: "Al-Ikhlas", noSurah: 112),
    SurahTile(namaSurah: "Al-Lahab", noSurah: 111),
    SurahTile(namaSurah: "An-Nashr", noSurah: 110),
    SurahTile(namaSurah: "An-Kafirun", noSurah: 109),
    SurahTile(namaSurah: "An-Kautsar", noSurah: 108),
    SurahTile(namaSurah: "An-Ma'un", noSurah: 107),
    SurahTile(namaSurah: "Al-Quraisy", noSurah: 106),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SecondColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MainColor,
          toolbarHeight: 100,
          centerTitle: true,
          title: Text(
            "بِسْــــــــــــــــــمِ اللهِ الرَّحْمَنِ الرَّحِيْمِ",
            style: GoogleFonts.changa(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: _surah.length,
          itemBuilder: (context, index) => _surah[index],
        ));
  }
}

class SurahTile extends StatelessWidget {
  final String namaSurah;
  final int noSurah;
  const SurahTile({
    super.key,
    required this.namaSurah,
    required this.noSurah,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4,
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/surah', arguments: {
          'noSurah': noSurah,
          'nama_surah': namaSurah,
        }),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                //Surah Number
                Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  child: Text(
                    noSurah.toString(),
                    style: GoogleFonts.lilitaOne(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: MainColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                // Surah Name and Juz
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Juz 30",
                      style: GoogleFonts.lilitaOne(
                        color: MainColor,
                        fontSize: 27,
                      ),
                    ),
                    Text(
                      namaSurah,
                      style: GoogleFonts.lilitaOne(
                        color: MainColor,
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
