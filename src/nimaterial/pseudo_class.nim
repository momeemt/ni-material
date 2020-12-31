import selector

type PseudoClass* = enum
  active
  any_link = "any-link"
  blank
  checked
  current
  default
  defined
  dir_ltr = "dir(ltr)"
  dir_rtl = "dir(rtl)"
  disabled
  drop
  empty
  enabled
  first
  first_child = "first-child"
  first_of_type = "first-of-type"
  fullscreen
  future
  focus
  focus_visible = "focus-visible"
  focus_within = "focus_within"
  has = "has()" # TODO: has() selectorの実装
  host
  host2 = "host()" # TODO: host() selectorの実装
  host_content = "host-content()" # TODO: host-content() selectorの実装
  hover
  indeterminate
  in_range = "in-range"
  invalid
  is2 = "is()" # TODO: is() selectorの実装
  lang = "lang()" # TODO: lang() selector の実装
  last_child = "last-child"
  last_of_type = "last-of-type"
  left
  link
  local_link = "local-link"
  not2 = "not()" # TODO: not() selector の実装
  nth_child = "nth-child()" # TODO: nth-child() selector の実装
  nth_col = "nth-col()" # TODO: nth-col() selector の実装
  nth_last_child = "nth-last-child()" # TODO: nth-last-child() selector の実装
  nth_last_of_type = "nth-last-of-type()" # TODO: nth-last-of_type() selector の実装
  nth_of_type = "nth-of-type()" # TODO: nth-of-type() selector の実装
  only_child = "only-child"
  only_of_type = "only-of-type"
  optional
  out_of_range = "out-of-range"
  past
  placeholder_shown = "placeholder-shown"
  read_only = "read-only"
  read_write = "read-write"
  required
  right
  root
  scope
  target
  target_within = "target-within"
  user_invalid = "user-invalid"
  valid
  visited
  where = "where()" # TODO: where() selector の実装

proc pseudoClass* (selector: selector, class: PseudoClass): selector =
  result = selector & ":".toSelector & ($class).toSelector