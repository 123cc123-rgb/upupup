"use strict";
const common_vendor = require("../../common/vendor.js");
const common_js_settings = require("../../common/js/settings.js");
if (!Array) {
  const _easycom_up_search2 = common_vendor.resolveComponent("up-search");
  const _easycom_u_icon2 = common_vendor.resolveComponent("u-icon");
  const _easycom_u_input2 = common_vendor.resolveComponent("u-input");
  const _easycom_up_list_item2 = common_vendor.resolveComponent("up-list-item");
  const _easycom_up_list2 = common_vendor.resolveComponent("up-list");
  const _easycom_up_button2 = common_vendor.resolveComponent("up-button");
  (_easycom_up_search2 + _easycom_u_icon2 + _easycom_u_input2 + _easycom_up_list_item2 + _easycom_up_list2 + _easycom_up_button2)();
}
const _easycom_up_search = () => "../../uni_modules/uview-plus/components/u-search/u-search.js";
const _easycom_u_icon = () => "../../uni_modules/uview-plus/components/u-icon/u-icon.js";
const _easycom_u_input = () => "../../uni_modules/uview-plus/components/u-input/u-input.js";
const _easycom_up_list_item = () => "../../uni_modules/uview-plus/components/u-list-item/u-list-item.js";
const _easycom_up_list = () => "../../uni_modules/uview-plus/components/u-list/u-list.js";
const _easycom_up_button = () => "../../uni_modules/uview-plus/components/u-button/u-button.js";
if (!Math) {
  (_easycom_up_search + _easycom_u_icon + _easycom_u_input + _easycom_up_list_item + _easycom_up_list + _easycom_up_button)();
}
const _sfc_main = {
  __name: "index",
  setup(__props) {
    common_vendor.onLoad(() => {
      get_data_func();
    });
    common_vendor.onShow(() => {
      get_data_func();
    });
    const get_data_func = () => {
      common_vendor.index.request({
        url: common_js_settings.base_url + "/get_talk?uuid=" + common_vendor.index.getStorageSync("uuid"),
        method: "GET",
        success: (res) => {
          common_vendor.index.__f__("log", "at pages/thd/index.vue:85", "res: ", res);
          posts.value = res.data.data;
        }
      });
    };
    const posts = common_vendor.ref([
      {
        id: 1,
        title: "小区绿化建议",
        content: "建议在小区东侧增加绿化带",
        author: "居民张",
        likeCount: 15,
        isLiked: false,
        fabu_key: "",
        comments: [
          {
            id: 1,
            author: "李女士",
            content: "支持这个建议！"
          },
          {
            id: 2,
            author: "王先生",
            content: "需要物业配合"
          }
        ]
      },
      {
        id: 3,
        title: "小区绿化建议",
        content: "建议在小区东侧增加绿化带",
        author: "居民张",
        likeCount: 15,
        isLiked: false,
        fabu_key: "",
        comments: [
          {
            id: 1,
            author: "李女士",
            content: "支持这个建议！"
          },
          {
            id: 2,
            author: "王先生",
            content: "需要物业配合"
          }
        ]
      },
      {
        id: 2,
        title: "垃圾分类倡议",
        content: "希望大家做好垃圾分类",
        author: "环保志愿者",
        likeCount: 28,
        isLiked: true,
        fabu_key: "",
        comments: [{
          id: 3,
          author: "陈阿姨",
          content: "每天都有按时分类"
        }]
      }
    ]);
    const searchKeyword = common_vendor.ref("");
    common_vendor.ref("");
    const scrollHeight = common_vendor.ref(common_vendor.index.getSystemInfoSync().windowHeight - 100);
    const filteredPosts = common_vendor.computed(() => {
      return posts.value.filter((post) => {
        return post.title.includes(searchKeyword.value) || post.content.includes(searchKeyword.value);
      });
    });
    const toggleLike = (postId) => {
      const post = posts.value.find((p) => p.id === postId);
      if (post) {
        post.isLiked = !post.isLiked;
        post.likeCount += post.isLiked ? 1 : -1;
        if (post.isLiked === true) {
          common_vendor.index.request({
            url: common_js_settings.base_url + "/add_zan/",
            method: "POST",
            data: {
              uuid: common_vendor.index.getStorageSync("uuid"),
              data_id: post.data_id
            },
            success: (add_res) => {
              common_vendor.index.__f__("log", "at pages/thd/index.vue:182", "add_res: ", add_res);
            }
          });
        } else {
          common_vendor.index.request({
            url: common_js_settings.base_url + "/qx_zan/",
            method: "POST",
            data: {
              uuid: common_vendor.index.getStorageSync("uuid"),
              data_id: post.data_id
            },
            success: (qx_res) => {
              common_vendor.index.__f__("log", "at pages/thd/index.vue:194", "qx_res: ", qx_res);
            }
          });
        }
      }
    };
    const addComment = (postId) => {
      const post = posts.value.find((p) => p.id === postId);
      if (post && post.fabu_key.trim()) {
        post.comments.push({
          author: common_vendor.index.getStorageSync("username"),
          content: post.fabu_key
        });
        common_vendor.index.request({
          url: common_js_settings.base_url + "/get_uuid/",
          method: "GET",
          success: (get_uuid_res) => {
            let uuid = get_uuid_res.data.data.uuid;
            common_vendor.index.request({
              url: common_js_settings.base_url + "/add_com/",
              data: {
                content: post.fabu_key,
                data_id: uuid,
                id: post.id,
                uuid: common_vendor.index.getStorageSync("uuid")
              },
              method: "POST",
              success: (res) => {
                common_vendor.index.__f__("log", "at pages/thd/index.vue:227", "res: ", res);
                post.fabu_key = "";
              }
            });
          }
        });
      }
    };
    const navigateToPost = () => {
      common_vendor.index.navigateTo({
        url: "/pages/thd/fabu"
      });
    };
    return (_ctx, _cache) => {
      return {
        a: common_vendor.o(_ctx.handleSearch),
        b: common_vendor.o(($event) => searchKeyword.value = $event),
        c: common_vendor.p({
          placeholder: "搜索帖子",
          ["show-action"]: false,
          margin: "20rpx 40rpx",
          height: "6vh",
          bgColor: "#FFFFFF",
          modelValue: searchKeyword.value
        }),
        d: common_vendor.f(filteredPosts.value, (post, k0, i0) => {
          return {
            a: common_vendor.t(post.title),
            b: common_vendor.t(post.author),
            c: common_vendor.t(post.content),
            d: "fce2b797-3-" + i0 + "," + ("fce2b797-2-" + i0),
            e: common_vendor.p({
              name: post.isLiked ? "heart-fill" : "heart",
              color: post.isLiked ? "#f56c6c" : "#606266",
              size: "20"
            }),
            f: common_vendor.t(post.likeCount),
            g: common_vendor.o(($event) => toggleLike(post.id), post.id),
            h: common_vendor.f(post.comments, (comment, k1, i1) => {
              return {
                a: common_vendor.t(comment.author),
                b: common_vendor.t(comment.content),
                c: comment.id
              };
            }),
            i: common_vendor.o(($event) => addComment(post.id), post.id),
            j: "fce2b797-4-" + i0 + "," + ("fce2b797-2-" + i0),
            k: common_vendor.o(($event) => post.fabu_key = $event, post.id),
            l: common_vendor.p({
              placeholder: "写评论...",
              border: "none",
              modelValue: post.fabu_key
            }),
            m: post.id,
            n: "fce2b797-2-" + i0 + ",fce2b797-1"
          };
        }),
        e: common_vendor.p({
          preLoadingScreen: 10,
          height: scrollHeight.value
        }),
        f: common_vendor.o(navigateToPost),
        g: common_vendor.p({
          type: "primary",
          icon: "edit-pen",
          shape: "circle"
        }),
        h: common_vendor.gei(_ctx, "")
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-fce2b797"]]);
wx.createPage(MiniProgramPage);
//# sourceMappingURL=../../../.sourcemap/mp-weixin/pages/thd/index.js.map
