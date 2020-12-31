import selector, strformat

type
  PseudoElement* = enum
    after
    backdrop
    before
    cue
    cue_region = "cue-region"
    first_letter = "first-letter"
    first_line = "first-line"
    grammar_error = "grammar-error"
    marker
    placeholder
    selection
    spelling_error = "spelling-error"

  PseudoElementFuncResult = distinct string

proc toPseudoElementFuncResult (str: string): PseudoElementFuncResult =
  result = PseudoElementFuncResult(str)

proc toSelector (pcfr: PseudoElementFuncResult): selector =
  result = selector(pcfr)

proc pseudoElement* (selector: selector, class: PseudoElement): selector =
  result = selector & "::".toSelector & ($class).toSelector

proc pseudoElement* (selector: selector, pcfr: PseudoElementFuncResult): selector =
  result = selector & "::".toSelector & pcfr.toSelector

proc part* (selector: selector): PseudoElementFuncResult =
  result = fmt"part({$selector})".toPseudoElementFuncResult

proc slotted* (selector: selector): PseudoElementFuncResult =
  result = fmt"slotted({selector})".toPseudoElementFuncResult