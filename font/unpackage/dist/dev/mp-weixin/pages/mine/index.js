"use strict";
const common_vendor = require("../../common/vendor.js");
const common_assets = require("../../common/assets.js");
const common_js_settings = require("../../common/js/settings.js");
if (!Array) {
  const _easycom_up_collapse_item2 = common_vendor.resolveComponent("up-collapse-item");
  const _easycom_up_collapse2 = common_vendor.resolveComponent("up-collapse");
  const _easycom_up_icon2 = common_vendor.resolveComponent("up-icon");
  const _easycom_up_button2 = common_vendor.resolveComponent("up-button");
  (_easycom_up_collapse_item2 + _easycom_up_collapse2 + _easycom_up_icon2 + _easycom_up_button2)();
}
const _easycom_up_collapse_item = () => "../../uni_modules/uview-plus/components/u-collapse-item/u-collapse-item.js";
const _easycom_up_collapse = () => "../../uni_modules/uview-plus/components/u-collapse/u-collapse.js";
const _easycom_up_icon = () => "../../uni_modules/uview-plus/components/u-icon/u-icon.js";
const _easycom_up_button = () => "../../uni_modules/uview-plus/components/u-button/u-button.js";
if (!Math) {
  (_easycom_up_collapse_item + _easycom_up_collapse + _easycom_up_icon + _easycom_up_button)();
}
const _sfc_main = {
  __name: "index",
  setup(__props) {
    const username = common_vendor.ref("");
    const role = common_vendor.ref("");
    const phone = common_vendor.ref("");
    const avatar = common_vendor.ref("");
    const jifen = common_vendor.ref(0);
    const jifen_list = common_vendor.ref([]);
    common_vendor.onLoad(() => {
      if (common_vendor.index.getStorageSync("uuid")) {
        get_user_func();
        get_jifen_func();
      }
    });
    common_vendor.onShow(() => {
      if (common_vendor.index.getStorageSync("uuid")) {
        get_user_func();
        get_jifen_func();
      }
    });
    const nav_to_desc = () => {
      common_vendor.index.navigateTo({
        url: "/pages/mine/information"
      });
    };
    const nav_to_talk = () => {
      common_vendor.index.navigateTo({
        url: "/pages/mine/search_talk"
      });
    };
    const nav_to_view = (res) => {
      common_vendor.index.navigateTo({
        url: "/pages/mine/list" + res
      });
    };
    const formatDate = (dateStr) => {
      const date = new Date(dateStr);
      const year = date.getFullYear();
      const month = String(date.getMonth() + 1).padStart(2, "0");
      const day = String(date.getDate()).padStart(2, "0");
      const hours = String(date.getHours()).padStart(2, "0");
      const minutes = String(date.getMinutes()).padStart(2, "0");
      return `${year}-${month}-${day} ${hours}:${minutes}`;
    };
    const get_user_func = () => {
      common_vendor.index.request({
        url: common_js_settings.base_url + "/get_user_info?uuid=" + common_vendor.index.getStorageSync("uuid"),
        method: "GET",
        success: (res111) => {
          common_vendor.index.__f__("log", "at pages/mine/index.vue:182", "res111: ", res111);
          common_vendor.index.setStorageSync("username", res111.data.data.username);
          common_vendor.index.setStorageSync("avatar", res111.data.data.avatar);
          common_vendor.index.setStorageSync("role", res111.data.data.role);
          common_vendor.index.setStorageSync("address", res111.data.data.address);
          common_vendor.index.setStorageSync("phone", res111.data.data.phone);
          username.value = res111.data.data.username;
          avatar.value = res111.data.data.avatar;
          role.value = res111.data.data.role;
          phone.value = res111.data.data.phone;
        }
      });
    };
    const get_jifen_func = () => {
      common_vendor.index.request({
        url: common_js_settings.base_url + "/get_jifen?uuid=" + common_vendor.index.getStorageSync("uuid"),
        method: "GET",
        success: (res) => {
          jifen.value = res.data.data[0];
          res.data.data[1].map((res_item) => {
            res_item.created_date = formatDate(res_item.created_date);
          });
          jifen_list.value = res.data.data[1];
        }
      });
    };
    const logout = () => {
      common_vendor.index.removeStorageSync("uuid");
      common_vendor.index.removeStorageSync("username");
      common_vendor.index.removeStorageSync("avatar");
      common_vendor.index.removeStorageSync("role");
      common_vendor.index.removeStorageSync("address");
      common_vendor.index.removeStorageSync("phone");
      username.value = "";
      avatar.value = "";
      role.value = "";
      common_vendor.index.switchTab({
        url: "/pages/index/index"
      });
    };
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: avatar.value,
        b: !username.value
      }, !username.value ? {} : {}, {
        c: username.value
      }, username.value ? {
        d: common_vendor.t(username.value),
        e: common_vendor.t(role.value),
        f: common_vendor.t(phone.value)
      } : {}, {
        g: common_assets._imports_0,
        h: common_vendor.o(nav_to_desc),
        i: common_vendor.t(jifen.value),
        j: common_vendor.f(jifen_list.value, (item, k0, i0) => {
          return {
            a: common_vendor.t(item.text),
            b: common_vendor.t(item.created_date),
            c: common_vendor.t(item.jifen)
          };
        }),
        k: common_vendor.p({
          title: "我的积分"
        }),
        l: common_vendor.p({
          name: "arrow-right"
        }),
        m: common_vendor.o(nav_to_talk),
        n: common_vendor.p({
          name: "arrow-right"
        }),
        o: common_vendor.o(($event) => nav_to_view(1)),
        p: common_vendor.p({
          name: "arrow-right"
        }),
        q: common_vendor.o(($event) => nav_to_view(2)),
        r: common_vendor.p({
          name: "arrow-right"
        }),
        s: common_vendor.o(($event) => nav_to_view(3)),
        t: common_vendor.o(logout),
        v: common_vendor.p({
          text: "退出登录",
          shape: "circle"
        }),
        w: common_vendor.gei(_ctx, "")
      });
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-569e925a"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/mine/index.js.map
