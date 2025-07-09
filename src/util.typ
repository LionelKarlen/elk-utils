/// Format an array into a string list, or leave as string
///
/// -> string
#let format_list(
  /// The array or string to be formatted
  /// -> array | string
  a
) = {
if type(a)==array {
    a.join(", ", last: ", and ");
  } else {
    a;
  }
}
