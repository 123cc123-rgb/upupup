<template>
	<view class="container">

		<view class="type">
			<view class="type-text">
				<span style="color: #04c464;padding-right: 10rpx;">|</span>纠纷类型
			</view>


			<view class="type-text2">
				<span style="color: red;">*</span>纠纷类型
			</view>

			<view class="type-input" @click="category_show=true">
				<up-input placeholder="请选择纠纷类型" border="none" v-model="type" color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
			</view>
		</view>


		<view class="type">
			<view class="type-text">
				<span style="color: #04c464;padding-right: 10rpx;">|</span>申请人信息
			</view>


			<view class="type-text2">
				<span style="color: red;">*</span>姓名
			</view>

			<view class="type-input">
				<up-input placeholder="请输入申请人姓名" border="none" v-model="apply_user" color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
			</view>

			<view class="type-text2">
				<span style="color: red;">*</span>联系电话
			</view>

			<view class="type-input">
				<up-input placeholder="请输入申请人联系电话" border="none" v-model="apply_phone" color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
			</view>

			<view class="type-text2">
				<span style="color: red;">*</span>联系地址
			</view>

			<view class="type-input">
				<up-input placeholder="请输入申请人联系地址" border="none" v-model="apply_address" color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
			</view>

		</view>


		<view class="type">
			<view class="type-text">
				<span style="color: #04c464;padding-right: 10rpx;">|</span>被申请人信息
			</view>


			<view class="type-text2">
				<span style="color: red;">*</span>姓名
			</view>

			<view class="type-input">
				<up-input placeholder="请输入被申请人姓名" border="none" v-model="other_user" color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
			</view>

			<view class="type-text2">
				<span style="color: red;">*</span>联系电话
			</view>

			<view class="type-input">
				<up-input placeholder="请输入被申请人联系电话" border="none" v-model="other_phone" color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
			</view>

			<view class="type-text2">
				<span style="color: red;">*</span>联系地址
			</view>

			<view class="type-input">
				<up-input placeholder="请输入被申请人联系地址" border="none" v-model="other_address" color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
			</view>

		</view>




		<view class="type">
			<view class="type-text">
				<span style="color: #04c464;padding-right: 10rpx;">|</span>纠纷详情
			</view>




			<view class="type-text2">
				<span style="color: red;">*</span>纠纷事实与理由
			</view>

			<view class="type-input2">
				<up-textarea v-model="text" border="none" placeholder="请详细描述纠纷事实与理由"
					style="margin-top: 20rpx;background-color: #ecf0f1;"></up-textarea>
			</view>

			<view class="type-text2">
				<span style="color: red;">*</span>调解诉求
			</view>

			<view class="type-input2">
				<up-textarea v-model="suqiu" border="none" placeholder="请说明您的调解诉求"
					style="margin-top: 20rpx;background-color: #ecf0f1;"></up-textarea>
			</view>

		</view>







		<view class="img">
			<view class="img-text">

				<span style="color: #04c464;padding-right: 10rpx;">|</span>证据材料
			</view>

			<span style="color: #8a8a8a;font-size: 0.8rem;margin-top: 20rpx;">相关照片或文件</span>

			<up-upload :fileList="fileList1" @afterRead="afterRead1" @delete="deletePic1" :previewFullImage="true"
				name="1" multiple :maxCount="3" style="margin-top: 10rpx;"></up-upload>

			<span style="color: #8a8a8a;font-size: 0.8rem;">可上传相关证据材料的照片，最多三张</span>
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
	const apply_user = ref('')
	const apply_phone = ref('')
	const apply_address = ref('')
	const other_user = ref('')
	const other_phone = ref('')
	const other_address = ref('')
	const text = ref('')
	const suqiu = ref('')

	const category_list = ref([])
	const fileList1 = ref([])
	const data_img_list = ref([])


	onLoad(() => {
		get_type_func()
	})


	// 提交
	const submit_func = () => {

		

		if (fileList1.value.length === 0 || !type.value || !apply_user.value || !apply_phone.value || !apply_address
			.value || !other_user.value || !other_phone.value || !other_address.value || !text.value || !suqiu.value) {
			return uni.showToast({
				duration: 2000,
				icon: 'error',
				title: '请填完整信息'
			})
		}


		uni.request({
			url: base_url + '/get_uuid/',
			method: 'GET',
			success: (get_uuid_res) => {
				let uuid = get_uuid_res.data.data.uuid

				let formData = {
					'data_id': uuid,
					'uuid': uni.getStorageSync('uuid'),
					'type_id': type_id.value,
					'apply_user': apply_user.value,
					'apply_phone': apply_phone.value,
					'apply_address': apply_address.value,
					'other_user': other_user.value,
					'other_phone': other_phone.value,
					'other_address': other_address.value,
					'text': text.value,
					'suqiu': suqiu.value,
					
				}

				if (data_img_list.value[0]) {
					uni.uploadFile({
						url: base_url + '/create_jiufen/', //仅为示例，非真实的接口地址
						filePath: data_img_list.value[0],
						name: 'img',
						formData: formData,
						success: (uploadFileRes0) => {
							if (data_img_list.value[1]) {
								uni.uploadFile({
									url: base_url + '/create_jiufen/', //仅为示例，非真实的接口地址
									filePath: data_img_list.value[1],
									name: 'img1',
									formData: formData,
									success: (uploadFileRes1) => {
										console.log('uploadFileRes1',
											uploadFileRes1.data.data);
										if (data_img_list.value[2]) {
											uni.uploadFile({
												url: base_url +
													'/create_jiufen/', //仅为示例，非真实的接口地址
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
										}else{
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
							}else{
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
			url: base_url + '/get_jiufentype/',
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

			.type-text2 {
				font-size: 0.9rem;
				margin-top: 30rpx;
			}

			.type-input {
				margin-top: 10rpx;
			}

			.type-input2 {}

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

			.img-text {
				font-weight: bold;
			}
		}

		.btn {
			width: 94%;
			margin-top: 30rpx;
			margin-left: 3%;
			margin-bottom: 100rpx;
		}
	}
</style>