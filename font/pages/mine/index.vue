<template>
	<view class="container">


		<view class="mine">
			<view class="mine-item">
				<view class="mine-item-img">
					<image :src="avatar" mode=""></image>
				</view>
				<view class="mine-item-desc" v-if="!username">
					未登录
				</view>
				<view class="mine-item-desc" v-if="username">
					
					<view class="">
						{{username}}
					</view>
					<view class="">
						{{role}}
					</view>
					<view class="">
						{{phone}}
					</view>
					
					
					
				</view>
				
				<view class="mine-item-set" @click="nav_to_desc">
					<image src="/static/set.svg" mode=""></image>
				</view>
			</view>
		</view>

		<view class="jifen">
			<up-collapse>
				<up-collapse-item title="我的积分">
					<template #value>
						<text class="jifen-num">{{jifen}}</text>
					</template>
					<view class="data-desc-item" v-for="item in jifen_list">
						
						<view class="text">
							{{item.text}}
						</view>
						<view class="date">
							{{item.created_date}}
						</view>
						
						<view class="jifen">
							{{item.jifen}}
						</view>
					</view>

				</up-collapse-item>

			</up-collapse>
		</view>

		<view class="tab">
			<view class="tab-item" @click="nav_to_talk">
				<view class="tab-item-name">
					我的帖子
				</view>
				<view class="tab-item-icon">
					<up-icon name="arrow-right"></up-icon>
				</view>
			</view>
			<view class="tab-item" @click="nav_to_view(1)">
				<view class="tab-item-name">
					我的上报
				</view>
				<view class="tab-item-icon">
					<up-icon name="arrow-right"></up-icon>
				</view>
			</view>
			<view class="tab-item" @click="nav_to_view(2)">
				<view class="tab-item-name">
					我的调解
				</view>
				<view class="tab-item-icon">
					<up-icon name="arrow-right"></up-icon>
				</view>
			</view>
			<view class="tab-item" @click="nav_to_view(3)">
				<view class="tab-item-name">
					我的投诉
				</view>
				<view class="tab-item-icon">
					<up-icon name="arrow-right"></up-icon>
				</view>
			</view>
		</view>


		<view class="btn">
			<up-button text="退出登录" style="width: 100%;height: 100%;color: red;background-color: #FFFFFF;"
				shape="circle" @click="logout"></up-button>
		</view>




	</view>
</template>

<script setup>
	import {
		ref
	} from 'vue'

	import {
		onLoad,
		onShow
	} from '@dcloudio/uni-app'
	import { base_url } from '../../common/js/settings'


	const username = ref('')
	const role = ref('')
	const phone = ref('')
	const avatar = ref('')
	const jifen = ref(0)
	const jifen_list = ref([])


	onLoad(() => {
		if (uni.getStorageSync('uuid')) {
			get_user_func()
			get_jifen_func()
		}
	})
	onShow(() => {
		if (uni.getStorageSync('uuid')) {
			get_user_func()
			get_jifen_func()
		}
	})
	
	// 转个人资料
	const nav_to_desc = ()=>{
		uni.navigateTo({
			url:'/pages/mine/information'
		})
	}
	
	// 跳转我的帖子
	const nav_to_talk = ()=>{
		uni.navigateTo({
			url:'/pages/mine/search_talk'
		})
	}
	
	// 跳转列表
	const nav_to_view = (res)=>{
		uni.navigateTo({
			url:'/pages/mine/list'+res
		})
	}
	
	
	// 格式化时间
	const formatDate = (dateStr) => {
		const date = new Date(dateStr);
		const year = date.getFullYear();
		const month = String(date.getMonth() + 1).padStart(2, '0');
		const day = String(date.getDate()).padStart(2, '0');
		const hours = String(date.getHours()).padStart(2, '0');
		const minutes = String(date.getMinutes()).padStart(2, '0');
		return `${year}-${month}-${day} ${hours}:${minutes}`;
	}
	

	// 获取用户信息
	const get_user_func = () => {
		uni.request({
			url: base_url + '/get_user_info?uuid=' + uni
				.getStorageSync('uuid'),
			method: 'GET',
			success: (res111) => {

				console.log('res111: ', res111);


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

				username.value = res111.data.data.username
				avatar.value = res111.data.data.avatar
				role.value = res111.data.data.role
				phone.value = res111.data.data.phone

			}
		})

	}
	
	
	// 获取积分
	const get_jifen_func = ()=>{
		uni.request({
			url:base_url + '/get_jifen?uuid='+uni.getStorageSync('uuid'),
			method:'GET',
			success: (res) => {
				// console.log('res: ',res);
				
				jifen.value = res.data.data[0]
				
				
				res.data.data[1].map((res_item)=>{
					res_item.created_date = formatDate(res_item.created_date)
				})
				jifen_list.value = res.data.data[1]
				
			}
		})
	}
	
	
	// 退出登录
	const logout = ()=>{
		uni.removeStorageSync('uuid')
		uni.removeStorageSync('username')
		uni.removeStorageSync('avatar')
		uni.removeStorageSync('role')
		uni.removeStorageSync('address')
		uni.removeStorageSync('phone')
		username.value = ''
		avatar.value = ''
		role.value = ''
		uni.switchTab({
			url:'/pages/index/index'
		})
		
		
	}

