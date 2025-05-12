"use strict";
const common_vendor = require("../../common/vendor.js");
const common_js_settings = require("../../common/js/settings.js");
if (!Array) {
  const _easycom_up_swiper2 = common_vendor.resolveComponent("up-swiper");
  const _easycom_up_collapse_item2 = common_vendor.resolveComponent("up-collapse-item");
  const _easycom_up_collapse2 = common_vendor.resolveComponent("up-collapse");
  (_easycom_up_swiper2 + _easycom_up_collapse_item2 + _easycom_up_collapse2)();
}
const _easycom_up_swiper = () => "../../uni_modules/uview-plus/components/u-swiper/u-swiper.js";
const _easycom_up_collapse_item = () => "../../uni_modules/uview-plus/components/u-collapse-item/u-collapse-item.js";
const _easycom_up_collapse = () => "../../uni_modules/uview-plus/components/u-collapse/u-collapse.js";
if (!Math) {
  (_easycom_up_swiper + _easycom_up_collapse_item + _easycom_up_collapse)();
}
const _sfc_main = {
  __name: "index",
  setup(__props) {
    common_vendor.onLoad(() => {
      if (!common_vendor.index.getStorageSync("uuid")) {
        common_vendor.index.navigateTo({
          url: "/pages/login/index"
        });
      } else {
        get_banner_func();
        get_data_func();
      }
    });
    common_vendor.onShow(() => {
      if (!common_vendor.index.getStorageSync("uuid")) {
        common_vendor.index.navigateTo({
          url: "/pages/login/index"
        });
      } else {
        get_banner_func();
        get_data_func();
      }
    });
    const nav_to_desc = (id) => {
      common_vendor.index.navigateTo({
        url: "/pages/index/desc?id=" + id
      });
    };
    const banner_list = common_vendor.ref([]);
    const data_list = common_vendor.ref([]);
    const get_banner_func = () => {
      common_vendor.index.request({
        url: common_js_settings.base_url + "/get_banner/",
        method: "GET",
        success: (res) => {
          banner_list.value = res.data;
        }
      });
    };
    const get_data_func = () => {
      common_vendor.index.request({
        url: common_js_settings.base_url + "/get_index_data/",
        method: "GET",
        success: (res) => {
          data_list.value = res.data.data;
        }
      });
    };
    return (_ctx, _cache) => {
      return {
        a: common_vendor.p({
          list: banner_list.value,
          keyName: "img",
          height: "30vh"
        }),
        b: common_vendor.f(data_list.value, (value, key, index) => {
          return {
            a: common_vendor.f(value, (item, k1, i1) => {
              return {
                a: common_vendor.t(item.title),
                b: common_vendor.t(item.created_date),
                c: common_vendor.o(($event) => nav_to_desc(item.id))
              };
            }),
            b: "1cf27b2a-2-" + index + "," + ("1cf27b2a-1-" + index),
            c: common_vendor.p({
              title: key
            }),
            d: "1cf27b2a-1-" + index
          };
        }),
        c: common_vendor.gei(_ctx, "")
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-1cf27b2a"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/index/index.js.map
