components {
  id: "sprite"
  component: "/main/background/background_back/background_back.sprite"
  position {
    x: 0.0
    y: 0.0
    z: -30.0
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
  component: "/main/background/background_back/background_back.script"
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
    value: "0.01, 1.0, 0.0"
    type: PROPERTY_TYPE_VECTOR3
  }
}
