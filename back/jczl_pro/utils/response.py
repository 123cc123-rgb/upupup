from rest_framework.response import Response

# 自定义API响应类，统一返回格式
class ApiResponse(Response):
    def __init__(self, code=100, msg='成功', status=200, headers=None, **kwargs):
        data = {'code': code, 'msg': msg}

        if kwargs:
            data.update(kwargs)
        super().__init__(data=data, status=status, headers=headers)
