"use strict";
const common_vendor = require("../../common/vendor.js");
if (!Array) {
  const _easycom_up_input2 = common_vendor.resolveComponent("up-input");
  const _easycom_up_textarea2 = common_vendor.resolveComponent("up-textarea");
  (_easycom_up_input2 + _easycom_up_textarea2)();
}
const _easycom_up_input = () => "../../uni_modules/uview-plus/components/u-input/u-input.js";
const _easycom_up_textarea = () => "../../uni_modules/uview-plus/components/u-textarea/u-textarea.js";
if (!Math) {
  (_easycom_up_input + _easycom_up_textarea)();
}
const _sfc_main = {
  __name: "information",
  setup(__props) {
    const username = common_vendor.ref("");
    const address = common_vendor.ref("");
    const phone = common_vendor.ref("");
    const role = common_vendor.ref("");
    common_vendor.onLoad((res) => {
      username.value = common_vendor.index.getStorageSync("username");
      role.value = common_vendor.index.getStorageSync("role");
      address.value = common_vendor.index.getStorageSync("address");
      phone.value = common_vendor.index.getStorageSync("phone");
    });
    return (_ctx, _cache) => {
      return {
        a: common_vendor.o(($event) => username.value = $event),
        b: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: username.value
        }),
        c: common_vendor.o(($event) => role.value = $event),
        d: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: role.value
        }),
        e: common_vendor.o(($event) => phone.value = $event),
        f: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: phone.value
        }),
        g: common_vendor.o(($event) => address.value = $event),
        h: common_vendor.p({
          disabled: true,
          border: "none",
          modelValue: address.value
        }),
        i: common_vendor.gei(_ctx, "")
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-56ce4ae3"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/mine/information.js.map
