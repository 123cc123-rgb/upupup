"use strict";
Object.defineProperty(exports, Symbol.toStringTag, { value: "Module" });
const common_vendor = require("./common/vendor.js");
const uni_modules_uviewPlus_index = require("./uni_modules/uview-plus/index.js");
if (!Math) {
  "./pages/index/index.js";
  "./pages/index/desc.js";
  "./pages/sec/index.js";
  "./pages/sec/tab1.js";
  "./pages/sec/tab2.js";
  "./pages/sec/tab3.js";
  "./pages/thd/index.js";
  "./pages/thd/fabu.js";
  "./pages/mine/index.js";
  "./pages/mine/information.js";
  "./pages/mine/search_talk.js";
  "./pages/mine/list1.js";
  "./pages/mine/list2.js";
  "./pages/mine/list3.js";
  "./pages/mine/tab1.js";
  "./pages/mine/tab2.js";
  "./pages/mine/tab3.js";
  "./pages/login/index.js";
}
const _sfc_main = {
  onLaunch: function() {
    common_vendor.index.__f__("log", "at App.vue:4", "App Launch");
  },
  onShow: function() {
    common_vendor.index.__f__("log", "at App.vue:7", "App Show");
  },
  onHide: function() {
    common_vendor.index.__f__("log", "at App.vue:10", "App Hide");
  }
};
function createApp() {
  const app = common_vendor.createSSRApp(_sfc_main);
  app.use(uni_modules_uviewPlus_index.uviewPlus);
  return {
    app
  };
}
createApp().app.mount("#app");
exports.createApp = createApp;
//# sourceMappingURL=../.sourcemap/mp-weixin/app.js.map
