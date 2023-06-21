import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:map_demo/modules/home/models/info_model.dart';

class CompanyRepository {
  final GraphQLClient _client;

  CompanyRepository()
      : _client = GraphQLClient(
          link: HttpLink('https://spacex-production.up.railway.app/'),
          cache: GraphQLCache(),
        );

  Future<List<Company>> getCompanyInfo() async {
    String query = '''
      {
        company {
          ceo
          employees
          founded
          headquarters {
            address
            city
            state
          }
          name
        }
      }
    ''';
    final QueryOptions options = QueryOptions(
      document: gql(query),
    );

    final QueryResult result = await _client.query(options);
    final data = result.data!['company'];
    List<dynamic> jsonList = [data];
    final companyList = jsonList.map((e) => Company.fromJson(e)).toList();
    return companyList;
  }
}
