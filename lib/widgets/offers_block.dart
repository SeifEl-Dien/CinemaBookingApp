import '../model/offer_model.dart';
import '../utils/dummy_data.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OffersBlock extends StatelessWidget {
  const OffersBlock({Key? key}) : super(key: key);

  offerwidget(BuildContext context, OfferModel model) => Padding(
        padding: const EdgeInsets.only(left: 5, right: 20, bottom: 5),
        child: DottedBorder(
          color: Colors.black45,
          dashPattern: const [5, 5],
          padding: const EdgeInsets.all(20),
          radius: const Radius.circular(6),
          child: Row(
            children: [
              Container(
                height: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: RadialGradient(
                        colors: model.gradientColor, radius: 50)),
                child: SvgPicture.asset(
                  'assets/icons/${model.icon}',
                  height: 18,
                  width: 18,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: TextStyle(color: model.color),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      model.description,
                      style: const TextStyle(color: Colors.black45),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your offers',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: offers.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => offerwidget(context, offers[index]),
            ),
          )
        ],
      ),
    );
  }
}
