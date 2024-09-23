import 'package:tiktok_clon_app/features/home/data/datasource/datasource_ntw.dart';
import 'package:tiktok_clon_app/features/home/domain/models/foryou_profile_model.dart';
import 'package:tiktok_clon_app/features/home/domain/models/interaction_model.dart';
import 'package:tiktok_clon_app/features/home/domain/models/my_videos_model.dart';
import 'package:tiktok_clon_app/features/home/domain/repositories/profile_repository.dart';


class ProfileRepositoryImpl extends ProfileRepository {
  final DatasourcesNtw datasourcesNtw;

  ProfileRepositoryImpl({required this.datasourcesNtw});
  @override
  Future<ForyouProfileModel> fetchByIdProfile({required int id}) async {
    return datasourcesNtw.getProfileIdData(idUser: id);
  }

  @override
  Future<InteractionModel> fetInteraction({required idUser}) async {
    final response = await datasourcesNtw.fetchInteraction(idUser: idUser);
    return response;
  }

  @override
  Future<List<MyVideosModel>> fetchListMyvideos({required idUser}) async {
    final response = await datasourcesNtw.fetchListMyvideos(id: idUser);
    return response;
  }

  @override
  Future<List<MyVideosModel>> fetchListSharedVideos({required idUser}) async {
    final response = await datasourcesNtw.fetchListSharedvideos(id: idUser);
    return response;
  }

  @override
  Future<List<MyVideosModel>> fetchListLikeVideos({required idUser}) async {
    final response = await datasourcesNtw.fetchListLikevideos(id: idUser);
    return response;
  }
}
