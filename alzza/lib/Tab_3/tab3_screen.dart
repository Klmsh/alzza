
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/Widgets.dart';
import 'component/tab3_map_item.dart';

class Tab3_Screen extends StatefulWidget {
  const Tab3_Screen({Key? key}) : super(key: key);

  @override
  State<Tab3_Screen> createState() => _Tab3_ScreenState();
}

class _Tab3_ScreenState extends State<Tab3_Screen> {

  List<Marker> _markers = [];
  bool isReady = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _markers.add(Marker(
        markerId: MarkerId("1"),
        draggable: true,
        onTap: () => print("아!"),
        position: LatLng(35.1689766, 129.1360411)));

    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildGoogleMap(context),
        SafeArea(child:
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 3,left: 3),
            height: 50,
            width: 50,
            child: IconButton(
              icon: const Icon(Icons.menu, color:Colors.black,),
              iconSize: 24,
              onPressed: () {
                _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
              },
            ),
          ),
        ),),

        isReady ? Align(
          alignment: Alignment.bottomCenter,
          child: _buildContainer(),
        ) : SizedBox.shrink()

      ],
    );
  }

  void _showDialog(context, title, subtitle) {

    showDioalogCustom(context, title, subtitle);

  }

  Widget _buildContainer() {
    return GestureDetector(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.only(bottom: 32.0, left: 16, right: 16),
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Tab3_Map_Item(
            id: MediaQuery.of(context).size.width,
            Company: "",
            Title:"",
            Payment: "",
            Area: "",
            date:"",
            isAlbar: true,
          ),
        ),
      ),
      onTap: (){
        _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
      },
    );
  }

  Widget _buildGoogleMap(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        markers: Set.from(_markers),
        //내 현재 위치 사용 여부
        myLocationEnabled: true,
        //내 현재 위치로 가는 버튼 사용 여부
        myLocationButtonEnabled: false,
        // + - 버튼으로 줌 아웃 사용 여부
        zoomControlsEnabled: false,
        //화면 나침반 사용여부
        compassEnabled: false,
        mapToolbarEnabled: false,
        mapType: MapType.normal,

        minMaxZoomPreference: const MinMaxZoomPreference(7,18),
        initialCameraPosition:  const CameraPosition(target: LatLng(35.1680766, 129.1360411), zoom: 16),
        onMapCreated: (GoogleMapController controller) {
          setBottom();
        },
      ),
    );
  }

  Future<void> setBottom() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState((){
      isReady = true;
    });
  }

}

