import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  var isCountrySelected = false.obs;
  var selectedCountry = Rxn<Country>();

  void updatePage(int page) {
    currentPage.value = page;
  }

  void selectCountry(Country country) {
    selectedCountry.value = country;
    isCountrySelected.value = true;
  }

  final pageController = PageController();


  double get progress => (currentPage.value + 1) / 5;


  //country selection
  final searchController=TextEditingController();


  var countries = <Country>[].obs;
  var filteredCountries = <Country>[].obs;



  List<Country> getAllCountries() {
    return CountryService().getAll();
  }

  @override
  void onInit() {
    super.onInit();
    countries.value = getAllCountries();
    filteredCountries.value = countries;
    searchController.addListener(_filterCountries);
  }

  void _filterCountries() {
    final query = searchController.text.toLowerCase();
    filteredCountries.value = countries.where((country) {
      return country.name.toLowerCase().contains(query);
    }).toList();
  }



  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }














}
