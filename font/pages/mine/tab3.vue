<template>
	<view class="container">
	
			<view class="type">
				<view class="type-text">
					投诉类型
				</view>
				<view class="type-input">
					<up-input disabled border="none" v-model="type" color="#8a8a8a"
						style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
				</view>
			</view>
	
	
			<view class="phone">
				<view class="phone-text">
					投诉对象
				</view>
				<view class="phone-input">
					<up-input disabled border="none" v-model="another_user" color="#8a8a8a"
						style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
				</view>
			</view>
	
	
			<view class="desc">
	
				<view class="desc-text">
					事件概况
				</view>
				<up-textarea v-model="text" border="none" disabled
					style="margin-top: 20rpx;background-color: #ecf0f1;"></up-textarea>
	
			</view>
			<view class="img">
				<view class="img-text">
	
					证据材料
				</view>
				<view class="img-item">
					<image :src="img" mode="widthFix"></image>
				</view>
				
				
				<view class="img-item" v-if="img1">
					<image :src="img1" mode="widthFix"></image>
				</view>
				<view class="img-item" v-if="img2">
					<image :src="img2" mode="widthFix"></image>
				</view>
	
				
			</view>
	
	
			<view class="phone">
				<view class="phone-text">
					联系方式
				</view>
				<view class="phone-input">
					<up-input disabled border="none" v-model="phone" color="#8a8a8a"
						style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
				</view>
			</view>
	
	
			<view class="ni">
				<view class="ni-text">
					是否匿名
				</view>
				<view class="ni-btn">
					{{is_ni}}
				</view>
			</view>
	
		</view>
	
</template>

<script setup>
	import {
		ref,
	} from 'vue'
	import {
		onLoad,
		onShow
	} from '@dcloudio/uni-app'
	import {
		base_url
	} from '../../common/js/settings.js'
	
	
	const type = ref('')
	const text = ref('')
	const phone = ref('')
	const another_user = ref('')
	const is_ni = ref(null)
	const img = ref('')
	const img1 = ref('')
	const img2 = ref('')
	
	onLoad((res)=>{
		
		get_data_func(res.data_id)
	})
	
	
	
	
	
	// 获取数据
	const get_data_func = (id)=>{
		uni.request({
			url:base_url + '/get_tousu_desc?search='+id,
			method:'GET',
			success: (res) => {
				console.log('res: ',res);
				img.value = res.data[0].img
				img1.value = res.data[0].img1
				img2.value = res.data[0].img2
				type.value = res.data[0].type
				text.value = res.data[0].text
				phone.value = res.data[0].phone
				another_user.value = res.data[0].another_user
				is_ni.value = res.data[0].is_ni
				

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
			.img-text {
				font-weight: bold;
			}
			
			.img-item{
				width: 100%;
				// aspect-ratio: 1/1;
				// height: 8vh;
				margin-top: 20rpx;
				image{
					width: 100%;
					height: 100%;
				}
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
