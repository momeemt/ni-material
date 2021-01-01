type
  selector* = distinct string

  Attributes* = enum
    title

  Browser* = enum
    Chrome
    Edge
    Firefox
    InternetExplorer
    Opera
    Safari
    WebViewAndroid
    ChromeAndroid
    FirefoxAndroid
    OperaAndroid
    iOSSafari
    SamsungInternet

  CascadingStyleSheet* = object
    version: string
    selector: selector
    browser: Browser

proc toSelector* (str: string): selector =
  result = selector(str)