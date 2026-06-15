import 'package:hw/data/dtos/comment_dto.dart';
import 'package:hw/data/repositories/comment_repository.dart';

extension CommentRepositorySync on CommentRepository {
  Future<void> syncBackground() async {
    // implement syncing
  }

  Future<List<CommentDto>> getComments(int recipeId) async {
    if (isOffline) {
      final list = await ls.getComments(recipeId);
      return list;
    }

    final saveList = await ds.getComments(recipeId);

    await ls.initComments(saveList);
    return saveList;
  }
}
