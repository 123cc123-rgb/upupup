<template>
	<view class="container">
		<view class="text1">
			群防群治
		</view>
		<view class="text2">
			矛盾不上交 平安不出事 服务不缺位
		</view>
		
		
		<view class="data-item" @click="nav_to_tab1">
			<view class="data-item-left">
				<view class="data-item-left-text1">
					异常预警
				</view>
				<view class="data-item-left-text2">
					发现异常情况及时报告
				</view>
			</view>
			<up-icon name="arrow-right" size="1.4rem" style="margin-right: 20rpx;"></up-icon>
		</view>
		<view class="data-item" @click="nav_to_tab2">
			<view class="data-item-left">
				<view class="data-item-left-text1">
					调解申请
				</view>
				<view class="data-item-left-text2">
					邻里纠纷调节服务
				</view>
			</view>
			<up-icon name="arrow-right" size="1.4rem" style="margin-right: 20rpx;"></up-icon>
		</view>
		<view class="data-item" @click="nav_to_tab3">
			<view class="data-item-left">
				<view class="data-item-left-text1">
					投诉监督
				</view>
				<view class="data-item-left-text2">
					问题投诉与监督
				</view>
			</view>
			<up-icon name="arrow-right" size="1.4rem" style="margin-right: 20rpx;"></up-icon>
		</view>
		
	</view>
</template>

<script setup>
	import {ref} from 'vue'
	import {onLoad,onShow} from '@dcloudio/uni-app'
	
	const nav_to_tab1 = ()=>{
		uni.navigateTo({
			url:'/pages/sec/tab1'
		})

	}
	
	const nav_to_tab2 = ()=>{
		uni.navigateTo({
			url:'/pages/sec/tab2'
		})

	}
	
	const nav_to_tab3 = ()=>{
		uni.navigateTo({
			url:'/pages/sec/tab3'
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
		
		.text1{
			width: 100%;
			text-align: center;
			font-size: 1.2rem;
			margin-top: 20rpx;
			font-weight: bold;
		}
		.text2{
			width: 100%;
			text-align: center;
			font-size: 0.8rem;
			margin-top: 20rpx;
			color: #8a8a8a;
			// font-weight: bold;
		}
		
		.data-item{
			display: flex;
			flex-direction: row;
			justify-content: space-between;
			background-color: #FFFFFF;
			width: 94%;
			margin-left: 3%;
			margin-top: 30rpx;
			height: 12vh;
			.data-item-left{
				margin-left: 30rpx;
				display: flex;
				flex-direction: column;
				justify-content: center;
				.data-item-left-text1{
					font-size: 1.2rem;
					font-weight: bold;
				}
				.data-item-left-text2{
					color: #8a8a8a;
					font-size: 0.8rem;
				}
			}
		}
		
	}
</style>
