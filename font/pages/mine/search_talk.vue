<template>
	<view class="container">
		<up-search v-model="searchKeyword" placeholder="搜索我的帖子" :show-action="false" margin="20rpx 40rpx" height="6vh"
			@search="handleSearch" bgColor="#FFFFFF"></up-search>

		<up-list :preLoadingScreen="10" :height="scrollHeight">
			<up-list-item v-for="post in filteredPosts" :key="post.id">
				<view class="post-card">
					<view class="post-header">
						<text class="post-title">{{ post.title }}</text>
						<text class="post-author">@{{ post.author }}</text>
					</view>
					<view class="post-content">{{ post.content }}</view>

					<!-- 点赞评论区域 -->
					<view class="action-area">
						<view class="like-btn" @click="toggleLike(post.id)">
							<u-icon :name="post.isLiked ? 'heart-fill' : 'heart'"
								:color="post.isLiked ? '#f56c6c' : '#606266'" size="20"></u-icon>
							<text class="like-count">{{ post.likeCount }}</text>
						</view>
					</view>

					<!-- 评论列表 -->
					<view class="comments">
						<view v-for="comment in post.comments" :key="comment.id" class="comment-item">
							<text class="comment-author">@{{ comment.author }}：</text>
							<text class="comment-content">{{ comment.content }}</text>
						</view>

						
					</view>
				</view>
			</up-list-item>
		</up-list>



	</view>
</template>

<script setup>
	import {
		ref,
		computed
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
	
	
	const get_data_func = ()=>{
		uni.request({
			url:base_url + '/get_my_talk?uuid='+uni.getStorageSync('uuid'),
			method:'GET',
			success: (res) => {
				console.log('res: ',res);
				posts.value = res.data.data
			}
		})
	}
	

	// 假数据
	const posts = ref([{
			id: 1,
			title: "小区绿化建议",
			content: "建议在小区东侧增加绿化带",
			author: "居民张",
			likeCount: 15,
			isLiked: false,
			fabu_key:'',
			comments: [{
					id: 1,
					author: "李女士",
					content: "支持这个建议！"
				},
				{
					id: 2,
					author: "王先生",
					content: "需要物业配合"
				}
			]
		},

		{
			id: 3,
			title: "小区绿化建议",
			content: "建议在小区东侧增加绿化带",
			author: "居民张",
			likeCount: 15,
			isLiked: false,
			fabu_key:'',
			comments: [{
					id: 1,
					author: "李女士",
					content: "支持这个建议！"
				},
				{
					id: 2,
					author: "王先生",
					content: "需要物业配合"
				}
			]
		},

		{
			id: 2,
			title: "垃圾分类倡议",
			content: "希望大家做好垃圾分类",
			author: "环保志愿者",
			likeCount: 28,
			isLiked: true,
			fabu_key:'',
			comments: [{
				id: 3,
				author: "陈阿姨",
				content: "每天都有按时分类"
			}]
		}
	])

	// 搜索关键词
	const searchKeyword = ref('')
	// 新评论内容
	const newComment = ref('')
	// 滚动高度
	const scrollHeight = ref(uni.getSystemInfoSync().windowHeight - 100)

	// 过滤后的帖子
	const filteredPosts = computed(() => {
		return posts.value.filter(post => {
			return post.title.includes(searchKeyword.value) ||
				post.content.includes(searchKeyword.value)
		})
	})

	// 点赞/取消点赞
	const toggleLike = (postId) => {
		const post = posts.value.find(p => p.id === postId)
		if (post) {
			post.isLiked = !post.isLiked
			post.likeCount += post.isLiked ? 1 : -1
			
			if(post.isLiked === true){
				uni.request({
					url:base_url+'/add_zan/',
					method:'POST',
					data:{
						uuid:uni.getStorageSync('uuid'),
						data_id:post.data_id
					},
					success: (add_res) => {
						console.log('add_res: ',add_res)
					}
				})
			}else{
				uni.request({
					url:base_url+'/qx_zan/',
					method:'POST',
					data:{
						uuid:uni.getStorageSync('uuid'),
						data_id:post.data_id
					},
					success: (qx_res) => {
						console.log('qx_res: ',qx_res)
					}
				})
			}
			
		}
	}

	// 添加评论
	const addComment = (postId) => {
		const post = posts.value.find(p => p.id === postId)
		  if (post && post.fabu_key.trim()) {
		    post.comments.push({
		      author: uni.getStorageSync('username'),
		      content: post.fabu_key
		    })
		     // 清空当前帖子的输入
			uni.request({
				url: base_url + '/get_uuid/',
				method: 'GET',
				success: (get_uuid_res) => {
					let uuid = get_uuid_res.data.data.uuid
					uni.request({
						url:base_url+'/add_com/',
						data:{
							content:post.fabu_key,
							data_id:uuid,
							id:post.id,
							uuid:uni.getStorageSync('uuid'),
							
						},
						method:'POST',
						success: (res) => {
							console.log('res: ',res);
							post.fabu_key = ''
						}
					})
					
					
					
					}
			})
			
			
			
		  }
	}

	// 跳转到发帖页面
	const navigateToPost = () => {
		uni.navigateTo({
			url: '/pages/thd/fabu'
		})
	}

	// 按钮样式配置
	const pattern = {
		color: '#2979ff',
		backgroundColor: '#fff',
		selectedColor: '#2979ff'
	}
</script>

<style lang="scss" scoped>
	.container {
		background-color: #f5f5f5;
		min-height: 100vh;
		display: flex;
		flex-direction: column;
		position: relative;

	}

	.post-card {
		background: white;
		margin: 20rpx;
		padding: 30rpx;
		border-radius: 16rpx;
		box-shadow: 0 2rpx 12rpx rgba(0, 0, 0, 0.05);
		

		.post-header {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin-bottom: 20rpx;

			.post-title {
				font-size: 32rpx;
				font-weight: bold;
				color: #333;
			}

			.post-author {
				font-size: 24rpx;
				color: #666;
			}
		}

		.post-content {
			font-size: 28rpx;
			color: #444;
			line-height: 1.6;
			margin-bottom: 30rpx;
		}

		.action-area {
			display: flex;
			align-items: center;
			margin: 20rpx 0;

			.like-btn {
				display: flex;
				align-items: center;
				padding: 10rpx 20rpx;
				background-color: #f8f8f8;
				border-radius: 40rpx;

				.like-count {
					margin-left: 10rpx;
					font-size: 26rpx;
					color: #666;
				}
			}
		}

		.comments {
			border-top: 1rpx solid #eee;
			padding-top: 20rpx;

			.comment-item {
				padding: 15rpx 0;
				font-size: 26rpx;

				.comment-author {
					color: #2979ff;
					margin-right: 10rpx;
				}

				.comment-content {
					color: #333;
				}
			}

			.add-comment {
				margin-top: 20rpx;
				background: #f8f8f8;
				border-radius: 40rpx;
				padding: 10rpx 20rpx;
			}
		}
	}
</style>