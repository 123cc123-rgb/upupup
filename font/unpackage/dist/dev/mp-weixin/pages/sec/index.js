"use strict";
const common_vendor = require("../../common/vendor.js");
if (!Array) {
  const _easycom_up_icon2 = common_vendor.resolveComponent("up-icon");
  _easycom_up_icon2();
}
const _easycom_up_icon = () => "../../uni_modules/uview-plus/components/u-icon/u-icon.js";
if (!Math) {
  _easycom_up_icon();
}
const _sfc_main = {
  __name: "index",
  setup(__props) {
    const nav_to_tab1 = () => {
      common_vendor.index.navigateTo({
        url: "/pages/sec/tab1"
      });
    };
    const nav_to_tab2 = () => {
      common_vendor.index.navigateTo({
        url: "/pages/sec/tab2"
      });
    };
    const nav_to_tab3 = () => {
      common_vendor.index.navigateTo({
        url: "/pages/sec/tab3"
      });
    };
    return (_ctx, _cache) => {
      return {
        a: common_vendor.p({
          name: "arrow-right",
          size: "1.4rem"
        }),
        b: common_vendor.o(nav_to_tab1),
        c: common_vendor.p({
          name: "arrow-right",
          size: "1.4rem"
        }),
        d: common_vendor.o(nav_to_tab2),
        e: common_vendor.p({
          name: "arrow-right",
          size: "1.4rem"
        }),
        f: common_vendor.o(nav_to_tab3),
        g: common_vendor.gei(_ctx, "")
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-ba465802"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/sec/index.js.map
