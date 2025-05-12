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
  __name: "tab3",
  setup(__props) {
    const type = common_vendor.ref("");
    const text = common_vendor.ref("");
    const phone = common_vendor.ref("");
    const another_user = common_vendor.ref("");
    const is_ni = common_vendor.ref(null);
    const img = common_vendor.ref("");
    const img1 = common_vendor.ref("");
    const img2 = common_vendor.ref("");
    common_vendor.onLoad((res) => {
      get_data_func(res.data_id);
    });
    const get_data_func = (id) => {
      common_vendor.index.request({
        url: common_js_settings.base_url + "/get_tousu_desc?search=" + id,
        method: "GET",
        success: (res) => {
          common_vendor.index.__f__("log", "at pages/mine/tab3.vue:117", "res: ", res);
          img.value = res.data[0].img;
          img1.value = res.data[0].img1;
          img2.value = res.data[0].img2;
          type.value = res.data[0].type;
          text.value = res.data[0].text;
          phone.value = res.data[0].phone;
          another_user.value = res.data[0].another_user;
          is_ni.value = res.data[0].is_ni;
        }
      });
    };
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: common_vendor.o(($event) => type.value = $event),
        b: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: type.value
        }),
        c: common_vendor.o(($event) => another_user.value = $event),
        d: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: another_user.value
        }),
        e: common_vendor.o(($event) => text.value = $event),
        f: common_vendor.p({
          border: "none",
          disabled: true,
          modelValue: text.value
        }),
        g: img.value,
        h: img1.value
      }, img1.value ? {
        i: img1.value
      } : {}, {
        j: img2.value
      }, img2.value ? {
        k: img2.value
      } : {}, {
        l: common_vendor.o(($event) => phone.value = $event),
        m: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: phone.value
        }),
        n: common_vendor.t(is_ni.value),
        o: common_vendor.gei(_ctx, "")
      });
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-516219de"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/mine/tab3.js.map
