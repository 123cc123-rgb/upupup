<template>
	<view class="container">
		<view class="banner-view">
			<up-swiper :list="banner_list" keyName="img" height="30vh"></up-swiper>
		</view>

		<view class="data-item" v-for="(value,key,index) in data_list">
			<up-collapse>
				<up-collapse-item :title="key">
					<view class="data-desc-item" v-for="item in value" @click="nav_to_desc(item.id)">
						
						<view class="data-desc-item-title">
							{{item.title}}
						</view>
						<view class="">
							{{item.created_date}}
						</view>
					</view>
				</up-collapse-item>

			</up-collapse>
		</view>





	</view>
</template>

<script setup>
	import {
		ref
	} from 'vue'
	import {
		onShow,
		onLoad
	} from '@dcloudio/uni-app'
	import {
		base_url
	} from '../../common/js/settings.js'


	onLoad(() => {
		if (!uni.getStorageSync('uuid')) {
			uni.navigateTo({
				url: '/pages/login/index'
			})
		} else {
			get_banner_func()
			get_data_func()
		}
	})
	
	onShow(()=>{
		if (!uni.getStorageSync('uuid')) {
			uni.navigateTo({
				url: '/pages/login/index'
			})
		} else {
			get_banner_func()
			get_data_func()
		}
	})
	
	
	const nav_to_desc = (id)=>{
		uni.navigateTo({
			url:'/pages/index/desc?id='+id
		})
	}
	


	const banner_list = ref([])
	const data_list = ref([])




	// 获取banner
	const get_banner_func = () => {
		uni.request({
			url: base_url + '/get_banner/',
			method: 'GET',
			success: (res) => {
				// console.log('res: ',res);

				banner_list.value = res.data

			}
		})
	}


	// 获取首页数据
	const get_data_func = () => {
		uni.request({
			url: base_url + '/get_index_data/',
			method: 'GET',
			success: (res) => {
				// console.log('res: ', res);

				data_list.value = res.data.data

			}
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

		.banner-view {
			width: 94%;
			margin-left: 3%;
			height: 30vh;
		}
		
		.data-item{
			width: 94%;
			margin-left: 3%;
			margin-top: 20rpx;
			
			background-color: #FFFFFF;
		}
	}
	
	.data-desc-item{
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		margin-top: 5rpx;
		padding: 20rpx;
		border-bottom: 1rpx solid #ecf0f1;
		.data-desc-item-title{
			max-width: 60%;
			white-space: nowrap;
						overflow: hidden;
						text-overflow: ellipsis;
		}
	}
</style>