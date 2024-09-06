import 'dart:typed_data';

class Restaurant{
  final int? seq;
  final String name;
  final String phone;
  final String locate;
  final double latitude;
  final double longitude;
  final String memo;
  final Uint8List img;

  Restaurant(
    {
      this.seq,
      required this.name,
      required this.phone,
      required this.locate,
      required this.latitude,
      required this.longitude,
      required this.memo,
      required this.img
    }
  ) ;

  Restaurant.fromMap(Map<String, dynamic>res)
  : seq = res['seq'],
  name = res['name'],
  phone = res['phone'],
  locate = res['locate'],
  latitude = res['latitude'],
  longitude = res['longitude'],
  memo = res['memo'],
  img = res['img'] is Uint8List ? res['img'] : Uint8List.fromList(res['img']);
}//img 필드는 Uint8List로 정의되어 있는데, fromMap에서 데이터베이스에서 가져온 img 필드는 List<int> 타입일 수 있습니다. 이를 Uint8List로 변환해야 합니다.