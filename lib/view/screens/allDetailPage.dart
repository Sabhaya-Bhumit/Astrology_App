// import 'package:astrology_app/modals/horoscope.dart';
// import 'package:astrology_app/providers/horoscope_api_helper.dart';
// import 'package:astrology_app/utils/globals.dart';
// import 'package:astrology_app/views/home_screen/widget/widget.dart';
import 'package:astology_app/helper/allData.dart';
import 'package:astology_app/modal/Horoscope.dart';
import 'package:flutter/material.dart';

class allDetalPage extends StatefulWidget {
  allDetalPage(
      {Key? key, required this.image, required this.name, required this.index})
      : super(key: key);

  String image;
  String name;
  int index;

  @override
  State<allDetalPage> createState() => _allDetalPageState();
}

class _allDetalPageState extends State<allDetalPage> {
  late Image bgImage;
  bool under1 = false;
  bool under2 = true;
  bool under3 = false;
  int selectedIndex = 0;
  String day = "today";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bgImage = Image.asset("assets/images/image 1.png");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    precacheImage(bgImage.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: bgImage.image,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color(0XFF181727),
              BlendMode.color,
            ),
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              color: Color(0XFF181727).withOpacity(0.7),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          "${widget.image}",
                          // color: Colors.white.withOpacity(0.3),
                          height: 280,
                          width: 280,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              '${widget.image}',
                              height: 23,
                              width: 50,
                              // color: Colors.white.withOpacity(0.8),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.name.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () async {
                                  setState(() {
                                    under1 = true;
                                    under2 = false;
                                    under3 = false;
                                    day = "week";
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "YESTERDAY",
                                      style: TextStyle(
                                          color: (under1)
                                              ? Colors.white.withOpacity(0.6)
                                              : Colors.white.withOpacity(0.3),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 2,
                                      width: 75,
                                      decoration: BoxDecoration(
                                        color: (under1)
                                            ? Colors.white.withOpacity(0.6)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  setState(() {
                                    under1 = false;
                                    under2 = true;
                                    under3 = false;
                                    day = "today";
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "TODAY",
                                      style: TextStyle(
                                          color: (under2)
                                              ? Colors.white.withOpacity(0.6)
                                              : Colors.white.withOpacity(0.3),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 2,
                                      width: 55,
                                      decoration: BoxDecoration(
                                        color: (under2)
                                            ? Colors.white.withOpacity(0.6)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  setState(() {
                                    under1 = false;
                                    under2 = false;
                                    under3 = true;
                                    day = "tomorrow";
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "TOMORROW",
                                      style: TextStyle(
                                          color: (under3)
                                              ? Colors.white.withOpacity(0.6)
                                              : Colors.white.withOpacity(0.3),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 2,
                                      width: 85,
                                      decoration: BoxDecoration(
                                        color: (under3)
                                            ? Colors.white.withOpacity(0.6)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 345,
                          child: FutureBuilder(
                            future: Future.wait([
                              HoroscopeApiHelper.horoscopeApiHelper.todayData(
                                  sunShineName: widget.name.toLowerCase(),
                                  day: day),
                              HoroscopeApiHelper.horoscopeApiHelper
                                  .todayCareerData(
                                      sunShineName: widget.name.toLowerCase(),
                                      day: day)
                            ]),
                            builder: (context, snapShot) {
                              if (snapShot.hasError) {
                                return Center(
                                  child: Text(
                                    "ERROR: ${snapShot.error}",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                );
                              } else if (snapShot.hasData) {
                                List<Horoscope?>? horoscopeData = snapShot.data;
                                String data = horoscopeData![0]!.data;
                                String data2 = horoscopeData[1]!.data;
                                // String data = horoscopeData![0]!.data;
                                // String data2 = horoscopeData[0]!.data;

                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${data}\n",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 17,
                                          letterSpacing: 1,
                                          leadingDistribution:
                                              TextLeadingDistribution
                                                  .proportional,
                                          wordSpacing: 1,
                                          height: 1.4,
                                        ),
                                      ),
                                      Text(
                                        "",
                                        // "      ${data.split(" - ")[1]}\n",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 17,
                                          letterSpacing: 1,
                                          leadingDistribution:
                                              TextLeadingDistribution
                                                  .proportional,
                                          wordSpacing: 1,
                                          height: 1.4,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                      Text(
                                        "Career: \n",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 17,
                                          letterSpacing: 1,
                                          leadingDistribution:
                                              TextLeadingDistribution
                                                  .proportional,
                                          wordSpacing: 1,
                                          height: 1.4,
                                        ),
                                      ),
                                      Text(
                                        "      ${data2}",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 17,
                                          letterSpacing: 1,
                                          leadingDistribution:
                                              TextLeadingDistribution
                                                  .proportional,
                                          wordSpacing: 1,
                                          height: 1.4,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0XFF181727),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
