<template>
	<view class="post-container">
		<u--input v-model="postForm.title" placeholder="请输入标题" maxlength="30" border="bottom" clearable></u--input>

		<u--textarea v-model="postForm.content" placeholder="请输入内容" height="400rpx" margin="30rpx 0"
			border="none"></u--textarea>

		<u-button type="primary" text="发布" @click="submitPost"></u-button>
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
	} from '../../common/js/settings.js'

	const postForm = ref({
		title: '',
		content: ''
	})

	const submitPost = () => {
		if (!postForm.value.title.trim()) {
			return uni.showToast({
				title: '请输入标题',
				icon: 'none'
			})
		}
		if (!postForm.value.content.trim()) {
			return uni.showToast({
				title: '请输入内容',
				icon: 'none'
			})
		}

		uni.request({
				url: base_url + '/get_uuid/',
				method: 'GET',
				success: (get_uuid_res) => {
					let uuid = get_uuid_res.data.data.uuid
		
					uni.request({
						url: base_url + '/cerate_talk/',
						method: 'POST',
						data: {
							uuid: uni.getStorageSync('uuid'),
							data_id: uuid,
							title: postForm.value.title,
							content: postForm.value.content,
						},
						success: (res) => {
							console.log('res: ', res);
							uni.showToast({
								duration: 2000,
								icon: 'success',
								title: '发布成功'
							})
							
							setTimeout(() => {
								uni.navigateBack()
							
							}, 2000)
						}
					})
		
				}
		})



		
	}
</script>

<style lang="scss" scoped>
	.post-container {
		padding: 30rpx;
		background-color: white;
		min-height: 100vh;

		u-button {
			margin-top: 60rpx;
		}
	}
</style>