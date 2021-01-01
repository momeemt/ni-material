import types, selector, strformat

type  
  PseudoClass* = enum
    active
    `any-link`
    blank
    checked
    current
    default
    defined
    disabled
    drop
    empty
    enabled
    first
    `first-child`
    `first-of-type`
    fullscreen
    future
    focus
    `focus-visible`
    `focus-within`
    hover
    indeterminate
    `in-range`
    invalid
    `last-child`
    `last_of_type`
    left
    link
    `local-link`
    `only-child`
    `only-of-type`
    optional
    `out-of-range`
    past
    `placeholder-shown`
    `read-only`
    `read-write`
    required
    right
    root
    scope
    target
    `target-within`
    `user-invalid`
    valid
    visited

  PseudoClassFuncResult = distinct string

  CharacterDirection* = enum
    ltr
    rtl
  
  OddOrEven* = enum
    odd
    even
  
  # FunctionalNotation = concept code
  #   code.match(re"^[0-9]{1,}n\+[0-9]{1,}$").isSome

proc toPseudoClassFuncResult (str: string): PseudoClassFuncResult =
  result = PseudoClassFuncResult(str)

proc toSelector (pcfr: PseudoClassFuncResult): selector =
  result = selector(pcfr)

proc pseudoClass* (selector: selector, class: PseudoClass): selector =
  result = selector & ":".toSelector & ($class).toSelector

proc pseudoClass* (selector: selector, pcfr: PseudoClassFuncResult): selector =
  result = selector & ":".toSelector & pcfr.toSelector

proc has* (selector: selector): PseudoClassFuncResult =
  result = fmt"has({$selector})".toPseudoClassFuncResult

proc dir* (cd: CharacterDirection): PseudoClassFuncResult =
  result = fmt"dir({$cd})".toPseudoClassFuncResult

proc host* (): PseudoClassFuncResult =
  result = "host".toPseudoClassFuncResult

proc host* (selector: selector): PseudoClassFuncResult =
  result = fmt"host({$selector})".toPseudoClassFuncResult

proc host_content* (selector: selector): PseudoClassFuncResult =
  result = fmt"host-content({$selector})".toPseudoClassFuncResult

proc `is`* (selector: selector): PseudoClassFuncResult =
  result = fmt"is({selector})".toPseudoClassFuncResult

proc lang* (lang_code: string): PseudoClassFuncResult =
  result = fmt"lang({lang_code})".toPseudoClassFuncResult

proc `not`* (selector: selector): PseudoClassFuncResult =
  result = fmt"not({selector})".toPseudoClassFuncResult

# proc nth_child* (functionalNotation: FunctionalNotation): PseudoClassFuncResult =
#   result = fmt"nth_child({functionalNotation.get})".toPseudoClassFuncResult

proc nth_child* (n: int): PseudoClassFuncResult =
  result = fmt"nth-child({$n})".toPseudoClassFuncResult

proc nth_child* (keyword: OddOrEven): PseudoClassFuncResult =
  result = fmt"nth-child({$keyword})".toPseudoClassFuncResult

proc nth_col* (n: int): PseudoClassFuncResult =
  result = fmt"nth-col({$n})".toPseudoClassFuncResult

proc nth_col* (keyword: OddOrEven): PseudoClassFuncResult =
  result = fmt"nth-col({$keyword})".toPseudoClassFuncResult

proc nth_last_child* (n: int): PseudoClassFuncResult =
  result = fmt"nth-last-child({$n})".toPseudoClassFuncResult

proc nth_last_child* (keyword: OddOrEven): PseudoClassFuncResult =
  result = fmt"nth-last-child({$keyword})".toPseudoClassFuncResult

proc nth_last_col* (n: int): PseudoClassFuncResult =
  result = fmt"nth-last-col({$n})".toPseudoClassFuncResult

proc nth_last_col* (keyword: OddOrEven): PseudoClassFuncResult =
  result = fmt"nth-last-col({$keyword})".toPseudoClassFuncResult

proc nth_last_of_type* (n: int): PseudoClassFuncResult =
  result = fmt"nth-last-of-type({$n})".toPseudoClassFuncResult

proc nth_last_of_type* (keyword: OddOrEven): PseudoClassFuncResult =
  result = fmt"nth-last-of-type({$keyword})".toPseudoClassFuncResult

proc nth_of_type* (n: int): PseudoClassFuncResult =
  result = fmt"nth-of-type({$n})".toPseudoClassFuncResult

proc nth_of_type* (keyword: OddOrEven): PseudoClassFuncResult =
  result = fmt"nth-of-type({$keyword})".toPseudoClassFuncResult

proc where* (selector: selector): PseudoClassFuncResult =
  result = fmt"where({selector})".toPseudoClassFuncResult