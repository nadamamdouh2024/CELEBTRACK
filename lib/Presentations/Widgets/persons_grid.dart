import '../Screens/person_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubitsPopular/popular_cubit.dart';
import '../cubitsPopular/popular_state.dart';
import 'person_card.dart';


class PersonsGrid extends StatelessWidget {
  final String searchQuery;

  const PersonsGrid({
    super.key,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularState>(
      builder: (context, state) {
        if (state is PopularLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF19122C),
            ),
          );
        } else if (state is PopularErrorState) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                state.errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        } else if (state is PopularSuccessState) {
          final persons = state.persons.where((person) {
            final name = person.name.toLowerCase();
            return name.contains(searchQuery.toLowerCase());
          }).toList();

          if (persons.isEmpty) {
            return const Center(
              child: Text(
                'No celebrities found',
                style: TextStyle(
                  color: Color(0xFF7A7E89),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 20,
            ),
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.64,
              crossAxisSpacing: 14,
              mainAxisSpacing: 16,
            ),
            itemCount: persons.length,
            itemBuilder: (context, index) {
              final person = persons[index];
              return PersonCard(
                person: person,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PersonDetailsScreen(
                        personId: person.id,
                      ),
                    ),
                  );
                },
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}