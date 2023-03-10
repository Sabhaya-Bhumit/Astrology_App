import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class detailPage extends StatefulWidget {
  const detailPage({Key? key}) : super(key: key);

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            'mainPage',
            (route) => false,
          );
        },
        child: Container(
          height: 55,
          width: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color(0xffFFD9D9)),
          child: Text(
            "NEXT -->>",
            style: GoogleFonts.loveYaLikeASister(fontSize: 25),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/image 2.png",
            height: _height,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "What is ASTROLOGY?",
                style: GoogleFonts.lemonada(color: Colors.white, fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  " Astrology is divination of the supposed influence of the stars and planets on human affairs and terrestial events. It’s generally defined as the belief that astronomical phenomena, like the stars above us, when we were born, have the power to impact daily events of our lives and our personalityAstrology is the study of movement and positioning  of the planets and stars and how the position and path of the sun, moon, and star have a bearing on our lives. A horoscope bassed on where celestial bodies were on the day we were born, is an example of Astrology",
                  style: GoogleFonts.kiteOne(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
