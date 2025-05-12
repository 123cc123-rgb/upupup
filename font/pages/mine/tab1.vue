<template>
	<view class="container">
		
		<view class="type">
			<view class="type-text">
				创建时间
			</view>
			<view class="type-input">
				<up-input
				    disabled
					border="none"
				    v-model="created_date"
					color="#8a8a8a"
					style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"
				  ></up-input>
			</view>
		</view>
		
	
			<view class="type">
				<view class="type-text">
					异常类型
				</view>
				<view class="type-input">
					<up-input
					    disabled
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
					    disabled
						border="none"
					    v-model="address"
						color="#8a8a8a"
						style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"
					  ></up-input>
				</view>
				
			</view>
			
			<view class="desc">
				
				<view class="desc-text">
					概况
				</view>
				<up-textarea disabled v-model="text" border="none"  style="margin-top: 20rpx;background-color: #ecf0f1;"></up-textarea>
				
			</view>
			<view class="img">
				<view class="img-text">
					
					图片
				</view>
				<view class="img-item">
					<image :src="img" mode="widthFix"></image>
				</view>
			</view>
			
			
			<view class="phone">
				<view class="phone-text">
					联系电话
				</view>
				<view class="phone-input">
					<up-input
						disabled
						border="none"
					    v-model="phone"
						color="#8a8a8a"
						style="background-color: #ecf0f1;height: 6vh;padding-left: 1rem;"
					  ></up-input>
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
	
	// 'type','created_date','img','address','text','phone'
	const type = ref('')
	const address = ref('')
	const created_date = ref('')
	const img = ref('')
	const text = ref('')
	const phone = ref('')
	
	
	onLoad((res)=>{
		
		get_data_func(res.data_id)
	})
	
	
	
	
	
	// 获取数据
	const get_data_func = (id)=>{
		uni.request({
			url:base_url + '/get_yichang_desc?search='+id,
			method:'GET',
			success: (res) => {
				console.log('res: ',res);
				type.value = res.data[0].type
				address.value = res.data[0].address
				created_date.value = res.data[0].created_date
				img.value = res.data[0].img
				text.value = res.data[0].text
				phone.value = res.data[0].phone

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
		.btn{
			width: 94%;
			margin-top: 30rpx;
			margin-left: 3%;
			margin-bottom: 100rpx;
		}
	}

</style>
