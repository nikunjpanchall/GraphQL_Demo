import 'package:bloc/bloc.dart';
import 'package:map_demo/modules/home/models/info_model.dart';
import 'package:map_demo/modules/home/repository/company_repo.dart';
import 'package:meta/meta.dart';

part 'company_info_event.dart';
part 'company_info_state.dart';

class CompanyInfoBloc extends Bloc<CompanyInfoEvent, CompanyInfoState> {
  CompanyRepository companyRepository = CompanyRepository();
  CompanyInfoBloc() : super(GetCompanyInfoState()) {
    on<GetCompanyDataEvent>((event, emit) async {
      try {
        emit(GetCompanyInfoState(isLoading: true));
        final response = await companyRepository.getCompanyInfo();
        emit(GetCompanyInfoState(isLoaded: true, companyList: response));
      } catch (e) {
        emit(GetCompanyInfoState(hasError: true));
      }
    });
  }
}
