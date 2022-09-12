import '../utils/mytheme.dart';

import 'package:flutter/material.dart';

class ItemBlock extends StatelessWidget {
  final dynamic model;
  final bool isMovie;
  final double height;
  final double width;
  final Function(dynamic model) onTap;
  const ItemBlock(
      {Key? key,
      required this.model,
      this.isMovie = false,
      this.height = 150,
      this.width = 120,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
      child: GestureDetector(
        onTap: () {
          onTap(model);
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  model.posterUrl,
                  height: height,
                  width: width,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: width,
                child: Text(
                    /*  model.title.length > 13
                        ? model.title.substring(0, 13) + '..'
                        : */
                    model.title,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.8))),
              ),
              isMovie
                  ? Row(children: [
                      const Icon(
                        Icons.favorite,
                        color: MyTheme.splash,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${model.like}%',
                        style: const TextStyle(fontSize: 10),
                      )
                    ])
                  : SizedBox(
                      width: width,
                      child: Text(
                        model.description,
                        style: const TextStyle(
                            fontSize: 10, color: Colors.black45),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
