"use strict";
const common_vendor = require("../../common/vendor.js");
const common_js_settings = require("../../common/js/settings.js");
if (!Array) {
  const _easycom_up_input2 = common_vendor.resolveComponent("up-input");
  const _easycom_up_button2 = common_vendor.resolveComponent("up-button");
  const _easycom_up_textarea2 = common_vendor.resolveComponent("up-textarea");
  const _easycom_up_upload2 = common_vendor.resolveComponent("up-upload");
  const _easycom_up_picker2 = common_vendor.resolveComponent("up-picker");
  (_easycom_up_input2 + _easycom_up_button2 + _easycom_up_textarea2 + _easycom_up_upload2 + _easycom_up_picker2)();
}
const _easycom_up_input = () => "../../uni_modules/uview-plus/components/u-input/u-input.js";
const _easycom_up_button = () => "../../uni_modules/uview-plus/components/u-button/u-button.js";
const _easycom_up_textarea = () => "../../uni_modules/uview-plus/components/u-textarea/u-textarea.js";
const _easycom_up_upload = () => "../../uni_modules/uview-plus/components/u-upload/u-upload.js";
const _easycom_up_picker = () => "../../uni_modules/uview-plus/components/u-picker/u-picker.js";
if (!Math) {
  (_easycom_up_input + _easycom_up_button + _easycom_up_textarea + _easycom_up_upload + _easycom_up_picker)();
}
const _sfc_main = {
  __name: "tab1",
  setup(__props) {
    const category_show = common_vendor.ref(false);
    const city = common_vendor.ref("");
    const type = common_vendor.ref("");
    const type_id = common_vendor.ref(null);
    const text = common_vendor.ref("");
    const phone = common_vendor.ref("");
    const address = common_vendor.ref("");
    const category_list = common_vendor.ref([]);
    const fileList1 = common_vendor.ref([]);
    const data_img_list = common_vendor.ref([]);
    common_vendor.onLoad(() => {
      get_type_func();
    });
    const submit_func = () => {
      if (!fileList1.value[0] || !address.value || !type.value || !text.value || !phone.value) {
        return common_vendor.index.showToast({
          duration: 2e3,
          icon: "error",
          title: "请填完整信息"
        });
      }
      let formData = {
        "uuid": common_vendor.index.getStorageSync("uuid"),
        "address": address.value,
        "type_id": type_id.value,
        "text": text.value,
        "phone": phone.value
      };
      common_vendor.index.__f__("log", "at pages/sec/tab1.vue:142", "data_img_list: ", data_img_list.value);
      common_vendor.index.__f__("log", "at pages/sec/tab1.vue:143", "fileList1: ", fileList1.value);
      common_vendor.index.uploadFile({
        url: common_js_settings.base_url + "/create_yichang/",
        filePath: data_img_list.value[0],
        name: "img",
        formData,
        success: (res) => {
          common_vendor.index.__f__("log", "at pages/sec/tab1.vue:152", "res: ", res);
          common_vendor.index.showToast({
            duration: 2e3,
            icon: "success",
            title: "提交成功"
          });
          setTimeout(() => {
            common_vendor.index.navigateBack();
          }, 2e3);
        }
      });
    };
    const deletePic1 = (event) => {
      fileList1.value.splice(event.index, 1);
    };
    const afterRead1 = async (event) => {
      let lists = [].concat(event.file);
      let fileListLen = fileList1.value.length;
      lists.map((item) => {
        fileList1.value.push({
          ...item
        });
        data_img_list.value.push(item.url);
      });
      for (let i = 0; i < lists.length; i++) {
        let item = fileList1.value[fileListLen];
        fileList1.value.splice(fileListLen, 1, {
          ...item,
          status: "success"
        });
        fileListLen++;
      }
    };
    const confirm_func = (res) => {
      type.value = res.value[0].name;
      type_id.value = res.value[0].id;
      category_show.value = false;
    };
    const close_func = () => {
      category_show.value = false;
    };
    const get_type_func = () => {
      common_vendor.index.request({
        url: common_js_settings.base_url + "/get_yichangtype/",
        method: "GET",
        success: (res) => {
          let nu_list = [[]];
          category_list.value = nu_list;
          res.data.map((res_item) => {
            category_list.value[0].push(res_item);
          });
          common_vendor.index.__f__("log", "at pages/sec/tab1.vue:233", "category_list.value: ", category_list.value);
        }
      });
    };
    const get_city_func = () => {
      common_vendor.index.getLocation({
        type: "wgs84",
        success: function(res) {
          common_vendor.index.request({
            url: common_js_settings.base_url + "/get_city?longitude=" + res.longitude + "&latitude=" + res.latitude + "&uuid=" + common_vendor.index.getStorageSync("uuid"),
            method: "GET",
            success: (res2) => {
              address.value = res2.data.data[1];
              city.value = res2.data.data[0];
            }
          });
        }
      });
    };
    return (_ctx, _cache) => {
      return {
        a: common_vendor.o(($event) => type.value = $event),
        b: common_vendor.p({
          placeholder: "请选择异常类型",
          border: "none",
          color: "#8a8a8a",
          modelValue: type.value
        }),
        c: common_vendor.o(($event) => category_show.value = true),
        d: common_vendor.o(($event) => address.value = $event),
        e: common_vendor.p({
          placeholder: "请输入地址",
          border: "none",
          color: "#8a8a8a",
          modelValue: address.value
        }),
        f: common_vendor.o(get_city_func),
        g: common_vendor.p({
          type: "primary",
          shape: "circle",
          text: "点击获取当前地址"
        }),
        h: common_vendor.o(($event) => text.value = $event),
        i: common_vendor.p({
          border: "none",
          placeholder: "请描述异常情况",
          modelValue: text.value
        }),
        j: common_vendor.o(afterRead1),
        k: common_vendor.o(deletePic1),
        l: common_vendor.p({
          fileList: fileList1.value,
          previewFullImage: true,
          name: "1",
          multiple: true,
          maxCount: 1
        }),
        m: common_vendor.o(($event) => phone.value = $event),
        n: common_vendor.p({
          placeholder: "请输入手机号",
          border: "none",
          color: "#8a8a8a",
          modelValue: phone.value
        }),
        o: common_vendor.o(submit_func),
        p: common_vendor.p({
          type: "primary",
          shape: "circle",
          text: "提交"
        }),
        q: common_vendor.o(close_func),
        r: common_vendor.o(close_func),
        s: common_vendor.o(confirm_func),
        t: common_vendor.p({
          show: category_show.value,
          columns: category_list.value,
          keyName: "name",
          closeOnClickOverlay: true
        }),
        v: common_vendor.gei(_ctx, "")
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-0fab3dee"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/sec/tab1.js.map
