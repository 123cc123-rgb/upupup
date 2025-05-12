<template>
	<view class="container">




		<view class="type">
			<view class="type-text">
				昵称
			</view>
			<view class="type-input">
				<up-input disabled border="none" v-model="username" color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
			</view>
		</view>
		<view class="type">
			<view class="type-text">
				身份
			</view>
			<view class="type-input">
				<up-input disabled border="none" v-model="role" color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
			</view>
		</view>

		<view class="type">
			<view class="type-text">
				手机号
			</view>
			<view class="type-input">
				<up-input disabled border="none" v-model="phone" color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"></up-input>
			</view>
		</view>




		<view class="type">

			<view class="type-text">
				地址
			</view>
			<up-textarea disabled v-model="address" border="none"
				style="margin-top: 20rpx;background-color: #ecf0f1;"></up-textarea>

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

	const username = ref('')
	const address = ref('')
	const phone = ref('')
	const role = ref('')


	onLoad((res) => {
		username.value = uni.getStorageSync('username')
		role.value = uni.getStorageSync('role')
		address.value = uni.getStorageSync('address')
		phone.value = uni.getStorageSync('phone')

	})
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

			.img-item {
				width: 100%;
				margin-top: 20rpx;

				image {
					width: 100%;
					height: 100%;
				}
			}

		}

	}
</style>