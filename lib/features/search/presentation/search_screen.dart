import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/core/colors.dart';
import 'package:movie/core/enum.dart';
import 'package:movie/features/search/controller/search_controller.dart';
import 'package:movie/features/search/presentation/preview_widget.dart';


class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  FocusNode focusNode = FocusNode();

  String _quantityString(int q) {
    q--; //remove last element (SizedBox)
    if (q == 1) {
      return 'Найден 1 результат';
    } else if (q >= 2 && q <= 4) {
      return 'Найдено $q результата';
    } else {
      return 'Найдено $q результатов';
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchScreenProvider);
    final searchNotifier = ref.read(searchScreenProvider.notifier);
    List<Widget> previews = [];

    for (var movie in searchState.movies) {
      previews.add(PreviewWidget(movie));
    }
    previews.add(const SizedBox(height: 70));

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Platform.isAndroid ? 25 : 50),
                  TextFormField(
                    focusNode: focusNode,
                    onChanged: (_) {
                      searchNotifier.search();
                    }, 
                    controller: searchNotifier.searchController,
                    decoration: InputDecoration( 
                      suffixIcon: GestureDetector(
                        onTap: () {
                          searchNotifier.clearResults();
                          focusNode.unfocus();
                        },
                        child: Icon(Icons.close, color: AppColors.gray3A7),
                      ),
                      suffixIconConstraints: const BoxConstraints(minWidth: 40, maxWidth: 40),
                      prefixIconConstraints: const BoxConstraints(minWidth: 40),
                      prefixIcon: Icon(Icons.search, color: AppColors.gray3A7),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      fillColor: AppColors.gray2F4,
                      filled: true,
                      hintText: 'Название фильма',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(color: AppColors.gray2F4, height: 0, thickness: 1),
                  ),
                  Text(
                    switch (searchState.searchState) {
                      SearchState.initial => 'Вы ещё ничего не искали',
                      SearchState.nothingFinded => 'По заданым параметрам ничего не найдено.',
                      SearchState.searchComplited => previews.isEmpty
                      ? 'По заданым параметрам ничего не найдено.'
                      : _quantityString(previews.length),
                      SearchState.tooShort => 'Введите не менее 3 символов для поиска',
                      SearchState.isSearching => 'Идет поиск...',
                      SearchState.error => 'Ошибка, попробуйте позже'
                    }, 
                  ),
                  const SizedBox(height: 12),
                  if (searchState.searchState == SearchState.isSearching) ...[
                    Center(child: CircularProgressIndicator(
                      color: AppColors.blueD75,
                      backgroundColor: AppColors.redA47,
                      strokeWidth: 3,
                    )),
                    const SizedBox(height: 12)
                  ],
                  if (previews.isNotEmpty) Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: previews,
                    ),
                  ),
                ]
              ),
          ),
      ),
    );
  } 


}