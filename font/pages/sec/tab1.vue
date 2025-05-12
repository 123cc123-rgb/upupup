<template>
	<view class="container">

		<view class="type">
			<view class="type-text">
				异常类型
			</view>
			<view class="type-input" @click="category_show=true">
				<up-input
				    placeholder="请选择异常类型"
					border="none"
				    v-model="type"
					color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"
				  ></up-input>
			</view>
		</view>
		<view class="address">
			<view class="address-text">
				地点
			</view>
			<view class="address-input">
				<up-input
				    placeholder="请输入地址"
					border="none"
				    v-model="address"
					color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"
				  ></up-input>
			</view>
			<view class="address-btn">
				<up-button type="primary" shape="circle" text="点击获取当前地址" @click="get_city_func"></up-button>
			</view>
		</view>
		
		<view class="desc">
			
			<view class="desc-text">
				概况
			</view>
			<up-textarea v-model="text" border="none" placeholder="请描述异常情况" style="margin-top: 20rpx;background-color: #ecf0f1;"></up-textarea>
			
		</view>
		<view class="img">
			<view class="img-text">
				
				图片上传
			</view>
			<up-upload :fileList="fileList1" @afterRead="afterRead1" @delete="deletePic1"
				:previewFullImage="true" name="1" multiple :maxCount="1" style="margin-top: 20rpx;"></up-upload>
		</view>
		
		
		<view class="phone">
			<view class="phone-text">
				联系电话
			</view>
			<view class="phone-input">
				<up-input
				    placeholder="请输入手机号"
					border="none"
				    v-model="phone"
					color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"
				  ></up-input>
			</view>
		</view>
		
		
		<view class="btn">
			<up-button type="primary" shape="circle" text="提交" @click="submit_func"></up-button>
		</view>
		
		

		<up-picker :show="category_show" :columns="category_list" keyName="name" closeOnClickOverlay @close="close_func" @cancel="close_func" @confirm="confirm_func"></up-picker>

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
	const city = ref('')
	const type = ref('')
	const type_id = ref(null)
	const text = ref('')
	const phone = ref('')
	const address = ref('')
	const category_list = ref([])
	const fileList1 = ref([])
	const data_img_list = ref([])
	


	onLoad(() => {
		get_type_func()
	})
	
	
	// 提交
	const submit_func = ()=>{
		if(!fileList1.value[0] || !address.value || !type.value || !text.value || !phone.value ){
			return uni.showToast({
				duration: 2000,
				icon: 'error',
				title: '请填完整信息'
			})
		}
		
		let formData = {
			'uuid': uni.getStorageSync('uuid'),
			'address': address.value,
			'type_id': type_id.value,
			'text': text.value,
			'phone': phone.value,
		}
		console.log('data_img_list: ',data_img_list.value);
		console.log('fileList1: ',fileList1.value);
		
			
		uni.uploadFile({
			url: base_url + '/create_yichang/',
			filePath: data_img_list.value[0],
			name: 'img',
			formData: formData,
			success: (res) => {
				console.log('res: ',res);
				
				uni.showToast({
					duration:2000,
					icon:'success',
					title:'提交成功'
				})
				
				setTimeout(() => {
					uni.navigateBack()
				
				}, 2000)
				
				
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
	const confirm_func = (res)=>{
		type.value = res.value[0].name
		type_id.value = res.value[0].id
		category_show.value = false
		
	}
	
	
	// 关闭
	const close_func = ()=>{
		category_show.value = false
	}
	
	// 获取异常类型
	const get_type_func = () => {
		uni.request({
			url: base_url + '/get_yichangtype/',
			method: 'GET',
			success: (res) => {
				// console.log('res: ',res);
				
				let nu_list = [[],]
				category_list.value = nu_list

				res.data.map((res_item) => {
					category_list.value[0].push(res_item)
				})

				console.log('category_list.value: ', category_list.value);
			}
		})
	}


	// 获取城市
	const get_city_func = () => {


		uni.getLocation({
			type: 'wgs84',
			success: function(res) {
				uni.request({
					url: base_url + '/get_city?longitude=' + res.longitude + '&latitude=' + res
						.latitude + '&uuid=' + uni.getStorageSync('uuid'),
					method: 'GET',
					success: (res) => {
						address.value = res.data.data[1]
						city.value = res.data.data[0]
					}
				})


			}
		});


	}
</script>

<style lang="scss" scoped>
	.container {
		display: flex;
		flex-direction: column;
		width: 100%;
		min-height: 100vh;
		background-color: #ecf0f1;
		.type{
			display: flex;
			flex-direction: column;
			width: 94%;
			margin-left: 3%;
			background-color: #FFFFFF;
			margin-top: 20rpx;
			border-radius: 25rpx;
			padding: 30rpx;
			box-sizing: border-box;
			.type-text{
				font-weight: bold;
			}
			.type-input{
				margin-top: 20rpx;
			}
			
		}
		.address{
			display: flex;
			flex-direction: column;
			width: 94%;
			margin-left: 3%;
			background-color: #FFFFFF;
			margin-top: 20rpx;
			border-radius: 25rpx;
			padding: 30rpx;
			box-sizing: border-box;
			.address-text{
				font-weight: bold;
			}
			.address-input{
				margin-top: 20rpx;
			}
			.address-btn{
				width: 40%;
				margin-top: 20rpx;
				// margin-left: 30%;
				
				height: 3vh;
				margin-bottom: 30rpx;
			}
		}
	
		.desc{
			display: flex;
			flex-direction: column;
			width: 94%;
			margin-left: 3%;
			background-color: #FFFFFF;
			margin-top: 20rpx;
			border-radius: 25rpx;
			padding: 30rpx;
			box-sizing: border-box;
			.desc-text{
				font-weight: bold;
			}
		}
		
		.phone{
			display: flex;
			flex-direction: column;
			width: 94%;
			margin-left: 3%;
			background-color: #FFFFFF;
			margin-top: 20rpx;
			border-radius: 25rpx;
			padding: 30rpx;
			box-sizing: border-box;
			.phone-text{
				font-weight: bold;
			}
			.phone-input{
				margin-top: 20rpx;
			}
		}
		
		.img{
			display: flex;
			flex-direction: column;
			width: 94%;
			margin-left: 3%;
			background-color: #FFFFFF;
			margin-top: 20rpx;
			border-radius: 25rpx;
			padding: 30rpx;
			box-sizing: border-box;
			.img-text{
				font-weight: bold;
			}
		}
		.btn{
			width: 94%;
			margin-top: 30rpx;
			margin-left: 3%;
			margin-bottom: 100rpx;
		}
	}



</style>