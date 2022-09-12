import '../model/event_model.dart';
import '../widgets/item_block.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventItems extends StatelessWidget {
  final List<EventModel> eventsorplays;
  const EventItems({Key? key, required this.eventsorplays}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 230,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: eventsorplays.length,
          itemBuilder: (_, i) {
            return ItemBlock(
              model: eventsorplays[i],
              onTap: (model) {},
            )
                /* Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: GestureDetector(
                onTap: () {
                  print(eventsorplays[i].title);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        eventsorplays[i].bannerUrl,
                        height: 150,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        eventsorplays[i].title.length > 10
                            ? eventsorplays[i].title.substring(0, 13) + '..'
                            : eventsorplays[i].title,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.8))),
                    Text(eventsorplays[i].description,
                        style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
            ) */
                ;
          }),
    );
  }
}
