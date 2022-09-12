import '../utils/dummy_data.dart';
import 'package:flutter/material.dart';

import '../utils/mytheme.dart';

class CrewCastBlock extends StatelessWidget {
  const CrewCastBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 245,
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Crew & Casts',
                style: TextStyle(fontSize: 14),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View all >',
                    style: TextStyle(color: MyTheme.splash),
                  ))
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: crewCast.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              crewCast[index].image,
                              height: 107,
                              width: 87,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(crewCast[index].name)
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
