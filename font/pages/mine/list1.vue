<template>
	<view class="container">
		<view class="data-item" v-for="item in data_list" @click="nav_to_desc(item.id)">
			<view class="">
				{{item.type}}
			</view>
			<view class="">
				{{item.created_date}}
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
	
	onLoad(()=>{
		get_data_func()
	})
	onShow(()=>{
		get_data_func()
	})
	
	
	const data_list = ref([])
	
	
	
	// 跳转详情
	const nav_to_desc = (id)=>{
		uni.navigateTo({
			url:'/pages/mine/tab1?data_id='+id
		})
	}
	
	// 获取数据列表
	const get_data_func = ()=>{
		uni.request({
			url:base_url + '/get_yichang_list?search='+uni.getStorageSync('uuid'),
			method:'GET',
			success: (res) => {
				// console.log('res: ',res);
				data_list.value = res.data
			}
		})
	}
	
	
	
	
	
</script>

<style lang="scss" scoped>
.container{
	width: 100%;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	background-color: #ecf0f1;
	
	.data-item{
		width: 94%;
		margin-left: 3%;
		height: 8vh;
		border-radius: 25rpx;
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: space-between;
		padding: 30rpx;
		box-sizing: border-box;
		background-color: #FFFFFF;
		margin-top: 30rpx;
	}
}
</style>
