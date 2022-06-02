import 'package:flutter/material.dart';

class LimitedEditionItemList extends StatelessWidget {
  const LimitedEditionItemList({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final  _valueList = ['품절임박순', '인기순', '할인마감순'];
    var _selectedValue = '품절임박순';

    final deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [DropdownButtonHideUnderline(
          child: DropdownButton(
            value: _selectedValue,
            onChanged: (value){
              //원래 setstate
                _selectedValue = value.toString();

            },
            items: _valueList.map((itemone){
              return DropdownMenuItem(
                  value: itemone,
                  child: Text(itemone)
              );
            }).toList(),
          ),
        ),

          SizedBox(height: deviceHeight*0.75,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 11, //item 개수
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3/5,
                crossAxisSpacing: 30,
              ),
              itemBuilder: (BuildContext context, int index) {
                return const SpecialEditionListItems();
              },
            ),
          ),
        ],
      ),
    );
  }
}


class SpecialEditionListItems extends StatelessWidget {
  const SpecialEditionListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(height: deviceWidth*0.4,
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/sample.png',
                ),
              ),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(mainAxisAlignment:MainAxisAlignment.end,
                  children: [
                    IconButton( icon: const Icon(Icons.favorite_border_outlined,), color: Colors.grey,iconSize: 25,tooltip: '위시리스트추가',
                      onPressed: () => {},)
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text('재고수량'),
                  Text('4/50'),
                ],
              ),
              const Text('린커'),
              const Text('[VARIVAS] AVANI JIGGING MAS POWER'),
              Row(
                children: const [
                  Text('20% 80,000 '),
                  Text('100,000', style: TextStyle(decoration: TextDecoration.lineThrough))
                ],
              ),


              Row(
                children: const [
                  Icon(Icons.star_outlined,size: 15,),
                  Text('(120))')
                ],
              ),

              Row(
                children: [
                  Container(padding: const EdgeInsets.all(3),
                    decoration:const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: const Text('품절임박',style: TextStyle(color: Colors.white,fontSize: 12),),
                  ),

                  const SizedBox(width: 5,),
                  Container(padding: const EdgeInsets.all(3),
                    decoration:const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: const Text('무료배송',style: TextStyle(color: Colors.black,fontSize: 12),),
                  ),
                ],
              ),



            ],
          )
        ],
      ),
    );
  }
}



































