import 'package:flutter/material.dart';
import '../../Domains/models/person_details_model.dart';

class PersonHeader extends StatefulWidget {
  final PersonDetailsModel person;

  const PersonHeader({
    super.key,
    required this.person,
  });

  @override
  State<PersonHeader> createState() => _PersonHeaderState();
}

class _PersonHeaderState extends State<PersonHeader> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bio = (widget.person.biography != null && widget.person.biography!.isNotEmpty)
        ? widget.person.biography!
        : 'No biography available for this celebrity.';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          widget.person.name.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),


        if (widget.person.birthday != null && widget.person.birthday!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                const Text(
                  'Born: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.person.birthday!,
                  style: const TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),


        if (widget.person.placeOfBirth != null && widget.person.placeOfBirth!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                const Text(
                  'Nationality: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.person.placeOfBirth!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),


        Text.rich(
          TextSpan(
            text: isExpanded || bio.length <= 150
                ? bio
                : '${bio.substring(0, 150)}... ',
            style: const TextStyle(
              color: Color(0xFF4B5563),
              fontSize: 13.5,
              height: 1.45,
            ),
            children: [
              if (bio.length > 150)
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      isExpanded ? ' show less' : 'read more',
                      style: const TextStyle(
                        color: Color(0xFF4F46E5),
                        fontWeight: FontWeight.bold,
                        fontSize: 13.5,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}