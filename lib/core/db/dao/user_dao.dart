import 'package:floor/floor.dart';
import 'package:mobile/core/models/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @Query('SELECT * FROM User WHERE id = :id')
  Future<User> findUserById(int id);

  @insert
  Future<void> insertUser(User user);

  @insert
  Future<List<int>> insertUsers(List<User> users);

  @delete
  Future<int> deleteUsers(List<User> users);

  @Query('DELETE FROM User')
  Future<void> deleteAllUsers();
}
