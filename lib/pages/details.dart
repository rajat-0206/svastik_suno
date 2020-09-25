import 'package:flutter/material.dart';
import 'package:svastik_suno/core/const.dart';
import 'package:svastik_suno/widget/customProgress.dart';
import 'package:svastik_suno/widget/custombutton.dart';

class DetailsPage extends StatefulWidget {
  final String songname;
  final String artist;
  bool played;
  DetailsPage(
      {@required this.songname, @required this.artist, @required this.played});
  @override
  _DetailsPageState createState() =>
      _DetailsPageState(songname: songname, artist: artist, played: played);
}

class _DetailsPageState extends State<DetailsPage> {
  String songname = "No song Selected";
  String artist = " No artist";
  bool played = false;
  _DetailsPageState(
      {@required this.songname, @required this.artist, this.played});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        children: [
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.styleColor,
                  ),
                  size: 50,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  borderWidth: 5,
                ),
                Text(
                  "Now Playing",
                  style: TextStyle(
                    color: AppColors.styleColor,
                    fontSize: 24,
                  ),
                ),
                CustomButton(
                  child: Icon(
                    Icons.menu,
                    color: AppColors.styleColor,
                  ),
                  size: 50,
                  onTap: () {},
                  borderWidth: 2,
                )
              ],
            ),
          ),
          CustomButton(
            image: "assets/logo.jpg",
            size: MediaQuery.of(context).size.width * 0.7,
            borderWidth: 5,
            onTap: () {},
          ),
          Text(songname,
              style: TextStyle(
                color: AppColors.styleColor,
                fontSize: 24,
                height: 3,
              )),
          Text(artist,
              style: TextStyle(
                color: AppColors.styleColor.withAlpha(90),
                fontSize: 16,
              )),
          Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomProgress(),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 46),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  child: Icon(Icons.fast_rewind),
                  size: 70,
                  onTap: () {},
                ),
                CustomButton(
                  child: Icon(played ? Icons.pause : Icons.play_arrow),
                  size: 90,
                  isActive: played,
                  onTap: () {
                    setState(() {
                      if (played == true) {
                        played = false;
                      } else {
                        played = true;
                      }
                    });
                  },
                ),
                CustomButton(
                  child: Icon(Icons.fast_forward),
                  size: 70,
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
