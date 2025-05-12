"use strict";
const common_vendor = require("../../common/vendor.js");
const common_js_settings = require("../../common/js/settings.js");
const _sfc_main = {
  __name: "desc",
  setup(__props) {
    const title = common_vendor.ref("");
    const created_date = common_vendor.ref("");
    const text = common_vendor.ref("");
    const img = common_vendor.ref("");
    common_vendor.onLoad((res) => {
      get_data_desc_func(res.id);
    });
    const get_data_desc_func = (id) => {
      common_vendor.index.request({
        url: common_js_settings.base_url + "/get_tuwen_desc?search=" + id,
        method: "GET",
        success: (res) => {
          common_vendor.index.__f__("log", "at pages/index/desc.vue:46", "res: ", res.data[0].created_date);
          title.value = res.data[0].title;
          img.value = res.data[0].img;
          text.value = res.data[0].text;
          created_date.value = res.data[0].created_date;
        }
      });
    };
    return (_ctx, _cache) => {
      return {
        a: common_vendor.t(title.value),
        b: common_vendor.t(created_date.value),
        c: img.value,
        d: common_vendor.t(text.value),
        e: common_vendor.gei(_ctx, "")
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-a06140da"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/index/desc.js.map
