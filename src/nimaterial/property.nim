import selector

type
  alignContentValue = enum
    start
    `end`
    `first-flex`
    `flex-end`
    center
    normal
    baseline
    `first baseline`
    `last baseline`
    `space-between`
    `space-around`
    `space-evenly`
    stretch
    safe
    unsafe

proc alignContent* (selector: selector, value: alignContentValue) =
  discard