import 'package:dio/dio.dart';
import '../../../local/local_shared_preferences.dart';
import '../../base_repository.dart';

class StoreHomeRepository extends BaseRepository{
  StoreHomeRepository(Dio dio, LocalSharedPreferences localSP) : super(dio, localSP);


}