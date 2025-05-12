<template>
	<view class="container">
	
			<view class="type">
				<view class="type-text">
					<span style="color: #04c464;padding-right: 10rpx;">|</span>纠纷类型
				</view>
	
	
				<view class="type-text2">
					<span style="color: red;">*</span>纠纷类型
				</view>
	
				<view class="type-input" >
					<up-input disabled border="none" v-model="type" color="#8a8a8a"
						style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
				</view>
			</view>
			
			
			<view class="type">
				<view class="type-text">
					<span style="color: #04c464;padding-right: 10rpx;">|</span>状态
				</view>
				
				
				<view class="type-text2">
					<span style="color: red;">*</span>状态
				</view>
				
				<view class="type-input" >
					<up-input disabled border="none" v-model="state" color="#8a8a8a"
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
					<up-input disabled border="none" v-model="apply_user" color="#8a8a8a"
						style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
				</view>
	
				<view class="type-text2">
					<span style="color: red;">*</span>联系电话
				</view>
	
				<view class="type-input">
					<up-input disabled border="none" v-model="apply_phone" color="#8a8a8a"
						style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
				</view>
	
				<view class="type-text2">
					<span style="color: red;">*</span>联系地址
				</view>
	
				<view class="type-input">
					<up-input disabled border="none" v-model="apply_address" color="#8a8a8a"
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
					<up-input disabled border="none" v-model="other_user" color="#8a8a8a"
						style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
				</view>
	
				<view class="type-text2">
					<span style="color: red;">*</span>联系电话
				</view>
	
				<view class="type-input">
					<up-input disabled border="none" v-model="other_phone" color="#8a8a8a"
						style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
				</view>
	
				<view class="type-text2">
					<span style="color: red;">*</span>联系地址
				</view>
	
				<view class="type-input">
					<up-input disabled border="none" v-model="other_address" color="#8a8a8a"
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
					<up-textarea v-model="text" border="none" disabled
						style="margin-top: 20rpx;background-color: #ecf0f1;"></up-textarea>
				</view>
	
				<view class="type-text2">
					<span style="color: red;">*</span>调解诉求
				</view>
	
				<view class="type-input2">
					<up-textarea v-model="suqiu" border="none" disabled
						style="margin-top: 20rpx;background-color: #ecf0f1;"></up-textarea>
				</view>
	
			</view>

	
			<view class="img">
				<view class="img-text">
	
					<span style="color: #04c464;padding-right: 10rpx;">|</span>证据材料
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
	const apply_user = ref('')
	const apply_phone = ref('')
	const apply_address = ref('')
	const other_user = ref('')
	const other_phone = ref('')
	const other_address = ref('')
	const text = ref('')
	const suqiu = ref('')
	const img = ref('')
	const img1 = ref('')
	const img2 = ref('')
	const state = ref('')
	
	
	
	onLoad((res)=>{
		
		get_data_func(res.data_id)
	})
	
	// 获取数据
	const get_data_func = (id)=>{
		uni.request({
			url:base_url + '/get_jiufen_desc?search='+id,
			method:'GET',
			success: (res) => {
				// console.log('res: ',res);
				type.value = res.data[0].type
				apply_user.value = res.data[0].apply_user
				apply_phone.value = res.data[0].apply_phone
				apply_address.value = res.data[0].apply_address
				other_user.value = res.data[0].other_user
				other_phone.value = res.data[0].other_phone
				other_address.value = res.data[0].other_address
				text.value = res.data[0].text
				suqiu.value = res.data[0].suqiu
				img.value = res.data[0].img
				img1.value = res.data[0].img1
				img2.value = res.data[0].img2
				state.value = res.data[0].state
				
				

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
