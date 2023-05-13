import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class PoadsItemsBuilder extends StatefulWidget {
  const PoadsItemsBuilder(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.index,
      required this.audio})
      : super(key: key);

  @override
  State<PoadsItemsBuilder> createState() => _PoadsItemsBuilderState();

  final String title;
  final String subtitle;
  final String index;
  final String audio;
}
AssetsAudioPlayer audio = AssetsAudioPlayer.newPlayer();
bool isPlay=true;


class _PoadsItemsBuilderState extends State<PoadsItemsBuilder> {
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () async {
        setState(() {});

      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white12,
              boxShadow: [
                BoxShadow(
                    color: Colors.amberAccent.withOpacity(0.2),
                    offset: const Offset(0, 5),
                    spreadRadius: 1)
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: Slidable(
                startActionPane:
                    ActionPane(motion: const ScrollMotion(), children: [
                  SlidableAction(
                    onPressed: ((context) {
                      audio.open(
                        Audio(widget.audio),
                        showNotification: true,
                      );
                    }),
                    backgroundColor: Colors.black,
                    icon: Icons.play_arrow,
                  ),
                  SlidableAction(
                    onPressed: ((context) async {
                      // print(taher.removeLast());
                      audio.stop();
                      setState(() {

                      });
                    }),
                    backgroundColor: Colors.amber,
                    icon: Icons.stop,
                  ),
                  SlidableAction(
                    onPressed: ((context) async {
                      // print(taher.removeLast());

                      setState(() {
                      });
                    }),
                    backgroundColor: Colors.brown,
                    icon: Icons.download,
                  ),

                ]),
                child: ListTile(
                  title: Row(
                    children: [
                      Text(
                        maxLines: 1,
                        '${widget.index}- '
                        '${widget.title} ',
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9.0),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        textAlign: TextAlign.justify,
                        maxLines: widget.subtitle.length,
// ignore: unnecessary_string_interpolations
                        '${widget.subtitle} ',

                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 17,
                            color: Colors.black,
                            fontFamily: 'cairo'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
