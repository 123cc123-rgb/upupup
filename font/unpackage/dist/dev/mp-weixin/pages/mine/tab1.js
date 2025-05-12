"use strict";
const common_vendor = require("../../common/vendor.js");
const common_js_settings = require("../../common/js/settings.js");
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
  __name: "tab1",
  setup(__props) {
    const type = common_vendor.ref("");
    const address = common_vendor.ref("");
    const created_date = common_vendor.ref("");
    const img = common_vendor.ref("");
    const text = common_vendor.ref("");
    const phone = common_vendor.ref("");
    common_vendor.onLoad((res) => {
      get_data_func(res.data_id);
    });
    const get_data_func = (id) => {
      common_vendor.index.request({
        url: common_js_settings.base_url + "/get_yichang_desc?search=" + id,
        method: "GET",
        success: (res) => {
          common_vendor.index.__f__("log", "at pages/mine/tab1.vue:129", "res: ", res);
          type.value = res.data[0].type;
          address.value = res.data[0].address;
          created_date.value = res.data[0].created_date;
          img.value = res.data[0].img;
          text.value = res.data[0].text;
          phone.value = res.data[0].phone;
        }
      });
    };
    return (_ctx, _cache) => {
      return {
        a: common_vendor.o(($event) => created_date.value = $event),
        b: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: created_date.value
        }),
        c: common_vendor.o(($event) => type.value = $event),
        d: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: type.value
        }),
        e: common_vendor.o(($event) => address.value = $event),
        f: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: address.value
        }),
        g: common_vendor.o(($event) => text.value = $event),
        h: common_vendor.p({
          disabled: true,
          border: "none",
          modelValue: text.value
        }),
        i: img.value,
        j: common_vendor.o(($event) => phone.value = $event),
        k: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: phone.value
        }),
        l: common_vendor.gei(_ctx, "")
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-65e71b0c"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/mine/tab1.js.map
