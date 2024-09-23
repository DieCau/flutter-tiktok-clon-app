import 'package:tiktok_clon_app/features/home/data/datasource/datasource_ntw.dart';
import 'package:tiktok_clon_app/features/home/domain/models/foryou_model.dart';
import 'package:tiktok_clon_app/features/home/domain/models/foryou_profile_model.dart';
import 'package:tiktok_clon_app/features/home/domain/repositories/foryou_repository.dart';

class ForyouRepositoryImpl extends ForyouRepository {
  final DatasourcesNtw foryouDatasourcesNtw;

  ForyouRepositoryImpl({required this.foryouDatasourcesNtw});

  @override
  Future<List<ForYouModel>> fetchAllForyou() {
    final response = foryouDatasourcesNtw.fethFouryouData();
    return response;
  }

  @override
  Future<ForyouProfileModel> getProfileId({required int idUser}) {
    final response = foryouDatasourcesNtw.getProfileIdData(idUser: idUser);
    return response;
  }
}
