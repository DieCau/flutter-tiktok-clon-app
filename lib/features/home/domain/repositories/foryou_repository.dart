import 'package:tiktok_clone/features/home/domain/models/foryou_profile_model.dart';
import 'package:tiktok_clone/features/home/domain/models/fouryou_model.dart';

abstract class ForyouRepository {
  Future<List<ForYouModel>> fetchAllForyou();
  Future<ForyouProfileModel> getProfileId({required int idUser});
}
