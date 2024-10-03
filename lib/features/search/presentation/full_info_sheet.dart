import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie/core/colors.dart';
import 'package:movie/features/search/model/movie_model.dart';

class FullInfoBottomSheet extends ConsumerStatefulWidget {
  const FullInfoBottomSheet({super.key, required this.movie});

  final Movie movie;

  @override
  ConsumerState<FullInfoBottomSheet> createState() => _FullInfoBottomSheet();
}

class _FullInfoBottomSheet extends ConsumerState<FullInfoBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: Platform.isAndroid,
        child: Container(
        color: AppColors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (widget.movie.poster != null) CachedNetworkImage(
                imageUrl: widget.movie.poster!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: AppColors.blueD75,
                  backgroundColor: AppColors.redA47,
                  strokeWidth: 3,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Center(
                  child: Container(
                    height: 320,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15, top: 45),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: CloseButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all<Color>(
                                      AppColors.white.withOpacity(0.4)),
                                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.zero),
                                  minimumSize:
                                      WidgetStateProperty.all<Size>(const Size(32, 32)),
                                  shape: WidgetStateProperty.all<OutlinedBorder>(
                                      const CircleBorder()),
                                ),
                                color: AppColors.grayA52),
                          ),
                        ),
                        if (widget.movie.rating != null) Padding(
                            padding: const EdgeInsets.only(right: 15, bottom: 35),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Rating: ${widget.movie.rating!.toString()}',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (widget.movie.year != null) Padding(
                            padding: const EdgeInsets.only(left: 15, bottom: 35),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Год: ${widget.movie.year}',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    if (widget.movie.title != null) Text(
                      widget.movie.title!, 
                      style: TextStyle(fontSize: 20, color: AppColors.blueA29)
                    ),
                    const SizedBox(height: 8),
                    if (widget.movie.description != null) Text(
                      widget.movie.description!,
                      style: TextStyle(fontSize: 16, color: AppColors.blueA29)
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}
