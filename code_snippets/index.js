window.mapControl = window.mapControl || {};
window.mapControl.controlsByRegion = {};

window.mapControl.init = function (
  itemName,
  mapRegionId,
  position,
  icon_html,
  js_action
) {
  if (!window.mapControl.controlsByRegion[mapRegionId]) {
    window.mapControl.controlsByRegion[mapRegionId] = [];
  }

  window.mapControl.controlsByRegion[mapRegionId].push({
    itemName,
    position,
    icon_html,
    js_action,
  });

  var $region = $("#" + mapRegionId);

  if (!$region.data("mc-init")) {
    $region.data("mc-init", true);

    $region.on("spatialmapinitialized.MAP_REGION", function (event) {
      var map = apex.region(mapRegionId).call("getMapObject");
      if (!map) {
        console.error("Map could not be retrieved.");
        return;
      }

      (window.mapControl.controlsByRegion[mapRegionId] || []).forEach(function (
        ctrl
      ) {
        const control = createControl(
          ctrl.itemName,
          ctrl.icon_html,
          ctrl.js_action
        );
        map.addControl(control, ctrl.position);
      });
    });
  }
};

function createControl(itemName, icon_html, js_action) {
  class Control {
    onAdd(map) {
      this._map = map;
      this._container = document.createElement("div");
      this._container.className =
        "maplibregl-ctrl maplibregl-ctrl-group custom-control-container";
      this._container.style.position = "relative";

      const button = document.createElement("button");
      button.type = "button";
      button.title = itemName;
      button.className = "a-Button a-Button--noLabel";
      button.innerHTML = icon_html || itemName;

      button.addEventListener("click", () => {
        if (js_action) {
          try {
            new Function("map", js_action)(this._map);
          } catch (ex) {
            console.error("Custom JS action error:", ex);
          }
        }
      });

      this._container.appendChild(button);
      return this._container;
    }
    onRemove() {
      this._container.remove();
      this._map = undefined;
    }
  }
  return new Control();
}
