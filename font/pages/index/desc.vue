<template>
	<view class="container">
		<view class="title">
			{{title}}
		</view>
		<view class="date">
			发表时间：{{created_date}}
		</view>
		<view class="img">
			<image :src="img" mode="widthFix"></image>
		</view>
		<view class="tip">
			<span style="color: #1cc46c;">|</span>文章内容
		</view>
		<view class="text">
			{{text}}
		</view>
	</view>
</template>

<script setup>
	import {
		ref
	} from 'vue'
	import {
		onLoad
	} from '@dcloudio/uni-app'
	import {
		base_url
	} from '../../common/js/settings'

	const title = ref('')
	const created_date = ref('')
	const text = ref('')
	const img = ref('')

	onLoad((res) => {
		get_data_desc_func(res.id)
	})

	const get_data_desc_func = (id) => {
		uni.request({
			url: base_url + '/get_tuwen_desc?search=' + id,
			method: 'GET',
			success: (res) => {
				console.log('res: ', res.data[0].created_date);
				title.value = res.data[0].title
				img.value = res.data[0].img
				text.value = res.data[0].text
				created_date.value = res.data[0].created_date
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

		background-color: #ffffff;

		.title {
			width: 80%;
			margin-left: 10%;
			text-align: center;
			font-size: 1.5rem;
			margin-top: 5vh;
			white-space: nowrap;
			height: auto;
			word-wrap: break-word;
			word-break: break-all;
			white-space: pre-line;
		}
		
		.date{
			width: 100%;
			margin-top: 2vh;
			color: #8a8a8a;
			font-size: 0.9rem;
			text-align: center;
		}
		.img{
			margin-top: 3vh;
			width: 94%;
			margin-left: 3%;
			image{
				width: 100%;
				height: 100%;
			}
		}
		.tip{
			margin-top: 3vh;
			width: 94%;
			margin-left: 3%;
			font-size: 1.2rem;
			font-weight: bold;
		}
		.text{
			margin-top: 3vh;
			width: 94%;
			margin-left: 3%;
			text-indent: 1rem;
		}
	}
</style>