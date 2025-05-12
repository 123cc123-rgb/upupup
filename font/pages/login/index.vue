<template>
	<view class="container">
		<view class="logo-img">
			<image src="/static/logo.svg" mode=""></image>
		</view>
		<view class="text1">
			社区安全
		</view>
		<view class="text2">
			共建和谐社区
		</view>
		<view class="btn">
			<button open-type="getPhoneNumber" @getphonenumber="get_user_phone" @click="get_user_phone">微信登录</button>
		</view>
		<view class="text3">
			Copyright © 2024 社区安全
		</view>
	</view>
</template>

<script setup>
	import {
		base_url
	} from '../../common/js/settings.js'
	import {
		ref
	} from 'vue'


	// 获取手机号并登录
	const get_user_phone = (e) => {
		if (e.detail.code) {

			uni.login({
				success: (login_res) => {
					uni.request({
						url: base_url + '/login_by_phone/',
						method: 'POST',
						data: {
							code: e.detail.code,
							code2: login_res.code
						},
						success: (res) => {
							if (res.data.code === 100) {
								uni.setStorageSync('uuid', res.data.data.uuid)
								uni.request({
									url: base_url + '/get_user_info?uuid=' + uni
										.getStorageSync('uuid'),
									method: 'GET',
									success: (res111) => {

										uni.setStorageSync('username', res111.data
											.data.username)
										uni.setStorageSync('avatar', res111.data
											.data.avatar)
											
										uni.setStorageSync('role', res111.data
											.data.role)
											
										uni.setStorageSync('address', res111.data
											.data.address)
											
											
										uni.setStorageSync('phone', res111.data
											.data.phone)

										uni.showToast({
											duration: 2000,
											title: '登录成功',
											icon: 'success'

										})
										setTimeout(() => {
											uni.navigateBack()

										}, 2000)

										return

									}
								})

							}
							if (res.data.code === 500) {
								return uni.showToast({
									duration: 2000,
									title: '登录失败',
									icon: 'error'

								})
							}
						}
					})

				}
			})


		}




	}
</script>

<style lang="scss" scoped>
	.container {
		width: 100%;
		height: 100vh;
		display: flex;
		flex-direction: column;
		position: relative;

		.logo-img {
			width: 25%;
			aspect-ratio: 1;
			margin-left: 37.5%;
			margin-top: 12vh;

			image {
				width: 100%;
				height: 100%;
			}
		}

		.text1 {
			width: 100%;
			text-align: center;
			margin-top: 50rpx;
			font-size: 1.3rem;
			font-weight: bold;

		}

		.text2 {
			width: 100%;
			text-align: center;
			margin-top: 20rpx;
			color: #8a8a8a;


		}

		.btn {
			width: 40%;
			height: 6vh;
			margin-left: 30%;
			margin-top: 10vh;
			button{
				border-radius: 35rpx;
				background-color: #04c464;
				color: #FFFFFF;
				font-size: 1rem;
			}
		}

		.text3 {
			position: absolute;
			width: 100%;
			text-align: center;
			bottom: 100rpx;
			font-size: 0.75rem;
			color: #8a8a8a;
		}
	}
	button::after{
		border: none;
	}
</style>