import 'package:tiktok_clone/features/home/domain/models/following_model.dart';

abstract class FollowingRepository {
  Future<List<FollowingModel>> fetchAllFollowing();
}