</script>

<style lang="scss" scoped>
	.container {
		width: 100%;
		min-height: 100vh;
		display: flex;
		flex-direction: column;
		background-color: #ecf0f1;

		.mine {
			width: 100%;
			height: 20vh;
			background-color: #04c464;
			display: flex;
			flex-direction: column;
			justify-content: center;

			.mine-item {
				height: 10vh;
				// margin-left: 50rpx;
				display: flex;
				flex-direction: row;
				align-items: center;
				width: 94%;
				margin-left: 3%;
				position: relative;

				.mine-item-img {
					height: 10vh;
					width: 10vh;
					border-radius: 50%;

					image {
						width: 100%;
						height: 100%;
						background-color: #FFFFFF;
						border-radius: 50%;
					}
				}

				.mine-item-desc {
					margin-left: 30rpx;
					font-size: 1.2rem;
					color: #FFFFFF;
				}

				.mine-item-set {
					height: 8vh;
					width: 8vh;
					position: absolute;
					right: 10rpx;

					image {
						width: 100%;
						height: 100%;
					}

				}


			}
		}

		.jifen {
			margin-top: 20rpx;
			width: 94%;
			margin-left: 3%;
			background-color: #FFFFFF;
			border-radius: 25rpx;

		}

		.tab {
			width: 94%;
			margin-left: 3%;
			background-color: #FFFFFF;
			display: flex;
			flex-direction: column;
			margin-top: 20rpx;
			border-radius: 25rpx;

			.tab-item {
				width: 92%;
				margin-left: 4%;
				display: flex;
				flex-direction: row;
				justify-content: space-between;
				align-items: center;
				height: 10vh;
				border-bottom: 1rpx solid #ecf0f1;

				.tab-item-name {}

				.tab-item-icon {}
			}
		}

		.btn {
			margin-top: 100rpx;
			width: 40%;
			margin-left: 30%;
			height: 8vh;
			// background-color: #04c464;
		}


	}



	.jifen-num {
		color: #04c464;
		font-size: 1.5rem;

	}
	.data-desc-item{
		display: flex;
		flex-direction: row;
		justify-content: space-around;
		align-items: center;
		margin-top: 5rpx;
		padding: 20rpx;
		width: 100%;
		
		border-bottom: 1rpx solid #ecf0f1;
		.text{
			// font-size: 1.1rem;
			width: 30%;
		}
		.date{
			width: 50%;
			color: #8a8a8a;
			font-size: 0.8rem;
		}
		.jifen{
			width: 10%;
			// height: 100%;
			color: #04c464;
			// background-color: #8a8a8a;
		}
	}
</style>