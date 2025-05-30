"use strict";
const common_vendor = require("../../common/vendor.js");
const common_js_settings = require("../../common/js/settings.js");
if (!Array) {
  const _easycom_up_input2 = common_vendor.resolveComponent("up-input");
  const _easycom_up_textarea2 = common_vendor.resolveComponent("up-textarea");
  const _easycom_up_upload2 = common_vendor.resolveComponent("up-upload");
  const _easycom_up_button2 = common_vendor.resolveComponent("up-button");
  const _easycom_up_picker2 = common_vendor.resolveComponent("up-picker");
  (_easycom_up_input2 + _easycom_up_textarea2 + _easycom_up_upload2 + _easycom_up_button2 + _easycom_up_picker2)();
}
const _easycom_up_input = () => "../../uni_modules/uview-plus/components/u-input/u-input.js";
const _easycom_up_textarea = () => "../../uni_modules/uview-plus/components/u-textarea/u-textarea.js";
const _easycom_up_upload = () => "../../uni_modules/uview-plus/components/u-upload/u-upload.js";
const _easycom_up_button = () => "../../uni_modules/uview-plus/components/u-button/u-button.js";
const _easycom_up_picker = () => "../../uni_modules/uview-plus/components/u-picker/u-picker.js";
if (!Math) {
  (_easycom_up_input + _easycom_up_textarea + _easycom_up_upload + _easycom_up_button + _easycom_up_picker)();
}
const _sfc_main = {
  __name: "tab2",
  setup(__props) {
    const category_show = common_vendor.ref(false);
    const type = common_vendor.ref("");
    const type_id = common_vendor.ref(null);
    const apply_user = common_vendor.ref("");
    const apply_phone = common_vendor.ref("");
    const apply_address = common_vendor.ref("");
    const other_user = common_vendor.ref("");
    const other_phone = common_vendor.ref("");
    const other_address = common_vendor.ref("");
    const text = common_vendor.ref("");
    const suqiu = common_vendor.ref("");
    const category_list = common_vendor.ref([]);
    const fileList1 = common_vendor.ref([]);
    const data_img_list = common_vendor.ref([]);
    common_vendor.onLoad(() => {
      get_type_func();
    });
    const submit_func = () => {
      if (fileList1.value.length === 0 || !type.value || !apply_user.value || !apply_phone.value || !apply_address.value || !other_user.value || !other_phone.value || !other_address.value || !text.value || !suqiu.value) {
        return common_vendor.index.showToast({
          duration: 2e3,
          icon: "error",
          title: "请填完整信息"
        });
      }
      common_vendor.index.request({
        url: common_js_settings.base_url + "/get_uuid/",
        method: "GET",
        success: (get_uuid_res) => {
          let uuid = get_uuid_res.data.data.uuid;
          let formData = {
            "data_id": uuid,
            "uuid": common_vendor.index.getStorageSync("uuid"),
            "type_id": type_id.value,
            "apply_user": apply_user.value,
            "apply_phone": apply_phone.value,
            "apply_address": apply_address.value,
            "other_user": other_user.value,
            "other_phone": other_phone.value,
            "other_address": other_address.value,
            "text": text.value,
            "suqiu": suqiu.value
          };
          if (data_img_list.value[0]) {
            common_vendor.index.uploadFile({
              url: common_js_settings.base_url + "/create_jiufen/",
              //仅为示例，非真实的接口地址
              filePath: data_img_list.value[0],
              name: "img",
              formData,
              success: (uploadFileRes0) => {
                if (data_img_list.value[1]) {
                  common_vendor.index.uploadFile({
                    url: common_js_settings.base_url + "/create_jiufen/",
                    //仅为示例，非真实的接口地址
                    filePath: data_img_list.value[1],
                    name: "img1",
                    formData,
                    success: (uploadFileRes1) => {
                      common_vendor.index.__f__(
                        "log",
                        "at pages/sec/tab2.vue:241",
                        "uploadFileRes1",
                        uploadFileRes1.data.data
                      );
                      if (data_img_list.value[2]) {
                        common_vendor.index.uploadFile({
                          url: common_js_settings.base_url + "/create_jiufen/",
                          //仅为示例，非真实的接口地址
                          filePath: data_img_list.value[2],
                          name: "img2",
                          formData,
                          success: (uploadFileRes2) => {
                            console.log(
                              "uploadFileRes2",
                              uploadFileRes2.data
                            );
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
                      } else {
                        common_vendor.index.showToast({
                          duration: 2e3,
                          icon: "success",
                          title: "提交成功"
                        });
                        setTimeout(() => {
                          common_vendor.index.navigateBack();
                        }, 2e3);
                      }
                    }
                  });
                } else {
                  common_vendor.index.showToast({
                    duration: 2e3,
                    icon: "success",
                    title: "提交成功"
                  });
                  setTimeout(() => {
                    common_vendor.index.navigateBack();
                  }, 2e3);
                }
              }
            });
          }
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
        url: common_js_settings.base_url + "/get_jiufentype/",
        method: "GET",
        success: (res) => {
          let nu_list = [
            []
          ];
          category_list.value = nu_list;
          res.data.map((res_item) => {
            category_list.value[0].push(res_item);
          });
        }
      });
    };
    return (_ctx, _cache) => {
      return {
        a: common_vendor.o(($event) => type.value = $event),
        b: common_vendor.p({
          placeholder: "请选择纠纷类型",
          border: "none",
          color: "#8a8a8a",
          modelValue: type.value
        }),
        c: common_vendor.o(($event) => category_show.value = true),
        d: common_vendor.o(($event) => apply_user.value = $event),
        e: common_vendor.p({
          placeholder: "请输入申请人姓名",
          border: "none",
          color: "#8a8a8a",
          modelValue: apply_user.value
        }),
        f: common_vendor.o(($event) => apply_phone.value = $event),
        g: common_vendor.p({
          placeholder: "请输入申请人联系电话",
          border: "none",
          color: "#8a8a8a",
          modelValue: apply_phone.value
        }),
        h: common_vendor.o(($event) => apply_address.value = $event),
        i: common_vendor.p({
          placeholder: "请输入申请人联系地址",
          border: "none",
          color: "#8a8a8a",
          modelValue: apply_address.value
        }),
        j: common_vendor.o(($event) => other_user.value = $event),
        k: common_vendor.p({
          placeholder: "请输入被申请人姓名",
          border: "none",
          color: "#8a8a8a",
          modelValue: other_user.value
        }),
        l: common_vendor.o(($event) => other_phone.value = $event),
        m: common_vendor.p({
          placeholder: "请输入被申请人联系电话",
          border: "none",
          color: "#8a8a8a",
          modelValue: other_phone.value
        }),
        n: common_vendor.o(($event) => other_address.value = $event),
        o: common_vendor.p({
          placeholder: "请输入被申请人联系地址",
          border: "none",
          color: "#8a8a8a",
          modelValue: other_address.value
        }),
        p: common_vendor.o(($event) => text.value = $event),
        q: common_vendor.p({
          border: "none",
          placeholder: "请详细描述纠纷事实与理由",
          modelValue: text.value
        }),
        r: common_vendor.o(($event) => suqiu.value = $event),
        s: common_vendor.p({
          border: "none",
          placeholder: "请说明您的调解诉求",
          modelValue: suqiu.value
        }),
        t: common_vendor.o(afterRead1),
        v: common_vendor.o(deletePic1),
        w: common_vendor.p({
          fileList: fileList1.value,
          previewFullImage: true,
          name: "1",
          multiple: true,
          maxCount: 3
        }),
        x: common_vendor.o(submit_func),
        y: common_vendor.p({
          type: "primary",
          shape: "circle",
          text: "提交"
        }),
        z: common_vendor.o(close_func),
        A: common_vendor.o(close_func),
        B: common_vendor.o(confirm_func),
        C: common_vendor.p({
          show: category_show.value,
          columns: category_list.value,
          keyName: "name",
          closeOnClickOverlay: true
        }),
        D: common_vendor.gei(_ctx, "")
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-11deb66e"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/sec/tab2.js.map
