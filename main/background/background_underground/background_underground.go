components {
  id: "sprite"
  component: "/main/background/background_underground/background_underground.sprite"
  position {
    x: 0.0
    y: 0.0
    z: -40.0
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
  component: "/main/background/background_underground/background_underground.script"
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
    value: "0.04, 1.0, 0.0"
    type: PROPERTY_TYPE_VECTOR3
  }
}
