import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthRepository {
  final GraphQLClient _client;

  AuthRepository()
      : _client = GraphQLClient(
          link: HttpLink('https://api1.vepaar.dev/graphql/open'),
          cache: GraphQLCache(),
        );

  static String signup() {
    return r'''
     mutation signup($name:String,$email:String,$password:String){
      signup(input:{name: $name,email:$email,password:$password}){
       user{
          id
          name
          email
        }
        token
        }
      }
        ''';
  }

  Future<void> singUp(String name, String email, String password) async {
    try {
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {"name": name, "email": email, "password": password},
          document: gql(
            signup(),
          ),
        ),
      );
      if (result.hasException) {
        if (kDebugMode) {
          print(result.exception?.graphqlErrors[0].message);
        }
      } else if (result.data != null) {
        if (kDebugMode) {
          print("User Register");
        }
      }
    } catch (e) {
      throw Exception();
    }
  }

  static String loginData() {
    return r'''
     mutation login($email:String,$password:String){
      login(input:{,email:$email,password:$password}){
        user{
          id
          email
        }
        token
      }
    }
        ''';
  }

  Future<void> login(String email, String password) async {
    try {
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {"email": email, "password": password},
          document: gql(
            loginData(),
          ),
        ),
      );
      if (result.hasException) {
        if (kDebugMode) {
          print(result.exception?.graphqlErrors[0].message);
        }
      } else if (result.data != null) {
        if (kDebugMode) {
          print("Login Successfully");
        }
      }
    } catch (e) {
      throw Exception();
    }
  }
}
