# SpringBoot

# 其他零散知识



# 一些小工具方法

## json处理

`{"name":"key","value":"value"}` 处理为 `{"key":"value"}`

``` java
/**
     * array处理为map
     *
     * @param jsonArray
     * @return
     */
    private static Map<String, String> arrayToMap(JSONArray jsonArray) {
        Map<String, String> map = new HashMap<>();
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            map.put(jsonObject.getString("name"), jsonObject.getString("value"));
        }
        return map;
    }
```

``` java
/**
     * 处理array
     *
     * @param jsonArray
     * @return
     */
    private static JSONArray arrayToArray(JSONArray jsonArray) {
        JSONArray resultArray = new JSONArray();
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put(jsonArray.getJSONObject(i).getString("name"), jsonArray.getJSONObject(i).getString("value"));
            resultArray.add(jsonObject);
        }
        return resultArray;
    }
```


## ResultSet转为Json
可以使用 FastJSON 库将 `ResultSet` 转换为 JSON 格式。以下是一个示例代码，演示如何使用 FastJSON 将查询结果转换为 JSON 格式：

```java
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.sql.*;

public class ResultSetToJson {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/mydatabase";
        String user = "myuser";
        String password = "mypassword";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            try (Statement stmt = conn.createStatement()) {
                ResultSet rs = stmt.executeQuery("SELECT * FROM users");
                JSONArray jsonArray = new JSONArray();
                ResultSetMetaData metaData = rs.getMetaData();
                int columnCount = metaData.getColumnCount();
                while (rs.next()) {
                    JSONObject jsonObject = new JSONObject(true);
                    for (int i = 1; i <= columnCount; i++) {
                        String columnName = metaData.getColumnLabel(i);
                        Object value = rs.getObject(i);
                        jsonObject.put(columnName, value);
                    }
                    jsonArray.add(jsonObject);
                }
                String jsonString = jsonArray.toJSONString(SerializerFeature.PrettyFormat);
                System.out.println(jsonString);
            }
        } catch (SQLException e) {
            System.err.println("数据库错误：" + e.getMessage());
        }
    }
}
```

在上面的代码中，我们使用 FastJSON 库将查询结果转换为 JSON 格式。我们使用 `JSONArray` 类来创建一个 JSON 数组，然后使用 `ResultSetMetaData` 类获取查询结果的元数据，包括列名和列数。在循环中，我们使用 `JSONObject` 类创建一个 JSON 对象，然后将每个列名和对应的值添加到该对象中。最后，我们将该对象添加到 JSON 数组中，并使用 `jsonArray.toJSONString(SerializerFeature.PrettyFormat)` 方法将 JSON 数组转换为字符串。`SerializerFeature.PrettyFormat` 参数用于格式化输出 JSON 字符串，以便更容易阅读。