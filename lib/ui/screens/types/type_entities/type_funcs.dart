import 'package:pokego/configs/types.dart';
import 'package:pokego/ui/screens/types/type_entities/type_constants.dart';

List<String> normalTypeReturner(List<String> combined) {
  var normalSet = typeNames.toSet(); 
  for (var i = 0; i < combined.length; i++) {
    if (normalSet.contains(combined[i].toLowerCase())) {
      normalSet.remove(combined[i].toLowerCase());
    }
  } 
  return normalSet.toList();
}

List<String> effectreturner(int i, dynamic n) {
  if (n == 0) {
    return types[i].nilEffective;
  } else if (n == 1) {
    return normalTypeReturner(
        types[i].nilEffective + types[i].superEffective + types[i].notEffective);
  } else if (n == 0.5) {
    return types[i].notEffective;
  } else {
    return types[i].superEffective;
  }
}
