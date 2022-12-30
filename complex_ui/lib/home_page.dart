import 'dart:convert';

import 'package:complex_ui/app_layout.dart';
import 'package:complex_ui/video_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/info.json')
        .then((value) {
      info = json.decode(value);
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: EdgeInsets.only(
          top: AppLayout.getHeight(70),
          left: AppLayout.getWidth(30),
          right: AppLayout.getWidth(30),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Training',
                  style: TextStyle(
                    fontSize: AppLayout.getHeight(30),
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: AppLayout.getHeight(20),
                  color: color.AppColor.homePageIcons,
                ),
                SizedBox(
                  width: AppLayout.getWidth(10),
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: AppLayout.getHeight(20),
                  color: color.AppColor.homePageIcons,
                ),
                SizedBox(
                  width: AppLayout.getWidth(15),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: AppLayout.getHeight(20),
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            SizedBox(
              height: AppLayout.getHeight(30),
            ),
            Row(
              children: [
                Text(
                  'Your Program',
                  style: TextStyle(
                    fontSize: AppLayout.getHeight(20),
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: AppLayout.getHeight(20),
                    color: color.AppColor.homePageDetail,
                  ),
                ),
                SizedBox(
                  width: AppLayout.getWidth(5),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: AppLayout.getHeight(20),
                    color: color.AppColor.homePageIcons,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppLayout.getHeight(15),
            ),
            Container(
              width: AppLayout.getSize(context).width,
              height: AppLayout.getHeight(200),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(.8),
                    color.AppColor.gradientSecond.withOpacity(.9),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppLayout.getHeight(10)),
                  bottomLeft: Radius.circular(AppLayout.getHeight(10)),
                  bottomRight: Radius.circular(AppLayout.getHeight(10)),
                  topRight: Radius.circular(AppLayout.getHeight(80)),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(
                          AppLayout.getHeight(5), AppLayout.getHeight(10)),
                      blurRadius: AppLayout.getHeight(20),
                      color: color.AppColor.gradientSecond.withOpacity(.2))
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    left: AppLayout.getWidth(20),
                    top: AppLayout.getHeight(25),
                    right: AppLayout.getHeight(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next workout',
                      style: TextStyle(
                          fontSize: AppLayout.getHeight(16),
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(5),
                    ),
                    Text(
                      'Legs Toning',
                      style: TextStyle(
                          fontSize: AppLayout.getHeight(25),
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(5),
                    ),
                    Text(
                      'and Glutes Workout',
                      style: TextStyle(
                          fontSize: AppLayout.getHeight(25),
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(25),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: AppLayout.getHeight(20),
                              color: color.AppColor.homePageContainerTextSmall,
                            ),
                            SizedBox(
                              width: AppLayout.getHeight(10),
                            ),
                            Text(
                              '60 min',
                              style: TextStyle(
                                  fontSize: AppLayout.getHeight(14),
                                  color: color
                                      .AppColor.homePageContainerTextSmall),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppLayout.getHeight(60)),
                            boxShadow: [
                              BoxShadow(
                                color: color.AppColor.gradientFirst,
                                blurRadius: AppLayout.getHeight(10),
                                offset: Offset(
                                  AppLayout.getHeight(4),
                                  AppLayout.getHeight(8),
                                ),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: AppLayout.getHeight(60),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppLayout.getHeight(5),
            ),
            Container(
              height: AppLayout.getHeight(140),
              width: AppLayout.getSize(context).width,
              child: Stack(
                children: [
                  Container(
                    width: AppLayout.getSize(context).width,
                    margin: EdgeInsets.only(top: AppLayout.getHeight(30)),
                    height: AppLayout.getHeight(120),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHeight(20)),
                      image: const DecorationImage(
                        image: AssetImage('assets/card.jpg'),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: AppLayout.getHeight(40),
                            offset: Offset(AppLayout.getHeight(8),
                                AppLayout.getHeight(10)),
                            color:
                                color.AppColor.gradientSecond.withOpacity(.3)),
                        BoxShadow(
                            blurRadius: AppLayout.getHeight(10),
                            offset: Offset(AppLayout.getHeight(-1),
                                AppLayout.getHeight(-5)),
                            color:
                                color.AppColor.gradientSecond.withOpacity(.3)),
                      ],
                    ),
                  ),
                  Container(
                    height: AppLayout.getHeight(200),
                    width: AppLayout.getSize(context).width,
                    margin: EdgeInsets.only(
                        right: AppLayout.getWidth(200),
                        bottom: AppLayout.getHeight(30)),
                    decoration: BoxDecoration(
                      // color: Colors.redAccent.withOpacity(.2),
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHeight(20)),
                      image: const DecorationImage(
                        image: AssetImage('assets/figure.png'),
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: AppLayout.getHeight(100),
                    margin: EdgeInsets.only(
                        left: AppLayout.getWidth(100),
                        top: AppLayout.getHeight(50)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You are doing great',
                          style: TextStyle(
                              fontSize: AppLayout.getHeight(18),
                              fontWeight: FontWeight.bold,
                              color: color.AppColor.homePageDetail),
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(10),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Keet it up\n",
                            style: TextStyle(
                              color: color.AppColor.homePagePlanColor,
                              fontSize: AppLayout.getHeight(16),
                            ),
                            children: const [
                              TextSpan(text: "stick to your plan")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppLayout.getHeight(10),
            ),
            Row(
              children: [
                Text(
                  "Area of focus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppLayout.getHeight(25),
                      fontWeight: FontWeight.w500,
                      color: color.AppColor.homePageTitle),
                )
              ],
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: (info.length.toDouble() / 2).toInt(),
                    itemBuilder: (_, i) {
                      int a = 2 * i; //0,2
                      int b = 2 * i + 1; //1,3
                      return Row(
                        children: [
                          Container(
                            height: AppLayout.getHeight(150),
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            margin: EdgeInsets.only(
                                left: AppLayout.getWidth(30),
                                bottom: AppLayout.getHeight(15),
                                top: AppLayout.getHeight(15)),
                            padding:
                                EdgeInsets.only(bottom: AppLayout.getHeight(5)),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppLayout.getHeight(15),
                              ),
                              image: DecorationImage(
                                image: AssetImage(info[a]['img']),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: AppLayout.getHeight(3),
                                  offset: Offset(
                                    AppLayout.getHeight(5),
                                    AppLayout.getWidth(5),
                                  ),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(.1),
                                ),
                                BoxShadow(
                                  blurRadius: AppLayout.getHeight(3),
                                  offset: Offset(
                                    AppLayout.getHeight(-5),
                                    AppLayout.getWidth(-5),
                                  ),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(.1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[a]['title'],
                                  style: TextStyle(
                                    fontSize: AppLayout.getHeight(20),
                                    color: color.AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: AppLayout.getWidth(30),
                              bottom: AppLayout.getHeight(15),
                              top: AppLayout.getHeight(15),
                            ),
                            height: AppLayout.getHeight(150),
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            padding:
                                EdgeInsets.only(bottom: AppLayout.getHeight(5)),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppLayout.getHeight(15),
                              ),
                              image: DecorationImage(
                                image: AssetImage(info[b]['img']),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: AppLayout.getHeight(3),
                                  offset: Offset(
                                    AppLayout.getHeight(5),
                                    AppLayout.getWidth(5),
                                  ),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(.1),
                                ),
                                BoxShadow(
                                  blurRadius: AppLayout.getHeight(3),
                                  offset: Offset(
                                    AppLayout.getHeight(-5),
                                    AppLayout.getWidth(-5),
                                  ),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(.1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[b]['title'],
                                  style: TextStyle(
                                    fontSize: AppLayout.getHeight(20),
                                    color: color.AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
