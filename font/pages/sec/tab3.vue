<template>
	<view class="container">

		<view class="type">
			<view class="type-text">
				投诉类型
			</view>
			<view class="type-input" @click="category_show=true">
				<up-input placeholder="请选择投诉类型" border="none" v-model="type" color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
			</view>
		</view>


		<view class="phone">
			<view class="phone-text">
				投诉对象
			</view>
			<view class="phone-input">
				<up-input placeholder="请输入投诉对象(人员/部门/单位)" border="none" v-model="another_user" color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
			</view>
		</view>


		<view class="desc">

			<view class="desc-text">
				事件概况
			</view>
			<up-textarea v-model="text" border="none" placeholder="请详细描述投诉事件的具体情况"
				style="margin-top: 20rpx;background-color: #ecf0f1;"></up-textarea>

		</view>
		<view class="img">
			<view class="img-text">

				证据材料
			</view>
			<up-upload :fileList="fileList1" @afterRead="afterRead1" @delete="deletePic1" :previewFullImage="true"
				name="1" multiple :maxCount="3"></up-upload>

			<span style="color: #8a8a8a;font-size: 0.8rem;">可上传相关证据材料的照片，最多三张</span>
		</view>


		<view class="phone">
			<view class="phone-text">
				联系方式
			</view>
			<view class="phone-input">
				<up-input placeholder="请输入手机号" border="none" v-model="phone" color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
			</view>
		</view>


		<view class="ni">
			<view class="ni-text">
				是否匿名
			</view>
			<view class="ni-btn">
				<up-switch v-model="is_ni" @change="change"></up-switch>
				选择匿名后，您的个人信息将不会被投诉对象看到
			</view>
		</view>



		<view class="btn">
			<up-button type="primary" shape="circle" text="提交" @click="submit_func"></up-button>
		</view>


		<up-picker :show="category_show" :columns="category_list" keyName="name" closeOnClickOverlay @close="close_func"
			@cancel="close_func" @confirm="confirm_func"></up-picker>

	</view>
</template>

<script setup>
	import {
		ref,
		reactive
	} from 'vue'
	import {
		onLoad,
		onShow
	} from '@dcloudio/uni-app'
	import {
		base_url
	} from '../../common/js/settings.js'


	const category_show = ref(false)
	const type = ref('')
	const type_id = ref(null)
	const text = ref('')
	const phone = ref('')
	const another_user = ref('')
	const is_ni = ref(false)
	const category_list = ref([])
	const fileList1 = ref([])
	const data_img_list = ref([])


	const re_bool = ref(0)

	// fileList1.value.length === 0


	onLoad(() => {
		get_type_func()
	})


	const change = (e) => {
		console.log('change', e);
		if (e === false) {
			re_bool.value = 0
		} else {
			re_bool.value = 1
		}

	}


	// 提交
	const submit_func = () => {

		console.log('is_ni.value: ', is_ni.value);

		if (fileList1.value.length === 0 || !another_user.value || !type.value || !text.value || !phone.value) {
			return uni.showToast({
				duration: 2000,
				icon: 'error',
				title: '请填完整信息'
			})
		}


		// console.log('data_img_list: ', data_img_list.value);
		// console.log('fileList1: ', fileList1.value);

		uni.request({
			url: base_url + '/get_uuid/',
			method: 'GET',
			success: (get_uuid_res) => {
				let uuid = get_uuid_res.data.data.uuid

				let formData = {
					'data_id': uuid,
					'uuid': uni.getStorageSync('uuid'),
					'type_id': type_id.value,
					'text': text.value,
					'another_user': another_user.value,
					'is_ni': re_bool.value,
					'phone': phone.value,
				}

				if (data_img_list.value[0]) {
					uni.uploadFile({
						url: base_url + '/create_tousu/', //仅为示例，非真实的接口地址
						filePath: data_img_list.value[0],
						name: 'img',
						formData: formData,
						success: (uploadFileRes0) => {
							if (data_img_list.value[1]) {
								uni.uploadFile({
									url: base_url + '/create_tousu/', //仅为示例，非真实的接口地址
									filePath: data_img_list.value[1],
									name: 'img1',
									formData: formData,
									success: (uploadFileRes1) => {
										console.log('uploadFileRes1',
											uploadFileRes1.data.data);
										if (data_img_list.value[2]) {
											uni.uploadFile({
												url: base_url +
													'/create_tousu/', //仅为示例，非真实的接口地址
												filePath: data_img_list
													.value[2],
												name: 'img2',
												formData: formData,
												success: (
													uploadFileRes2
												) => {
													console
														.log(
															'uploadFileRes2',
															uploadFileRes2
															.data
														);

													uni.showToast({
														duration: 2000,
														icon: 'success',
														title: '提交成功'
													})

													setTimeout(() => {
														uni.navigateBack()

													}, 2000)

												}
											});
										} else {
											uni.showToast({
												duration: 2000,
												icon: 'success',
												title: '提交成功'
											})

											setTimeout(() => {
												uni.navigateBack()

											}, 2000)
										}



									}
								});
							} else {
								uni.showToast({
									duration: 2000,
									icon: 'success',
									title: '提交成功'
								})

								setTimeout(() => {
									uni.navigateBack()

								}, 2000)
							}







						}
					});
				}



			}
		})






	}


	// 删除图片
	const deletePic1 = (event) => {
		fileList1.value.splice(event.index, 1);
	}
	// 新增图片
	const afterRead1 = async (event) => {
		// 当设置 mutiple 为 true 时, file 为数组格式，否则为对象格式
		let lists = [].concat(event.file);
		let fileListLen = fileList1.value.length;
		lists.map((item) => {
			fileList1.value.push({
				...item,
			});

			data_img_list.value.push(item.url)
		});
		for (let i = 0; i < lists.length; i++) {
			let item = fileList1.value[fileListLen];
			fileList1.value.splice(fileListLen, 1, {
				...item,
				status: 'success',
			});
			fileListLen++;
		}
	}


	// 确认选择
	const confirm_func = (res) => {
		// console.log('res: ',res.value[0]);
		// console.log('res: ',res.value[0].id);
		type.value = res.value[0].name
		type_id.value = res.value[0].id
		category_show.value = false

	}


	// 关闭
	const close_func = () => {
		category_show.value = false
	}

	// 类型
	const get_type_func = () => {
		uni.request({
			url: base_url + '/get_tousutype/',
			method: 'GET',
			success: (res) => {
				// console.log('res: ',res);

				let nu_list = [
					[],
				]
				category_list.value = nu_list

				res.data.map((res_item) => {
					category_list.value[0].push(res_item)
				})

				// console.log('category_list.value: ', category_list.value);
			}
		})
	}
