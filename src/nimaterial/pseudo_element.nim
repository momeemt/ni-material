import types, selector, strformat

type
  PseudoElement* = enum
    after
    backdrop
    before
    cue
    `cue-region`
    `first-letter`
    `first-line`
    `grammar-error`
    marker
    placeholder
    selection
    `spelling-error`

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