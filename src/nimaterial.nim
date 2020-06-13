import tables

type HTML* = enum
  p
  mDiv = "div"
  h1
  h2
  a

type Color* = enum
  red = "#F44336"
  pink = "#E91E63"
  purple = "#9C27B0"
  deepPurple = "#673AB7"
  indigo = "#3F51B5"
  blue = "#2196F3"
  lightBlue = "#03A9F4"
  cyan = "#00BCD4"
  teal = "#009688"
  green = "#4CAF50"
  lightGreen = "#8BC34A"
  lime = "#CDDC39"
  yellow = "#FFEB3B"
  amber = "#FFC107"
  orange = "#FF9800"
  deepOrange = "#FF5722"
  brown = "#795548"
  blueGrey = "#607D8B"
  grey = "#9E9E9E"

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

proc getCSSParameter(keyName: string, baseStyle: string): string =
  if resultCSS.hasKey(keyName):
    let presentStyle = resultCSS[keyName]
    return presentStyle & baseStyle & ";"
  else:
    return baseStyle & ";"

proc color*[T](className: T, color: Color) =
  let baseStyle = "color: " & $color
  resultCSS[$className] = getCSSParameter($className, baseStyle)

proc text*[T](className: T, font: string = fontFamilyDefault, size: string = "16px", lineHeight: string = "normal", align: Flex = fStart) =
  resultCSS[$className] = getCSSParameter($className, "font-family: " & font)
  resultCSS[$className] = getCSSParameter($className, "font-size: " & size)
  resultCSS[$className] = getCSSParameter($className, "line-height: " & lineHeight)
  resultCSS[$className] = getCSSParameter($className, "text-align: " & $align)

proc floatShadow*[T](className: T, time: float) =
  resultCSS[$className] = getCSSParameter($className, "transition: " & $time & "s")
  resultCSS[$className] = getCSSParameter($className, "box-shadow: 0 2px 2px 0 rgba(0,0,0,.12), 0 2px 2px 0 rgba(0,0,0,.24)")
  resultCSS[$className & ":hover"] = getCSSParameter($className, "box-shadow: 0 4px 5px 0 rgba(0,0,0,.14), 0 1px 10px 0 rgba(0,0,0,.12), 0 2px 4px -1px rgba(0,0,0,.2)")

proc output*() =
  block:
    var stylesheet: File = open("style.css", FileMode.fmWrite)
    defer:
      close(stylesheet)
    for key, value in resultCSS:
      stylesheet.writeLine key & "{" & value & "}"
  echo "We've successfully generated the CSS File!"