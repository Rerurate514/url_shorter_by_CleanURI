import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_shorter_by_cleanuri/presentation/components/common/search_field.dart';
import 'package:url_shorter_by_cleanuri/presentation/notifier/short_url_notifier.dart';

class UrlConverter extends ConsumerStatefulWidget {
  const UrlConverter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UrlConverterState();
}

class _UrlConverterState extends ConsumerState<UrlConverter> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(shortUrlResultNotifierProvider);
    return Column(
      children: [
        SearchField(
          onSearch: (query) {
            ref.read(shortUrlResultNotifierProvider.notifier).createShortUrl(query);
          }
        ),
        state.when(
          data: (url) {
            return Text(
              url
            );
          }, 
          error: (error, _) {
            return Center(
              child: Text(
                error.toString(),
              ),
            );
          }, 
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        )
      ],
    );
  }
}
