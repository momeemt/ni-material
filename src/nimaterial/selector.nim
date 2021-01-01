import HTMLElementType, strformat, types

proc `&`* (left, right: selector): selector {.borrow.}

proc `$`* (slc: selector): string {.borrow.}

proc universal* (): selector =
  result = "*".toSelector

proc universal* (selector: selector): selector =
  result = fmt"{$selector} *".toSelector

proc id* (elem: HTML, name: string): selector =
  result = ($elem & "#" & name).toSelector

proc id* (name: string): selector =
  result = ("#" & name).toSelector

proc class* (elem: HTML, name: string): selector =
  result = ($elem & "." & name).toSelector

proc class* (name: string): selector =
  result = ("." & name).toSelector

proc attribute* (selector: selector, attribute: Attributes): selector =
  result = fmt"{$selector} [{$attribute}]".toSelector

proc attribute* (selector: selector, attribute: Attributes, value: string): selector =
  result = fmt"{$selector} [{$attribute} = {$value}]".toSelector

proc descendant* (selector: selector, elem: HTML): selector =
  result = selector & " ".toSelector & ($elem).toSelector

proc child* (selector: selector, elem: HTML): selector =
  result = selector & " > ".toSelector & ($elem).toSelector