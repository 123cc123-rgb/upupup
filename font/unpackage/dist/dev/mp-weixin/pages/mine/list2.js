"use strict";
const common_vendor = require("../../common/vendor.js");
const common_js_settings = require("../../common/js/settings.js");
const _sfc_main = {
  __name: "list2",
  setup(__props) {
    common_vendor.onLoad(() => {
      get_data_func();
    });
    common_vendor.onShow(() => {
      get_data_func();
    });
    const data_list = common_vendor.ref([]);
    const nav_to_desc = (id) => {
      common_vendor.index.navigateTo({
        url: "/pages/mine/tab2?data_id=" + id
      });
    };
    const get_data_func = () => {
      common_vendor.index.request({
        url: common_js_settings.base_url + "/get_jiufen_list?search=" + common_vendor.index.getStorageSync("uuid"),
        method: "GET",
        success: (res) => {
          data_list.value = res.data;
        }
      });
    };
    return (_ctx, _cache) => {
      return {
        a: common_vendor.f(data_list.value, (item, k0, i0) => {
          return {
            a: common_vendor.t(item.type),
            b: common_vendor.t(item.created_date),
            c: common_vendor.o(($event) => nav_to_desc(item.id))
          };
        }),
        b: common_vendor.gei(_ctx, "")
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-ba8739f7"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/mine/list2.js.map
