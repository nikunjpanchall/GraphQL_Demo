part of 'company_info_bloc.dart';

@immutable
abstract class CompanyInfoState {}

class GetCompanyInfoState extends CompanyInfoState {
  final bool isLoading;
  final bool isLoaded;
  final bool hasError;
  final List<Company>? companyList;

  GetCompanyInfoState({this.isLoading = false, this.isLoaded = false, this.hasError = false, this.companyList});
}
