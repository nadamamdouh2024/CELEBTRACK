import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Domains/models/popular_persons_model.dart';
import '../cubitsFavorite/favorite_cubit.dart';
import '../cubitsFavorite/favorite_state.dart';

class PersonCard extends StatelessWidget {
  final PersonModel person;
  final VoidCallback onTap;

  const PersonCard({
    super.key,
    required this.person,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = person.profilePath != null && person.profilePath!.isNotEmpty
        ? 'https://image.tmdb.org/t/p/w500${person.profilePath}'
        : 'https://via.placeholder.com/300x450';
    final popularity = person.popularity.toStringAsFixed(1);
    final department = person.knownForDepartment.isNotEmpty
        ? person.knownForDepartment
        : 'Acting';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: const Color(0xFFE5E7EB),
                          child: const Icon(
                            Icons.person,
                            size: 45,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child:

                    BlocBuilder<FavoriteCubit, FavoriteState>(
                      builder: (context, state) {
                        final isFav = context.read<FavoriteCubit>().isFavorite(person.id);
                        return GestureDetector(
                          onTap: () {
                            context.read<FavoriteCubit>().toggleFavorite(person);
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.85),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav ? Colors.redAccent : Colors.black87,
                              size: 18,
                            ),
                          ),
                        );
                      },
                    )
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    person.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '$popularity Popularity',
                    style: const TextStyle(
                      color: Color(0xFF575353),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3.5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA9A9AF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      department,
                      style: const TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}