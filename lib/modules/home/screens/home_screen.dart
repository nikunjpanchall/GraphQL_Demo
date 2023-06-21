import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_demo/modules/home/bloc/company_info_bloc.dart';
import 'package:map_demo/modules/home/models/info_model.dart';
import 'package:map_demo/theme/custom_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Company> companyList = [];

  @override
  void initState() {
    BlocProvider.of<CompanyInfoBloc>(context).add(GetCompanyDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company Info"),
        centerTitle: true,
      ),
      body: BlocConsumer<CompanyInfoBloc, CompanyInfoState>(
        listener: (context, state) {
          if (state is GetCompanyInfoState && state.isLoaded) {
            companyList = state.companyList ?? [];
          }
        },
        builder: (context, state) {
          if (state is GetCompanyInfoState && state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetCompanyInfoState && state.isLoaded) {
            return ListView.builder(
              itemCount: companyList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Company Name : ${companyList[index].name}",
                          style: CustomTextStyle.bodyTextStyle,
                        ),
                        Text(
                          "Ceo :  ${companyList[index].ceo} ",
                          style: CustomTextStyle.bodyTextStyle,
                        ),
                        Text(
                          "Employee :  ${companyList[index].employees} ",
                          style: CustomTextStyle.bodyTextStyle,
                        ),
                        Text(
                          "Address :  ${companyList[index].headquarters.address} ${companyList[index].headquarters.city} ${companyList[index].headquarters.state}",
                          style: CustomTextStyle.bodyTextStyle,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text("Data Not Found"),
          );
        },
      ),
    );
  }
}
