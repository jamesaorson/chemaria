components {
  id: "sprite"
  component: "/main/background/background_middle/background_middle.sprite"
  position {
    x: 0.0
    y: 0.0
    z: -20.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
components {
  id: "script"
  component: "/main/background/background_middle/background_middle.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
  properties {
    id: "scrolling_speed"
    value: "0.02, 1.0, 0.0"
    type: PROPERTY_TYPE_VECTOR3
  }
}
