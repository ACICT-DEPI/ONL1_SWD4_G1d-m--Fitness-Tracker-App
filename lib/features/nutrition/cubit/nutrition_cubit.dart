import 'dart:developer';
import 'package:final_project/features/nutrition/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/network.dart';
import 'nutrition_states.dart';

class NutritionCubit extends Cubit<NutritionStates> {
  NutritionCubit() : super(InitialState());

  static NutritionCubit get(context) => BlocProvider.of(context);


  List<CategoryModel> categories = [];

  void getCategories() async {
    emit(GetCategoriesLoadingState());
    try {
      var result = await NetworkHelper.instance.get(
        endPoint: EndPoints.categories,
        // host: EndPoints.dietHost,
        // apiKey: ketoApiKey
        //"554a02e03dmshd886ff48681c04dp19af10jsna2f57238ab4d"
        //"44f3f861ccmshc044140944ff801p1e7238jsna57f89e73123",
      );
      debugPrint(result.data.toString());
      final Map<String, dynamic> jsonResponse = result.data;
      if (jsonResponse['categories'] is List) {
        for (var item in jsonResponse['categories']) {
          categories.add(CategoryModel.fromJson(item));
        }
      }
      //List<dynamic> responseData = result.data;
      //categories = responseData.map((item) => CategoryModel.fromJson(item)).toList();
      //categories.add(CategoryModel.fromJson(result.data));
      emit(GetCategoriesSuccessState());
    } catch (e) {
      emit(GetCategoriesErrorState());
      log(e.toString(), name: "Meals Categories Info Lose Weight Cubit");
    }
  }

  List<Recipe> recipes = [];

  void getAllCategories(int id) async {
    recipes = [];
    emit(GetAllCategoriesLoadingState());
    Future.delayed(Duration(seconds: 2)).then((value) async {
      try {
        var result = await NetworkHelper.instance.get(
          endPoint: "${EndPoints.allCategories}$id",
          // params: {
          //   'categories': id,
          // },

          //host: EndPoints.dietHost,
          //apiKey:    ketoApiKey,
          //"44f3f861ccmshc044140944ff801p1e7238jsna57f89e73123",
          //EndPoints.dietApiKey,
        );
        debugPrint(result.data.toString());
        List<dynamic> responseData = result.data;
        recipes = responseData.map((item) => Recipe.fromJson(item)).toList();
        // Map<String, dynamic> responseData = result.data;  // Use a Map instead of List
        // List<dynamic> recipeList = responseData['recipes'];  // Access the 'recipes' list
        // recipes = recipeList.map((item) => Recipe.fromJson(item)).toList();  // Map each item

        emit(GetAllCategoriesSuccessState());
      } catch (e) {
        emit(GetAllCategoriesErrorState());
        log(e.toString(), name: "Meals Categories Info Lose Weight Cubit");
      }
    });
  }
}
