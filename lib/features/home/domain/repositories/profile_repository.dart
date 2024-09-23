import 'package:tiktok_clon_app/features/home/domain/models/foryou_profile_model.dart';
import 'package:tiktok_clon_app/features/home/domain/models/interaction_model.dart';
import 'package:tiktok_clon_app/features/home/domain/models/my_videos_model.dart';

abstract class ProfileRepository {
  Future<ForyouProfileModel> fetchByIdProfile({required int id});
  Future<InteractionModel> fetInteraction({required int idUser});
  Future<List<MyVideosModel>> fetchListMyvideos({required int idUser});
  Future<List<MyVideosModel>> fetchListSharedVideos({required int idUser});
  Future<List<MyVideosModel>> fetchListLikeVideos({required int idUser});
}
