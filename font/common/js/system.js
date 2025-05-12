export const get_system_width = ()=>{
	// 获取系统宽度信息
	let width = 0
	uni.getSystemInfo({
		success: (res) => {
			console.log('screenWidth: ',res.screenWidth);			
			width = res.screenWidth
		}
	})
	return width
}

export const get_system_height = ()=>{
	// 获取系统高度信息
	let height = 0
	uni.getSystemInfo({
		success: (res) => {
			console.log('windowHeight: ',res.windowHeight);			
			height = res.windowHeight
		}
	})
	return height
}