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
  __name: "tab2",
  setup(__props) {
    const type = common_vendor.ref("");
    const apply_user = common_vendor.ref("");
    const apply_phone = common_vendor.ref("");
    const apply_address = common_vendor.ref("");
    const other_user = common_vendor.ref("");
    const other_phone = common_vendor.ref("");
    const other_address = common_vendor.ref("");
    const text = common_vendor.ref("");
    const suqiu = common_vendor.ref("");
    const img = common_vendor.ref("");
    const img1 = common_vendor.ref("");
    const img2 = common_vendor.ref("");
    const state = common_vendor.ref("");
    common_vendor.onLoad((res) => {
      get_data_func(res.data_id);
    });
    const get_data_func = (id) => {
      common_vendor.index.request({
        url: common_js_settings.base_url + "/get_jiufen_desc?search=" + id,
        method: "GET",
        success: (res) => {
          type.value = res.data[0].type;
          apply_user.value = res.data[0].apply_user;
          apply_phone.value = res.data[0].apply_phone;
          apply_address.value = res.data[0].apply_address;
          other_user.value = res.data[0].other_user;
          other_phone.value = res.data[0].other_phone;
          other_address.value = res.data[0].other_address;
          text.value = res.data[0].text;
          suqiu.value = res.data[0].suqiu;
          img.value = res.data[0].img;
          img1.value = res.data[0].img1;
          img2.value = res.data[0].img2;
          state.value = res.data[0].state;
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
        c: common_vendor.o(($event) => state.value = $event),
        d: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: state.value
        }),
        e: common_vendor.o(($event) => apply_user.value = $event),
        f: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: apply_user.value
        }),
        g: common_vendor.o(($event) => apply_phone.value = $event),
        h: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: apply_phone.value
        }),
        i: common_vendor.o(($event) => apply_address.value = $event),
        j: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: apply_address.value
        }),
        k: common_vendor.o(($event) => other_user.value = $event),
        l: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: other_user.value
        }),
        m: common_vendor.o(($event) => other_phone.value = $event),
        n: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: other_phone.value
        }),
        o: common_vendor.o(($event) => other_address.value = $event),
        p: common_vendor.p({
          disabled: true,
          border: "none",
          color: "#8a8a8a",
          modelValue: other_address.value
        }),
        q: common_vendor.o(($event) => text.value = $event),
        r: common_vendor.p({
          border: "none",
          disabled: true,
          modelValue: text.value
        }),
        s: common_vendor.o(($event) => suqiu.value = $event),
        t: common_vendor.p({
          border: "none",
          disabled: true,
          modelValue: suqiu.value
        }),
        v: img.value,
        w: img1.value
      }, img1.value ? {
        x: img1.value
      } : {}, {
        y: img2.value
      }, img2.value ? {
        z: img2.value
      } : {}, {
        A: common_vendor.gei(_ctx, "")
      });
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-49a68114"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/mine/tab2.js.map
