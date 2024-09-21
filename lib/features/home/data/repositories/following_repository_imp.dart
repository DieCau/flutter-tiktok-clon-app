import 'package:tiktok_clone/features/home/data/datasource/network/datasource_ntw.dart';
import 'package:tiktok_clone/features/home/domain/models/following_model.dart';
import 'package:tiktok_clone/features/home/domain/repositories/folliwing_repository.dart';

class FollowingReposirotyImpl extends FollowingRepository {
  final DatasourcesNtw datasourcesNtw;

  FollowingReposirotyImpl({required this.datasourcesNtw});
  @override
  Future<List<FollowingModel>> fetchAllFollowing() async {
    final response = await datasourcesNtw.fetchAllFollowing();

    return response;
  }
}
