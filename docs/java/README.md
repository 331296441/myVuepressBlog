# SpringBoot

# 其他零散知识



# 一些小工具方法

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