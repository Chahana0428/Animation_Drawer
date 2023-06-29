import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task/Custom.dart';
import 'package:task/model/modelclass.dart';
import 'package:task/widgets/text_view.dart';

class HomeScreenData extends StatefulWidget {
  const HomeScreenData({super.key});

  @override
  State<HomeScreenData> createState() => _HomeScreenDataState();
}

class _HomeScreenDataState extends State<HomeScreenData> {
  Modelclass? modelclass;
  Current_bookingsBean? cbooking;
  List<PackagesBean>? package;
  List<String> img = [
    'assets/image_icon/day1.png',
    'assets/image_icon/day3.png',
    'assets/image_icon/day5.png',
    'assets/image_icon/weekend.png'
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child:
                        Image.asset('assets/image_icon/user.png', height: 75),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView('Welcome',
                          fontSize: 16,
                          textColor: ColorClass.gray,
                          fontFamily: 'Alegreya',
                          fontWeight: FontWeight.w400),
                      TextView('Emily Cyrus',
                          fontSize: 16,
                          textColor: ColorClass.pink1,
                          fontFamily: 'Alegreya',
                          fontWeight: FontWeight.w400),
                    ],
                  )
                ],
              ),
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25, left: 25, right: 35),
                  decoration: BoxDecoration(
                      color: ColorClass.pink,
                      borderRadius: BorderRadius.circular(10)),
                  height: height * 0.25,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 175,
                          child: TextView(
                            'Nanny And Babysitting Services',
                            fontSize: 18,
                            fontFamily: Constants.bold,
                            fontWeight: FontWeight.bold,
                            textColor: ColorClass.nevy,
                          ),
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 20),
                            decoration: BoxDecoration(
                                color: ColorClass.nevy,
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 8, top: 8),
                            child: TextView('Book Now',
                                textColor: Colors.white, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Image(
                  image: AssetImage('assets/image_icon/lady.png'),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 10),
              child: TextView(
                'Your Current Booking',
                textColor: ColorClass.nevy,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            modelclass != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                        padding: const EdgeInsets.all(
                          15,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(-2, -5)),
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(2, 5),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextView(
                                  cbooking!.package_label.toString(),
                                  fontSize: 16,
                                  textColor: ColorClass.pink,
                                  fontWeight: FontWeight.w600,
                                ),
                                Container(
                                  height: 25,
                                  width: 70,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFE36DA6),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextView('Start',
                                      textColor: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextView(
                                    "From ",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    textColor: Colors.black,
                                  ),
                                ),
                                TextView(
                                  "To ",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  textColor: Colors.black,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: date('${cbooking!.from_date}',
                                      Icons.calendar_month, ColorClass.pink),
                                ),
                                date('${cbooking!.to_date}',
                                    Icons.calendar_month, ColorClass.pink)
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: date(
                                      '${cbooking!.from_time}',
                                      Icons.access_time_outlined,
                                      ColorClass.pink),
                                ),
                                date('${cbooking!.to_time}',
                                    Icons.access_time_outlined, ColorClass.pink)
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorClass.nevy,
                                      borderRadius: BorderRadius.circular(25)),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: date('Rate Us', Icons.star_border,
                                      Colors.white,
                                      iconSize: 8,
                                      fsize: 10,
                                      spaceSize: 2,
                                      txtColor: Colors.white),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorClass.nevy,
                                      borderRadius: BorderRadius.circular(25)),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: date('Geolocation',
                                      Icons.location_on_outlined, Colors.white,
                                      fsize: 11,
                                      iconSize: 8,
                                      spaceSize: 2,
                                      txtColor: Colors.white),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorClass.nevy,
                                      borderRadius: BorderRadius.circular(25)),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: date('Survillence',
                                      Icons.settings_voice, Colors.white,
                                      txtColor: Colors.white,
                                      iconSize: 8,
                                      fsize: 11,
                                      spaceSize: 2),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, bottom: 10),
                        child: TextView(
                          'Packages',
                          textColor: ColorClass.nevy,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.builder(
                        itemCount: package!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 27, vertical: 10),
                            decoration: BoxDecoration(
                                color: index % 2 != 0
                                    ? ColorClass.blue1
                                    : ColorClass.pink,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      img[index],
                                      height: 28,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: index % 2 != 0
                                              ? ColorClass.blue
                                              : ColorClass.pink1,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: TextView(
                                        'Book Now',
                                        textColor: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                      '${package![index].package_name}',
                                      textColor: ColorClass.nevy,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    TextView(
                                      '${package![index].price}',
                                      textColor: ColorClass.nevy,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextView('${package![index].description}',
                                    textColor: ColorClass.txtColor,
                                    textOverflow: TextOverflow.ellipsis,
                                    maxLines: 2),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: ColorClass.blue1,
                      backgroundColor: Colors.white,
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget date(String date, IconData icon, Color color,
      {Color? txtColor, double? fsize, int? iconSize, int? spaceSize}) {
    return Row(children: [
      Icon(
        icon,
        size: 15,
        color: color,
      ),
      const SizedBox(
        width: 7,
      ),
      TextView(
        date,
        fontSize: fsize,
        fontWeight: FontWeight.w500,
        textColor: txtColor,
      )
    ]);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        getdata();
      },
    );
  }

  getdata() async {
    try {
      var response = await Dio().get('https://cgprojects.in/flutter/');
      if (response != null) {
        var Str = response.toString();
        final decodedMap = json.decode(Str);
        modelclass = Modelclass.fromJson(decodedMap);
        if (modelclass != null) {
          cbooking = modelclass!.current_bookings;
          package = modelclass!.packages;
        }
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }
}
