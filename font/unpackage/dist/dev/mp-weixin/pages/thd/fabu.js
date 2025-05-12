"use strict";
const common_vendor = require("../../common/vendor.js");
const common_js_settings = require("../../common/js/settings.js");
if (!Array) {
  const _easycom_u__input2 = common_vendor.resolveComponent("u--input");
  const _easycom_u__textarea2 = common_vendor.resolveComponent("u--textarea");
  const _easycom_u_button2 = common_vendor.resolveComponent("u-button");
  (_easycom_u__input2 + _easycom_u__textarea2 + _easycom_u_button2)();
}
const _easycom_u__input = () => "../../uni_modules/uview-plus/components/u--input/u--input.js";
const _easycom_u__textarea = () => "../../uni_modules/uview-plus/components/u--textarea/u--textarea.js";
const _easycom_u_button = () => "../../uni_modules/uview-plus/components/u-button/u-button.js";
if (!Math) {
  (_easycom_u__input + _easycom_u__textarea + _easycom_u_button)();
}
const _sfc_main = {
  __name: "fabu",
  setup(__props) {
    const postForm = common_vendor.ref({
      title: "",
      content: ""
    });
    const submitPost = () => {
      if (!postForm.value.title.trim()) {
        return common_vendor.index.showToast({
          title: "请输入标题",
          icon: "none"
        });
      }
      if (!postForm.value.content.trim()) {
        return common_vendor.index.showToast({
          title: "请输入内容",
          icon: "none"
        });
      }
      common_vendor.index.request({
        url: common_js_settings.base_url + "/get_uuid/",
        method: "GET",
        success: (get_uuid_res) => {
          let uuid = get_uuid_res.data.data.uuid;
          common_vendor.index.request({
            url: common_js_settings.base_url + "/cerate_talk/",
            method: "POST",
            data: {
              uuid: common_vendor.index.getStorageSync("uuid"),
              data_id: uuid,
              title: postForm.value.title,
              content: postForm.value.content
            },
            success: (res) => {
              common_vendor.index.__f__("log", "at pages/thd/fabu.vue:58", "res: ", res);
              common_vendor.index.showToast({
                duration: 2e3,
                icon: "success",
                title: "发布成功"
              });
              setTimeout(() => {
                common_vendor.index.navigateBack();
              }, 2e3);
            }
          });
        }
      });
    };
    return (_ctx, _cache) => {
      return {
        a: common_vendor.o(($event) => postForm.value.title = $event),
        b: common_vendor.p({
          placeholder: "请输入标题",
          maxlength: "30",
          border: "bottom",
          clearable: true,
          modelValue: postForm.value.title
        }),
        c: common_vendor.o(($event) => postForm.value.content = $event),
        d: common_vendor.p({
          placeholder: "请输入内容",
          height: "400rpx",
          margin: "30rpx 0",
          border: "none",
          modelValue: postForm.value.content
        }),
        e: common_vendor.o(submitPost),
        f: common_vendor.p({
          type: "primary",
          text: "发布"
        }),
        g: common_vendor.gei(_ctx, "")
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-86a7a6b8"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/thd/fabu.js.map
