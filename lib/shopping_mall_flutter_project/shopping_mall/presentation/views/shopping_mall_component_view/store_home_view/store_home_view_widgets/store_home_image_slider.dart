import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class StoreHomeImageSlider extends StatelessWidget {
  const StoreHomeImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final deviceWidth = MediaQuery.of(context).size.width;

    ///샘플 이미지 리스트
    List<String> images = ['assets/images/sample.png','assets/images/pika.png','assets/images/sample.png','assets/images/pika.png'];

    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,),
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: deviceWidth,
                  decoration: const BoxDecoration(
                      color: Colors.black
                  ),
                  child: Image.asset(i,fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom:10, right:10,
                  child: Container(
                    height: 25, width:55,
                    decoration:  BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Center(
                      child: Text('${images.indexOf(i)+1}/${images.length}',
                        style: const TextStyle(color: Colors.white,fontSize: 12),),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
