import HTMLElementType

type selector* = distinct string

proc `&`* (left, right: selector): selector {.borrow.}
proc `$`* (slc: selector): string {.borrow.}

proc toSelector* (str: string): selector =
  result = selector(str)

proc id* (elem: HTML, name: string): selector =
  result = ($elem & "#" & name).toSelector

proc id* (name: string): selector =
  result = ("#" & name).toSelector

proc class* (elem: HTML, name: string): selector =
  result = ($elem & "." & name).toSelector

proc class* (name: string): selector =
  result = ("." & name).toSelector

proc descendant* (selector: selector, elem: HTML): selector =
  result = selector & " ".toSelector & ($elem).toSelector

proc child* (selector: selector, elem: HTML): selector =
  result = selector & " > ".toSelector & ($elem).toSelector