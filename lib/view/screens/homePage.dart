import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

late AnimationController textAnimationController;
late Animation Text1;
late Animation Text2;

class _homePageState extends State<homePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    textAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3000))
          ..forward();

    Text1 = Tween<Offset>(begin: Offset(-300, 0), end: Offset(0, 0)).animate(
        CurvedAnimation(parent: textAnimationController, curve: Curves.linear));
    Text2 = Tween<double>(begin: 0.1, end: 1).animate(
        CurvedAnimation(parent: textAnimationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/image 1.png",
          height: _height,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            AnimatedBuilder(
              animation: textAnimationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Text1.value,
                  child: Text(
                    " ALWAYS \n ASTROLOGY ",
                    style: GoogleFonts.loveYaLikeASister(
                        color: Colors.white, fontSize: 45),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            AnimatedBuilder(
              animation: textAnimationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Text1.value,
                  child: Text(
                    "    Your signs are a part of you",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            ),
            SizedBox(height: 200),
            AnimatedBuilder(
                animation: textAnimationController,
                builder: (context, child) {
                  return Center(
                      child: Transform.scale(
                    scale: Text2.value,
                    child: Column(
                      children: [
                        Text(
                          "Get ready to explore!",
                          style: GoogleFonts.loveYaLikeASister(
                              color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('detailPage');
                          },
                          child: Container(
                            height: 55,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xffFFD9D9)),
                            child: Text(
                              "Explore -->>",
                              style:
                                  GoogleFonts.loveYaLikeASister(fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
                })
          ],
        )
      ],
    ));
  }
}
