import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style/styles.dart';

class Tab4_Screen extends StatefulWidget {
  const Tab4_Screen({Key? key}) : super(key: key);

  @override
  State<Tab4_Screen> createState() => _Tab4_ScreenState();
}

class listIndex{
  listIndex({
    required this.title,
    required this.price,
    required this.image
  });

  final String title;
  final String price;
  final String image;

}

class _Tab4_ScreenState extends State<Tab4_Screen> {

  bool isReady = false;

  List<listIndex> listIndexItem = [];

  Future<void> setData() async {


    String jsonString = await rootBundle.loadString('lib/assets/items_1/item.json');
    var resultData = jsonDecode(jsonString);
    listIndexItem.clear();
    for(int i = 0; i < resultData.length; i++){
      var _lst = resultData[i];
      listIndexItem.add(listIndex(title: _lst["title"], price: _lst["price"], image: _lst["image"]));
    }

    setState((){
      isReady = true;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.menu, color:Colors.black,),
          iconSize: 24,
          onPressed: () => null,
        ),

        title: const Text("스토어",style: TextStyle(
          color: Colors.black,
          fontFamily: "Noto",
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),),

        actions: [
          Container(
            margin: const EdgeInsets.only(right: 2),
            child: IconButton(
              icon: const Icon(Icons.info_outline, color:Colors.black,),
              iconSize: 24,
              onPressed: () => null,
            ),
          )
        ],
      ),
      body: isReady ? SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 44,
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 10),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),

                  labelText: '검색',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  filled: true,
                  fillColor: greyColor,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 16,right: 16),
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.only( right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greyColor,
                    ),
                    height: 44,
                    padding: const EdgeInsets.only(right: 16,left: 16),
                    child: const Center(
                      child: Padding(padding: EdgeInsets.only(bottom: 2),
                        child: Text("할인중", style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Noto",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greyColor,
                    ),
                    height: 44,
                    padding: const EdgeInsets.only(right: 16,left: 16),
                    child: const Center(
                      child: Padding(padding: EdgeInsets.only(bottom: 2),
                        child: Text("신상품", style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Noto",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greyColor,
                    ),
                    height: 44,
                    padding: const EdgeInsets.only(right: 16,left: 16),
                    child: const Center(
                      child: Padding(padding: EdgeInsets.only(bottom: 2),
                        child: Text("공식 브랜드", style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Noto",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greyColor,
                    ),
                    height: 44,
                    padding: const EdgeInsets.only(right: 16,left: 16),
                    child: const Center(
                      child: Padding(padding: EdgeInsets.only(bottom: 2),
                        child: Text("상품권", style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Noto",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greyColor,
                    ),
                    height: 44,
                    padding: const EdgeInsets.only(right: 16,left: 16),
                    child: const Center(
                      child: Padding(padding: EdgeInsets.only(bottom: 2),
                        child: Text("이벤트&쿠폰", style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Noto",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),),
                      ),
                    ),

                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greyColor,
                    ),
                    height: 44,
                    padding: const EdgeInsets.only(right: 16,left: 16),
                    child: const Center(
                      child: Padding(padding: EdgeInsets.only(bottom: 2),
                        child: Text("베스트", style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Noto",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),),
                      ),
                    ),

                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 16,right: 16,top: 32,bottom: 0),
              child: const Text("2022년 추석 선물 오픈!", style: TextStyle(
                color: Colors.black,
                fontFamily: "Noto",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16,right: 16,top: 0,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("이번 명절은 알짜에서 한번에 해결봐요!", style: TextStyle(
                    color: Colors.black87,
                    fontFamily: "Noto",
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  )),

                  Text("전체보기 >", style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "Noto",
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  )),
                ],
              ),
            ),

            AspectRatio(aspectRatio: 2.5/1,
              child: Container(
                  margin: const EdgeInsets.only(top: 8,left: 16,right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Image(image: AssetImage("lib/assets/images/benu_2.png"),fit: BoxFit.cover,),
                  )

              ),
            ),

            Container(
              height: 254,
              margin: const EdgeInsets.only(left: 16,right: 16,top: 20),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    getItems(listIndexItem[0].title, listIndexItem[0].price, listIndexItem[0].image),
                    getItems(listIndexItem[1].title, listIndexItem[1].price, listIndexItem[1].image),
                    getItems(listIndexItem[2].title, listIndexItem[2].price, listIndexItem[2].image),
                    getItems(listIndexItem[3].title, listIndexItem[3].price, listIndexItem[3].image),
                    getItems(listIndexItem[4].title, listIndexItem[4].price, listIndexItem[4].image)

                  ]
              )
            ),

            Container(
              margin: const EdgeInsets.only(left: 16,right: 16,top: 32,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("상품권",style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Noto",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),

                  Text("전체보기 >", style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "Noto",
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  )),
                ],
              ),
            ),

            Container(
                height: 235,
                margin: const EdgeInsets.only(left: 16,right: 16,top: 0),
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [

                      getItems(listIndexItem[5].title, listIndexItem[5].price, listIndexItem[5].image),
                      getItems(listIndexItem[6].title, listIndexItem[6].price, listIndexItem[6].image),
                      getItems(listIndexItem[7].title, listIndexItem[7].price, listIndexItem[7].image),
                      getItems(listIndexItem[8].title, listIndexItem[8].price, listIndexItem[8].image),
                      getItems(listIndexItem[9].title, listIndexItem[9].price, listIndexItem[9].image)

                    ]
                )
            ),

            Container(
              margin: const EdgeInsets.only(left: 16,right: 16,top: 32,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("명품관",style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Noto",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),

                  Text("전체보기 >", style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "Noto",
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  )),
                ],
              ),
            ),

            Container(
                height: 254,
                margin: const EdgeInsets.only(left: 16,right: 16,top: 0, bottom: 20),
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [

                      getItems(listIndexItem[10].title, listIndexItem[10].price, listIndexItem[10].image),
                      getItems(listIndexItem[11].title, listIndexItem[11].price, listIndexItem[11].image),
                      getItems(listIndexItem[12].title, listIndexItem[12].price, listIndexItem[12].image),
                      getItems(listIndexItem[13].title, listIndexItem[13].price, listIndexItem[13].image),
                      getItems(listIndexItem[14].title, listIndexItem[14].price, listIndexItem[14].image)

                    ]
                )
            ),

            AspectRatio(aspectRatio: 3/1,
              child: Container(
                  margin: const EdgeInsets.only(top: 0,left: 16,right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Image(image: AssetImage("lib/assets/images/benu_3.png"),fit: BoxFit.cover,),
                  )

              ),
            ),

            const SizedBox(height: 16,),

            AspectRatio(aspectRatio: 3/1,
              child: Container(
                  margin: const EdgeInsets.only(top: 0,left: 16,right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Image(image: AssetImage("lib/assets/images/benu_4.png"),fit: BoxFit.cover,),
                  )

              ),
            ),

            const SizedBox(height: 16,),

            AspectRatio(aspectRatio: 3/1,
              child: Container(
                  margin: const EdgeInsets.only(top: 0,left: 16,right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Image(image: AssetImage("lib/assets/images/benu_6.png"),fit: BoxFit.cover,),
                  )

              ),
            ),

          ],
        ),
      ) : Container(
        width: double.infinity,
        height: double.infinity,
        child: const Center(
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
        ),
      ),
    );
  }

  Widget getItems(String title, String price, String image){
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(aspectRatio: 1/1,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(image: AssetImage(image),fit: BoxFit.cover,),
                )
            ),
          ),
          Container(height: 1,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 8,bottom: 8),
            color: greyColor,),
          Text(title,maxLines: 3,
              overflow: TextOverflow.ellipsis, style: const TextStyle(
                color: Colors.black,
                fontFamily: "Noto",
                fontWeight: FontWeight.normal,
                fontSize: 13,
              )),
          const SizedBox(height: 8,),
          Row(
            children: [
              Text(price,style: const TextStyle(
                color: Colors.black,
                fontFamily: "Noto",
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
              const Text("원",style: TextStyle(
                color: Colors.black,
                fontFamily: "Noto",
                fontWeight: FontWeight.normal,
                fontSize: 14,
              )),
            ],
          )
        ],
      ),
    );
  }
}
