import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/core/colors.dart';
import 'package:movie/features/search/model/movie_model.dart';
import 'package:movie/features/search/presentation/full_info_sheet.dart';

class PreviewWidget extends ConsumerWidget {
  const PreviewWidget(this.movie, {super.key});
  final Movie movie;

  @override
  Widget build(BuildContext context, ref) {

    return SizedBox(
      height: 72,
      width: 288,
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          isDismissible: false,
          isScrollControlled: true,
          context: context, 
          builder: (context) => FullInfoBottomSheet(movie: movie)
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              movie.poster == null
              ? Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blueF5A.withOpacity(0.06),
                        spreadRadius: 0,
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.blueF5A,
                  ),
                  child: const Icon(Icons.error),
                )
              : CachedNetworkImage(
                imageUrl: movie.poster!,
                progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: AppColors.blueD75,
                  backgroundColor: AppColors.redA47,
                  strokeWidth: 3,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blueF5A.withOpacity(0.06),
                        spreadRadius: 0,
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (movie.title != null) Text(movie.title!, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, color: AppColors.blueA29)),
                    if (movie.year != null) Text('Год: ${movie.year!.toString()}', style: TextStyle(fontSize: 12, color: AppColors.blueA29)),
                    if (movie.rating != null) Text('Рейтинг кинопоиска: ${movie.rating.toString()}', style: TextStyle(fontSize: 12, color: AppColors.blueA29)),
                  ]
                ),
              ),
            ]
          ),
        )
    );
  }
}
