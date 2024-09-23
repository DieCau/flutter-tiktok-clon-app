import 'package:tiktok_clon_app/features/home/domain/models/following_model.dart';

abstract class FollowingRepository {
  Future<List<FollowingModel>> fetchAllFollowing();
}
