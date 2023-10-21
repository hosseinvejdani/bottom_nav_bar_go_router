import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



/// Repository for managing cubits in an application.
///
/// Cubits can be stored and retrieved by [Type] and an optional tag.
/// This allows cubits to be shared across different parts of the app.
class CubitRepo {
  final _cubits = <_CubitKey, Cubit>{};

  /// Puts a [cubit] into the repository under the given optional [tag].
  void putCubit<T extends Cubit>(T cubit, [String? tag]) {
    final key = _CubitKey(T, tag: tag);
    if (_cubits.containsKey(key)) _cubits[key] = cubit;
  }

  /// Finds a cubit of type [T] and with matching [tag] if provided.
  ///
  /// throe Exception if no cubit matches.
  T findCubit<T extends Cubit>({String? tag}) {
    try {
      final key = _CubitKey(T, tag: tag);
      return _cubits[key] as T;
    } on Exception catch (_) {
      throw Exception("No cubit matches with provide type and tag!");
    }
  }

  /// Deletes a cubit of type [T] and with matching [tag] if provided.
  ///
  /// No-op if cubit does not exist in repository.
  void deleteCubit<T extends Cubit>({String? tag}) {
    final key = _CubitKey(T, tag: tag);
    if (_cubits.containsKey(key)) _cubits.remove(key);
  }
}

/// Internal key type for storing cubits in map.
class _CubitKey extends Equatable {
  final Type type;
  final String? tag;

  const _CubitKey(this.type, {this.tag});

  @override
  List<Object?> get props => [type, tag];
}
