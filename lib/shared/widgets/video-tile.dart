import 'package:flutter/material.dart';
import 'package:fluttertube/shared/models/video-model.dart';

class VideoTile extends StatelessWidget {
  final VideoModel _videoModel;

  VideoTile(this._videoModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.network(_videoModel.thumb, fit: BoxFit.cover),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Text(
                          _videoModel.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          _videoModel.channel,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.star_border),
                iconSize: 30,
                onPressed: () {},
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}