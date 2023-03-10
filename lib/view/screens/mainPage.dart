import 'package:astology_app/view/screens/allDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

List astologyName = [
  {"name": "ARIES", "image": "assets/images/0.png"},
  {"name": "AQUARIUS", "image": "assets/images/10.png"},
  {"name": "CAPRICORN", "image": "assets/images/9.png"},
  {"name": "GEMINI", "image": "assets/images/2.png"},
  {"name": "LEO", "image": "assets/images/4.png"},
  {"name": "LIBRA", "image": "assets/images/6.png"},
  {"name": "PISCES", "image": "assets/images/3.png"},
  {"name": "SAGITTARIUS", "image": "assets/images/8.png"},
  {"name": "SCORPIO", "image": "assets/images/7.png"},
  {"name": "TAURUS", "image": "assets/images/1.png"},
  {"name": "VIRGO", "image": "assets/images/5.png"}
];
List foundUsers = [];
TextEditingController textEditingController = TextEditingController();

class _mainPageState extends State<mainPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    foundUsers = astologyName;
  }

  void filter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = astologyName;
    } else {
      results = astologyName
          .where((user) =>
              user['name'].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/image 2.png",
          height: _height,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 50),
              Expanded(
                  child: TextFormField(
                onChanged: (value) => filter(value),
                controller: textEditingController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          textEditingController.clear();
                          foundUsers = astologyName;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                    hintText: "Search",
                    label: Text("Search")),
              )),
              Expanded(
                flex: 10,
                child: (foundUsers.isNotEmpty)
                    ? ListView.builder(
                        itemCount: foundUsers.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => allDetalPage(
                                          image: foundUsers[i]['image'],
                                          name: foundUsers[i]['name'],
                                          index: i)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 100,
                                width: double.infinity,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xffFFDDD).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.white, width: 5)),
                                child: Row(
                                  children: [
                                    Text(" ${foundUsers[i]['name']}",
                                        style: GoogleFonts.loveYaLikeASister(
                                            fontSize: 40)),
                                    Spacer(),
                                    Image.asset(
                                      foundUsers[i]['image'],
                                      height: 70,
                                    ),
                                    SizedBox(width: 5),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : (textEditingController.text == "")
                        ? ListView.builder(
                            itemCount: astologyName.length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => allDetalPage(
                                              image: foundUsers[i]['image'],
                                              name: astologyName[i]['name'],
                                              index: i)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 100,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xffFFDDD).withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Colors.white, width: 5)),
                                    child: Row(
                                      children: [
                                        Text(" ${astologyName[i]['name']}",
                                            style:
                                                GoogleFonts.loveYaLikeASister(
                                                    fontSize: 40)),
                                        Spacer(),
                                        Image.asset(
                                          foundUsers[i]['image'],
                                          height: 70,
                                        ),
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              'No results found',
                            ),
                          ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
