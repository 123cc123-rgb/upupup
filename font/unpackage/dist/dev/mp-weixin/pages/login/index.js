"use strict";
const common_vendor = require("../../common/vendor.js");
const common_assets = require("../../common/assets.js");
const common_js_settings = require("../../common/js/settings.js");
const _sfc_main = {
  __name: "index",
  setup(__props) {
    const get_user_phone = (e) => {
      if (e.detail.code) {
        common_vendor.index.login({
          success: (login_res) => {
            common_vendor.index.request({
              url: common_js_settings.base_url + "/login_by_phone/",
              method: "POST",
              data: {
                code: e.detail.code,
                code2: login_res.code
              },
              success: (res) => {
                if (res.data.code === 100) {
                  common_vendor.index.setStorageSync("uuid", res.data.data.uuid);
                  common_vendor.index.request({
                    url: common_js_settings.base_url + "/get_user_info?uuid=" + common_vendor.index.getStorageSync("uuid"),
                    method: "GET",
                    success: (res111) => {
                      common_vendor.index.setStorageSync("username", res111.data.data.username);
                      common_vendor.index.setStorageSync("avatar", res111.data.data.avatar);
                      common_vendor.index.setStorageSync("role", res111.data.data.role);
                      common_vendor.index.setStorageSync("address", res111.data.data.address);
                      common_vendor.index.setStorageSync("phone", res111.data.data.phone);
                      common_vendor.index.showToast({
                        duration: 2e3,
                        title: "登录成功",
                        icon: "success"
                      });
                      setTimeout(() => {
                        common_vendor.index.navigateBack();
                      }, 2e3);
                      return;
                    }
                  });
                }
                if (res.data.code === 500) {
                  return common_vendor.index.showToast({
                    duration: 2e3,
                    title: "登录失败",
                    icon: "error"
                  });
                }
              }
            });
          }
        });
      }
    };
    return (_ctx, _cache) => {
      return {
        a: common_assets._imports_0$1,
        b: common_vendor.o(get_user_phone),
        c: common_vendor.o(get_user_phone),
        d: common_vendor.gei(_ctx, "")
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-d08ef7d4"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/login/index.js.map
