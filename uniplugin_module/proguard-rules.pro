# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

-keep public class * extends io.dcloud.feature.uniapp.common.UniModule{*;}

# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontpreverify
-verbose
# 抑制警告
-ignorewarnings

#-dontoptimize
#-dontshrink

-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*

-keep public class * extends android.app.Activity
-keep public class * extends android.support.v7.app.AppCompatActivity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.preference.Preferencee

 # 保持 native 方法不被混淆
-keepclasseswithmembernames class * {
    native <methods>;
}

 # 保持自定义控件类不被混淆
-keepclasseswithmembernames class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

# 保持自定义控件类不被混淆
-keepclasseswithmembernames class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

# 保持自定义控件类不被混淆
-keepclassmembers class * extends android.app.Activity {
    public void *(android.view.View);
}
-keepclassmembers class * extends android.support.v7.app.AppCompatActivity {
    public void *(android.view.View);
}

 # 保持枚举 enum 类不被混淆
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

 # 保持 Serializable 不被混淆
-keep public class * implements java.io.Serializable{
    public protected private *;
}

 # 保持 Parcelable 不被混淆
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# 自定义view不被混淆
-keepclassmembers class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}
-keep public class * extends android.view.View{
    *** get*();
    void set*(***);
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

# 避免混淆泛型,保留注解不混淆
-keepattributes Signature,*Annotation*,InnerClasses

-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
-keepclassmembers class * {
   public <init> (org.json.JSONObject);
}
-keep public class **.R$*{
    public static final int *;
}

# AndFix
-keep class * extends java.lang.annotation.Annotation

# support-v4
-dontwarn android.support.v4.**
-keep class android.support.v4.app.** { *; }
-keep interface android.support.v4.app.** { *; }
-keep class android.support.v4.** { *; }

# support-v7
-dontwarn android.support.v7.**
-keep class android.support.v7.internal.** { *; }
-keep interface android.support.v7.internal.** { *; }
-keep class android.support.v7.** { *; }

# webview
-keepclassmembers class fqcn.of.javascript.interface.for.webview {
    public *;
}
-keepclassmembers class * extends android.webkit.webViewClient {
    public void *(android.webkit.WebView, java.lang.String, android.graphics.Bitmap);
    public boolean *(android.webkit.WebView, java.lang.String);
}
-keepclassmembers class * extends android.webkit.webViewClient {
    public void *(android.webkit.webView, jav.lang.String);
}
-keepattributes JavascriptInterface

# bairuitech
-keep class com.bairuitech.** {*;}
-keep class com.bairuitech.anychat.** {*;}
-keep class com.anychat.** {*;}

#Glide
-dontwarn com.bumptech.glide.**
-keep class com.bumptech.glide.**{*;}
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.AppGlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}

# GSON
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.** {*;}
-keep class com.google.gson.stream.** { *; }
-keep class com.google.gson.examples.android.model.** { *; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# OkHttp
-dontwarn com.squareup.okhttp.**
-keep class com.squareup.okhttp.** {*;}
-dontwarn okhttp3.**
-keep class okhttp3.** {*;}
-dontwarn okio.**
-keep class okio.** {*;}
-dontwarn javax.annotation.**
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase

# android-pdf-viewer
-keep class com.shockwave.**
-keep class com.github.barteksc.pdfviewer.** {*;}

# 保持 native 方法不被混淆
-keepclasseswithmembernames class * {
        native <methods>;
}

# 保持 Serializable 不被混淆
-keep public class * implements java.io.Serializable{
        public protected private *;
}

# 保持 Parcelable 不被混淆
-keep class * implements android.os.Parcelable {
        public static final android.os.Parcelable$Creator *;
}

# AnyChat-Live组件
-keep class com.anychat.livedetectsdk.** {*;}
-keep class com.gyf.immersionbar.* {*;}

# immersionbar
-keep class com.gyf.immersionbar.* {*;}



# bugly
-dontwarn com.tencent.bugly.**
-keep public class com.tencent.bugly.**{*;}

