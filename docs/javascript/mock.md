# 使用Mock的SOP操作手册：

1. 安装Mock库

在终端中运行以下命令安装Mock库：

```
npm install mockjs --save-dev
```

2. 创建Mock数据

在项目中创建一个mock文件夹，并在其中创建一个mock.js文件。在mock.js文件中，编写Mock数据的代码。例如：

```javascript
const Mock = require('mockjs');

Mock.mock('/api/user', 'get', {
  'name': '@name',
  'age|1-100': 100,
  'color': '@color'
});
```

这段代码将创建一个模拟的API接口，当请求/api/user时，返回一个包含name、age和color属性的JSON对象。

3. 集成Mock数据

在项目中的API请求中，使用Mock数据。例如：

```javascript
import axios from 'axios';
import Mock from 'mockjs';

Mock.mock('/api/user', 'get', {
  'name': '@name',
  'age|1-100': 100,
  'color': '@color'
});

axios.get('/api/user')
  .then(response => {
    console.log(response.data);
  })
  .catch(error => {
    console.log(error);
  });
```

这段代码将使用Mock数据来模拟API请求。当请求/api/user时，将返回一个包含name、age和color属性的JSON对象。

4. 运行Mock数据

在终端中运行以下命令来启动Mock数据：

```
npm run mock
```

这将启动一个本地服务器，以便在开发过程中使用Mock数据。

5. 测试Mock数据

在浏览器中访问Mock数据的API接口，例如：

```
http://localhost:3000/api/user
```

这将返回一个包含name、age和color属性的JSON对象，以验证Mock数据是否正确。

以上就是使用Mock支付的SOP操作手册。