</script>

<style lang="scss" scoped>
	.container {
		display: flex;
		flex-direction: column;
		width: 100%;
		min-height: 100vh;
		background-color: #ecf0f1;

		.type {
			display: flex;
			flex-direction: column;
			width: 94%;
			margin-left: 3%;
			background-color: #FFFFFF;
			margin-top: 20rpx;
			border-radius: 25rpx;
			padding: 30rpx;
			box-sizing: border-box;

			.type-text {
				font-weight: bold;
			}

			.type-input {
				margin-top: 20rpx;
			}

		}

		.desc {
			display: flex;
			flex-direction: column;
			width: 94%;
			margin-left: 3%;
			background-color: #FFFFFF;
			margin-top: 20rpx;
			border-radius: 25rpx;
			padding: 30rpx;
			box-sizing: border-box;

			.desc-text {
				font-weight: bold;
			}
		}

		.phone {
			display: flex;
			flex-direction: column;
			width: 94%;
			margin-left: 3%;
			background-color: #FFFFFF;
			margin-top: 20rpx;
			border-radius: 25rpx;
			padding: 30rpx;
			box-sizing: border-box;

			.phone-text {
				font-weight: bold;
			}

			.phone-input {
				margin-top: 20rpx;
			}
		}


		.ni {
			display: flex;
			flex-direction: column;
			width: 94%;
			margin-left: 3%;
			background-color: #FFFFFF;
			margin-top: 20rpx;
			border-radius: 25rpx;
			padding: 30rpx;
			box-sizing: border-box;

			.ni-text {
				font-weight: bold;
			}

			.ni-btn {
				margin-top: 20rpx;
				display: flex;
				flex-direction: row;
				font-size: 0.8rem;
				color: #8a8a8a;
				align-items: center;


			}
		}

		.img {
			display: flex;
			flex-direction: column;
			width: 94%;
			margin-left: 3%;
			background-color: #FFFFFF;
			margin-top: 20rpx;
			border-radius: 25rpx;
			padding: 30rpx;
			box-sizing: border-box;
		}

		.btn {
			width: 94%;
			margin-top: 30rpx;
			margin-left: 3%;
			margin-bottom: 100rpx;
		}
	}
</style>