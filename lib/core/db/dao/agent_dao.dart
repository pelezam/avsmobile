import 'package:floor/floor.dart';
import 'package:mobile/core/models/agent.dart';

@dao
abstract class AgentDao {
  @Query('SELECT * FROM Agent')
  Future<List<Agent>> findAllAgents();

  @insert
  Future<void> insertAgent(Agent agent);

  @insert
  Future<List<int>> insertAgents(List<Agent> agents);

  @delete
  Future<int> deleteAgents(List<Agent> agents);

  @Query('DELETE FROM Agent')
  Future<void> deleteAllAgents();
}
