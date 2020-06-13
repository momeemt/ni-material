# nimaterial
nimaterial is a CSS output library based on material design.

## Example

### Color
You can set color property to call color procedure.

```nim
".foo".color(red)
"#hoge".color(indigo)
h1.color(brown)
```

This code generates this CSS file.

```css
h1{color: #795548;}
.foo{color: #F44336;}
#hoge{color: #3F51B5;}
```

### Text
You can set text property to call text procedure.

```nim
".foo".text(size="22px", align=fEnd)
"#myText".text(align=justify, lineHeight="10px")
```

This code generated this CSS file.

```css
#myText{font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "HIragino Kaku Gothic Pro W3", "HIragino Kaku Gothic Pro", Osaka, "ＭＳ Ｐゴシック", "MS P Gothic", sans-serif;font-size: 16px;line-height: 10px;text-align: justify;}
.foo{font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "HIragino Kaku Gothic Pro W3", "HIragino Kaku Gothic Pro", Osaka, "ＭＳ Ｐゴシック", "MS P Gothic", sans-serif;font-size: 22px;line-height: normal;text-align: end;}
```