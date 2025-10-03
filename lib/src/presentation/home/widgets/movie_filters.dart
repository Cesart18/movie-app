part of '../base/home_page.dart';

class _MovieFilters extends StatelessWidget {
  const _MovieFilters();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
      builder: (context, state) {
        return Wrap(
          spacing: WidthValues.spacingMd,
          runSpacing: WidthValues.spacingSm,
          children: [
            _FilterChip(
              label: state.selectedLanguage != null
                  ? _getLanguageLabel(state.selectedLanguage!)
                  : 'Todos los idiomas',
              isSelected: state.selectedLanguage != null,
              onTap: () {
                if (state.selectedLanguage != null) {
                  // Si ya está seleccionado, limpiar el filtro
                  context.read<TrendingMoviesBloc>().add(
                    TrendingMoviesFiltered(year: state.selectedYear),
                  );
                } else {
                  // Si no está seleccionado, mostrar el modal
                  _showLanguageFilter(context, state.selectedLanguage);
                }
              },
            ),
            _FilterChip(
              label: state.selectedYear != null
                  ? 'Lanzadas en ${state.selectedYear}'
                  : 'Todos los años',
              isSelected: state.selectedYear != null,
              onTap: () {
                if (state.selectedYear != null) {
                  // Si ya está seleccionado, limpiar el filtro
                  context.read<TrendingMoviesBloc>().add(
                    TrendingMoviesFiltered(language: state.selectedLanguage),
                  );
                } else {
                  // Si no está seleccionado, mostrar el modal
                  _showYearFilter(context, state.selectedYear);
                }
              },
            ),
          ],
        );
      },
    );
  }

  String _getLanguageLabel(String code) {
    const languages = {
      'es': 'En español',
      'en': 'En inglés',
      'fr': 'En francés',
      'ja': 'En japonés',
      'ko': 'En coreano',
      'de': 'En alemán',
      'it': 'En italiano',
      'pt': 'En portugués',
    };
    return languages[code] ?? code.toUpperCase();
  }

  void _showLanguageFilter(BuildContext context, String? currentLanguage) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: ColorValues.bgPrimary(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) =>
          _LanguageFilterSheet(currentLanguage: currentLanguage),
    );
  }

  void _showYearFilter(BuildContext context, int? currentYear) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: ColorValues.bgPrimary(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _YearFilterSheet(currentYear: currentYear),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorValues.bgSecondary(context)
              : Colors.transparent,
          border: Border.all(color: ColorValues.borderPrimary(context)),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: ExtendedTextTheme.textSmall(context).copyWith(
                color: isSelected
                    ? ColorValues.textSecondary(context)
                    : ColorValues.textPrimary(context),
              ),
            ),
            if (isSelected) ...[
              SizedBox(width: WidthValues.spacingXs),
              Icon(
                Icons.close,
                size: 16,
                color: ColorValues.textSecondary(context),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _LanguageFilterSheet extends StatelessWidget {
  const _LanguageFilterSheet({this.currentLanguage});

  final String? currentLanguage;

  @override
  Widget build(BuildContext context) {
    const languages = {
      'es': 'Español',
      'en': 'Inglés',
      'fr': 'Francés',
      'ja': 'Japonés',
      'ko': 'Coreano',
      'de': 'Alemán',
      'it': 'Italiano',
      'pt': 'Portugués',
    };

    return Container(
      color: ColorValues.bgPrimary(context),
      padding: EdgeInsets.all(WidthValues.containerPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filtrar por idioma',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: WidthValues.spacingLg),
          if (currentLanguage != null)
            _LanguageOption(
              label: 'Todos los idiomas',
              isSelected: false,
              onTap: () {
                context.read<TrendingMoviesBloc>().add(
                  const TrendingMoviesFiltered(),
                );
                Navigator.pop(context);
              },
            ),
          ...languages.entries.map(
            (entry) => _LanguageOption(
              label: entry.value,
              isSelected: currentLanguage == entry.key,
              onTap: () {
                context.read<TrendingMoviesBloc>().add(
                  TrendingMoviesFiltered(language: entry.key),
                );
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: WidthValues.spacingLg),
        ],
      ),
    );
  }
}

class _YearFilterSheet extends StatelessWidget {
  const _YearFilterSheet({this.currentYear});

  final int? currentYear;

  @override
  Widget build(BuildContext context) {
    final currentYearValue = DateTime.now().year;
    final years = List.generate(10, (index) => currentYearValue - index);

    return Container(
      color: ColorValues.bgPrimary(context),
      padding: EdgeInsets.all(WidthValues.containerPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filtrar por año',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: WidthValues.spacingLg),
          if (currentYear != null)
            _YearOption(
              label: 'Todos los años',
              isSelected: false,
              onTap: () {
                context.read<TrendingMoviesBloc>().add(
                  TrendingMoviesFiltered(
                    language: context
                        .read<TrendingMoviesBloc>()
                        .state
                        .selectedLanguage,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ...years.map(
            (year) => _YearOption(
              label: year.toString(),
              isSelected: currentYear == year,
              onTap: () {
                context.read<TrendingMoviesBloc>().add(
                  TrendingMoviesFiltered(
                    language: context
                        .read<TrendingMoviesBloc>()
                        .state
                        .selectedLanguage,
                    year: year,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: WidthValues.spacingLg),
        ],
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: WidthValues.spacingMd),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: ExtendedTextTheme.textMedium(context).copyWith(
                  fontWeight: isSelected ? TextValues.bold : TextValues.regular,
                ),
              ),
            ),
            if (isSelected)
              Icon(Icons.check, color: ColorValues.textPrimary(context)),
          ],
        ),
      ),
    );
  }
}

class _YearOption extends StatelessWidget {
  const _YearOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: WidthValues.spacingMd),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: ExtendedTextTheme.textMedium(context).copyWith(
                  fontWeight: isSelected ? TextValues.bold : TextValues.regular,
                ),
              ),
            ),
            if (isSelected)
              Icon(Icons.check, color: ColorValues.textPrimary(context)),
          ],
        ),
      ),
    );
  }
}
