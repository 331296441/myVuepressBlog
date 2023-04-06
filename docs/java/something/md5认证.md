下面是一个简单的示例，演示如何使用固定字段和时间戳进行 MD5 加解密认证。

1. 创建一个 `AuthUtil` 工具类，用于实现 MD5 加解密认证逻辑。

```java
public class AuthUtil {

    private static final String SECRET_KEY = "your_secret_key";

    public static String generateToken() {
        long timestamp = System.currentTimeMillis() / 1000 / 60;
        String token = SECRET_KEY + timestamp;
        return DigestUtils.md5Hex(token);
    }

    public static boolean verifyToken(String token) {
        long timestamp = System.currentTimeMillis() / 1000 / 60;
        String expectedToken = SECRET_KEY + timestamp;
        String actualToken = DigestUtils.md5Hex(expectedToken);
        return actualToken.equals(token);
    }
}
```

2. 在需要进行认证的接口方法中，生成并返回 MD5 认证令牌。

```java
@RestController
public class UserController {

    @GetMapping("/user/{id}")
    public User getUser(@PathVariable Long id) {
        // 获取用户信息
        User user = userService.getUser(id);
        // 生成 MD5 认证令牌
        String token = AuthUtil.generateToken();
        user.setToken(token);
        return user;
    }
}
```

3. 在需要进行认证的接口方法中，验证 MD5 认证令牌是否正确。

```java
@RestController
public class UserController {

    @GetMapping("/user/{id}")
    public User getUser(@PathVariable Long id, @RequestParam String token) {
        // 验证 MD5 认证令牌是否正确
        if (!AuthUtil.verifyToken(token)) {
            throw new RuntimeException("认证失败");
        }
        // 获取用户信息
        User user = userService.getUser(id);
        return user;
    }
}
```

这样，当访问 `/user/{id}` 接口时，会先生成 MD5 认证令牌并返回给客户端，客户端再将该令牌作为参数传递给服务器端，服务器端再验证该令牌是否正确。如果令牌正确，则返回用户信息；否则抛出异常。