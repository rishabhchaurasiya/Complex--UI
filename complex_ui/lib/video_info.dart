import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:complex_ui/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoinfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      videoinfo = json.decode(value);
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(.9),
                    color.AppColor.gradientSecond
                  ],
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ),
              )
            : BoxDecoration(
                color: color.AppColor.gradientSecond,
              ),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding: EdgeInsets.only(
                        top: AppLayout.getHeight(56),
                        left: AppLayout.getWidth(26),
                        right: AppLayout.getWidth(26)),
                    width: MediaQuery.of(context).size.width,
                    height: AppLayout.getHeight(250),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () => Get.back(),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: AppLayout.getHeight(18),
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: AppLayout.getHeight(18),
                              color: color.AppColor.secondPageIconColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(28),
                        ),
                        Text(
                          'Legs Toning',
                          style: TextStyle(
                              fontSize: AppLayout.getHeight(25),
                              color: color.AppColor.secondPageTitleColor),
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(5),
                        ),
                        Text(
                          'and Glutes Workout',
                          style: TextStyle(
                              fontSize: AppLayout.getHeight(25),
                              color: color.AppColor.secondPageTitleColor),
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(40),
                        ),
                        Row(
                          children: [
                            Container(
                              width: AppLayout.getWidth(82),
                              height: AppLayout.getHeight(28),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppLayout.getHeight(9)),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: AppLayout.getHeight(19),
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  SizedBox(
                                    width: AppLayout.getWidth(4),
                                  ),
                                  Text(
                                    "68 min",
                                    style: TextStyle(
                                        fontSize: AppLayout.getHeight(15),
                                        color:
                                            color.AppColor.secondPageIconColor),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: AppLayout.getWidth(19),
                            ),
                            Container(
                              width: AppLayout.getWidth(200),
                              height: AppLayout.getHeight(28),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppLayout.getHeight(9)),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: AppLayout.getHeight(19),
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  SizedBox(
                                    width: AppLayout.getWidth(4),
                                  ),
                                  Text(
                                    "Resistent band, kettebell",
                                    style: TextStyle(
                                        fontSize: AppLayout.getHeight(15),
                                        color:
                                            color.AppColor.secondPageIconColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          height: AppLayout.getHeight(92),
                          padding: EdgeInsets.only(
                            top: AppLayout.getHeight(47),
                            left: AppLayout.getWidth(28),
                            right: AppLayout.getWidth(28),
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: AppLayout.getHeight(18),
                                  color: color.AppColor.secondPageIconColor,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.info_outline,
                                size: AppLayout.getHeight(18),
                                color: color.AppColor.secondPageIconColor,
                              )
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlView(context),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppLayout.getHeight(60))),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppLayout.getHeight(28),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: AppLayout.getHeight(28),
                        ),
                        Text(
                          'Circuit 1: Legs Toning',
                          style: TextStyle(
                            fontSize: AppLayout.getHeight(19),
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.circuitsColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: AppLayout.getHeight(38),
                              color: color.AppColor.loopColor,
                            ),
                            SizedBox(
                              height: AppLayout.getWidth(8),
                            ),
                            Text(
                              '3 sets',
                              style: TextStyle(
                                  fontSize: AppLayout.getHeight(13),
                                  color: color.AppColor.setsColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: AppLayout.getWidth(18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(18),
                    ),
                    Expanded(
                      child: _lsitView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);
    final noMute = (_controller?.value?.volume ?? 0) > 0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red[700],
              inactiveTrackColor: Colors.red[100],
              trackShape: RoundedRectSliderTrackShape(),
              trackHeight: AppLayout.getHeight(2),
              thumbColor: Colors.redAccent,
              thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: AppLayout.getHeight(10)),
              overlayColor: Colors.red.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(
                  overlayRadius: AppLayout.getHeight(28)),
              tickMarkShape: RoundSliderTickMarkShape(),
              activeTickMarkColor: Colors.red[700],
              inactiveTickMarkColor: Colors.red[100],
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: Colors.redAccent,
              valueIndicatorTextStyle: TextStyle(color: Colors.white)),
          child: Slider(
            value: max(0, min(_progress * 100, 100)),
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split(".")[0],
            onChanged: (value) {
              setState(() {
                _progress = value * 0.01;
              });
            },
            onChangeStart: (value) {
              _controller?.pause();
            },
            onChangeEnd: (value) {
              final duration = _controller?.value?.duration;
              if (duration != null) {
                var newValue = max(0, min(value, 99)) * 0.01;
                var millis = (duration.inMicroseconds * newValue).toInt();
                _controller?.seekTo(Duration(microseconds: millis));
                _controller?.play();
              }
            },
          ),
        ),
        Container(
          height: AppLayout.getHeight(40),
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(bottom: AppLayout.getHeight(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getWidth(11),
                      vertical: AppLayout.getHeight(8)),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0.0, 0.0),
                            blurRadius: AppLayout.getHeight(4),
                            color: const Color.fromARGB(50, 0, 0, 0))
                      ],
                    ),
                    child: Icon(
                      noMute ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  if (noMute) {
                    _controller?.setVolume(0);
                  } else {
                    _controller?.setVolume(1.0);
                  }
                  setState(() {});
                },
              ),
              TextButton(
                onPressed: () async {
                  final index = _isPlayingIndex - 1;
                  if (index >= 0 && videoinfo.length >= 0) {
                    _initializeVideo(index);
                  } else {
                    Get.snackbar(
                      "Video List",
                      "",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(
                        Icons.face,
                        size: AppLayout.getHeight(30),
                        color: Colors.white,
                      ),
                      backgroundColor: color.AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: Text(
                        "No videos ahead",
                        style: TextStyle(
                            fontSize: AppLayout.getHeight(20),
                            color: Colors.white),
                      ),
                    );
                  }
                },
                child: Icon(
                  Icons.fast_rewind,
                  size: AppLayout.getHeight(34),
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _controller?.pause();
                  } else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _controller?.play();
                  }
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: AppLayout.getHeight(34),
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  final index = _isPlayingIndex + 1;
                  if (index <= videoinfo.length - 1) {
                    _initializeVideo(index);
                  } else {
                    Get.snackbar(
                      "Video List",
                      "",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(
                        Icons.face,
                        size: AppLayout.getHeight(30),
                        color: Colors.white,
                      ),
                      backgroundColor: color.AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: Text(
                        "You have finished watching all the videos. Congrats!",
                        style: TextStyle(
                            fontSize: AppLayout.getHeight(20),
                            color: Colors.white),
                      ),
                    );
                  }
                },
                child: Icon(
                  Icons.fast_forward,
                  size: AppLayout.getHeight(34),
                  color: Colors.white,
                ),
              ),
              Text(
                "$mins:$secs",
                style: TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: const Offset(0.0, 1.0),
                      blurRadius: AppLayout.getHeight(4),
                      color: const Color.fromARGB(150, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(
            'Preparing...',
            style: TextStyle(
                fontSize: AppLayout.getHeight(20), color: Colors.white60),
          ),
        ),
      );
    }
  }

  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;
  var _onUpdateControllerTime;

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().microsecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      debugPrint("controller is null");
      return;
    }

    if (!controller.value.isInitialized) {
      debugPrint("controller can not be initialized");
      return;
    }

    _duration ??= _controller?.value.duration;
    var duration = _duration;
    if (duration == null) {
      return;
    }

    var position = await controller.position;
    _position = position;

    final playing = controller.value.isPlaying;
    if (playing) {
      // handle progress indicator
      if (_disposed) return;
      setState(() {
        _progress = position!.inMicroseconds.ceilToDouble() /
            duration.inMicroseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  _initializeVideo(int index) async {
    final controller =
        VideoPlayerController.network(videoinfo[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  _onTapVideo(int index) {
    _initializeVideo(index);
  }

  _lsitView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(28), vertical: AppLayout.getHeight(8)),
      itemCount: videoinfo.length,
      itemBuilder: (_, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _onTapVideo(index);
              if (_playArea == false) {
                _playArea = true;
              }
            });
          },
          child: _buildCard(index),
        );
      },
    );
  }

  _buildCard(int index) {
    return Container(
      height: AppLayout.getHeight(125),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: AppLayout.getWidth(78),
                height: AppLayout.getHeight(78),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppLayout.getHeight(10),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(videoinfo[index]["thumbnail"]),
                  ),
                ),
              ),
              SizedBox(
                width: AppLayout.getWidth(10),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoinfo[index]['title'],
                    style: TextStyle(
                      fontSize: AppLayout.getHeight(17),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(10),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppLayout.getHeight(3)),
                    child: Text(
                      videoinfo[index]['time'],
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppLayout.getHeight(17),
          ),
          Row(
            children: [
              Container(
                width: AppLayout.getWidth(78),
                height: AppLayout.getHeight(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                ),
                child: const Center(
                  child: Text(
                    '15 rest',
                    style: TextStyle(
                      color: Color(0xFF839fed),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    i.isEven
                        ? Container(
                            width: AppLayout.getWidth(3),
                            height: AppLayout.getHeight(1),
                            decoration: BoxDecoration(
                              color: const Color(0xFF839fed),
                              borderRadius: BorderRadius.circular(
                                AppLayout.getHeight(2),
                              ),
                            ),
                          )
                        : Container(
                            width: AppLayout.getWidth(3),
                            height: AppLayout.getHeight(1),
                            color: Colors.white,
                          ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
