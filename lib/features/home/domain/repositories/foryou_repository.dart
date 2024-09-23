import 'package:tiktok_clon_app/features/home/domain/models/foryou_model.dart';
import 'package:tiktok_clon_app/features/home/domain/models/foryou_profile_model.dart';

abstract class ForyouRepository {
  Future<List<ForYouModel>> fetchAllForyou();
  Future<ForyouProfileModel> getProfileId({required int idUser});
}
