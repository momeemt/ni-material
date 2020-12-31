import tables
import nimaterial/[color, HTMLElementType, pseudo_class, selector]
export color, HTMLElementType

type Flex* = enum
  fStart = "start"
  fEnd = "end"
  left
  right
  center
  justify
  justifyAll = "justify-all"
  matchParent = "match-parent"

const fontFamilyDefault = """"メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "HIragino Kaku Gothic Pro W3", "HIragino Kaku Gothic Pro", Osaka, "ＭＳ Ｐゴシック", "MS P Gothic", sans-serif"""
var resultCSS = initTable[string, string]()

proc output*() =
  block:
    var stylesheet: File = open("style.css", FileMode.fmWrite)
    defer:
      close(stylesheet)
    for key, value in resultCSS:
      stylesheet.writeLine key & "{" & value & "}"
  echo "We've successfully generated the CSS File!"

type Attributes = enum
  title

proc attribute* (selector: string, elem: Attributes): string =
  result = selector & "[" & $elem & "]"