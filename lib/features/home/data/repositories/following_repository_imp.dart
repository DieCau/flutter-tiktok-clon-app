import 'package:tiktok_clon_app/features/home/data/datasource/datasource_ntw.dart';
import 'package:tiktok_clon_app/features/home/domain/models/following_model.dart';
import 'package:tiktok_clon_app/features/home/domain/repositories/following_repository.dart';

class FollowingReposirotyImpl extends FollowingRepository {
  final DatasourcesNtw datasourcesNtw;

  FollowingReposirotyImpl({required this.datasourcesNtw});
  @override
  Future<List<FollowingModel>> fetchAllFollowing() async {
    final response = await datasourcesNtw.fetchAllFollowing();

    return response;
  }
}
