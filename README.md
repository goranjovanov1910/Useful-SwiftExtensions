# Useful_SwiftExtensions

Some useful swift extensions for iOS developers.

## String
- `MD5 Hash`
```
  guard let passwordMD5 = password.md5 else {
      print("Can't calculate MD5 of your password")
      return
  } 
```

- `Integer Subscripts`
```
  let str = "Hello, world"
  print(str[...4]) // "Hello"
  print(str[..<5]) // "Hello"
  print(str[7...]) // "world"
  print(str[3...4] + str[2]) // "lol"
```

- `Content Check`
```
  "12345".containsOnlyDigits // true
  "a12345".containsOnlyDigits // false
  "abcde".containsOnlyLetters // true
  "abcde1".containsOnlyLetters // false
  "abcde12345".isAlphanumeric // true
  "abcde.12345".isAlphanumeric // false
  "test@test.com".isValidEmail // true
  "12345".isValidEmail // false
```

- `Parse JSON String`
```
  "{\"name\": \"yurii\"}".m_JSONObject() // ["name": "yurii"]
```

## UIImage
- `applyLightEffect()`
- `applyExtraLightEffect()`
- `applyDarkEffect()`
- `applyTintEffectWithColor()`
- `applyBlurWithRadius()`

## UIColor
- `lighterColor(0.5)`
- `darkerColor(0.5)`
- `UIColor(hex: "#00FF00")`