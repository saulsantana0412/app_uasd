# Mantén las clases y métodos necesarios para Play Core
-keep class com.google.android.play.** { *; }
-dontwarn com.google.android.play.**

# Mantén las anotaciones para evitar problemas con R8
-keep class com.google.errorprone.annotations.** { *; }
-dontwarn com.google.errorprone.annotations.**

# Evita que ProGuard optimice demasiado las clases utilizadas por Flutter
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**
