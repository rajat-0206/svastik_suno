import 'package:flutter/material.dart';
import 'package:svastik_suno/core/const.dart';
import 'package:svastik_suno/model/music_modal.dart';
import 'package:svastik_suno/pages/details.dart';
import 'package:svastik_suno/widget/custombutton.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<MusicModel> _list;
  int _playId;

  @override
  void initState() {
    _playId = 0;
    _list = MusicModel.list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          elevation: 0,
          title: Text(
            "SKIN - FLUME",
            style: TextStyle(
              color: AppColors.styleColor,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.styleColor,
                        ),
                        size: 50,
                        onTap: () {},
                      ),
                      CustomButton(
                        image: "assets/logo.jpg",
                        size: 150,
                        borderWidth: 5,
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => DetailsPage()));
                        },
                      ),
                      CustomButton(
                        child: Icon(
                          Icons.menu,
                          color: AppColors.styleColor,
                        ),
                        size: 50,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: _list.length,
                      padding: EdgeInsets.all(12),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => DetailsPage()));
                          },
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              decoration: BoxDecoration(
                                  color: _list[index].id == _playId
                                      ? AppColors.activeColor
                                      : AppColors.mainColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  )),
                              padding: EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(_list[index].title,
                                          style: TextStyle(
                                            color: AppColors.styleColor,
                                            fontSize: 16,
                                          )),
                                      Text(_list[index].album,
                                          style: TextStyle(
                                            color: AppColors.styleColor
                                                .withAlpha(90),
                                            fontSize: 16,
                                          )),
                                    ],
                                  ),
                                  CustomButton(
                                      child: Icon(
                                          _list[index].id == _playId
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: _list[index].id == _playId
                                              ? Colors.white
                                              : AppColors.styleColor),
                                      size: 50,
                                      isActive: _list[index].id == _playId,
                                      onTap: () {
                                        setState(() {
                                          if (_playId == _list[index].id) {
                                            _playId = 0;
                                          } else {
                                            _playId = _list[index].id;
                                          }
                                        });
                                      }),
                                ],
                              )),
                        );
                      }),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.mainColor,
                      AppColors.mainColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
