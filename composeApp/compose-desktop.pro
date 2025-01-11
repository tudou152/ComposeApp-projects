
###################### webview multiplatform #################################
# webview multiplatform
-keep class org.cef.** { *; }
-keep class kotlinx.coroutines.swing.SwingDispatcherFactory
###################### webview multiplatform #################################

###################### file picker #################################
# file picker
-keep class com.sun.jna.** { *; }
-keep class * implements com.sun.jna.** { *; }

###################### file picker #################################

###################### wechat #################################
# wechat
-keep class com.tencent.mm.opensdk.** {
    *;
}

-keep class com.tencent.wxop.** {
    *;
}

-keep class com.tencent.mm.sdk.** {
    *;
}
###################### wechat #################################


###################### kotlinx-serialization #################################

-keep @kotlinx.serialization.Serializable class * {*;}

# Keep `Companion` object fields of serializable classes.
# This avoids serializer lookup through `getDeclaredClasses` as done for named companion objects.
-if @kotlinx.serialization.Serializable class **
-keepclassmembers class <1> {
    static <1>$Companion Companion;
}

# Keep `serializer()` on companion objects (both default and named) of serializable classes.
-if @kotlinx.serialization.Serializable class ** {
    static **$* *;
}
-keepclassmembers class <2>$<3> {
    kotlinx.serialization.KSerializer serializer(...);
}

# Keep `INSTANCE.serializer()` of serializable objects.
-if @kotlinx.serialization.Serializable class ** {
    public static ** INSTANCE;
}
-keepclassmembers class <1> {
    public static <1> INSTANCE;
    kotlinx.serialization.KSerializer serializer(...);
}

# @Serializable and @Polymorphic are used at runtime for polymorphic serialization.
-keepattributes RuntimeVisibleAnnotations,AnnotationDefault

# Don't print notes about potential mistakes or omissions in the configuration for kotlinx-serialization classes
# See also https://github.com/Kotlin/kotlinx.serialization/issues/1900
-dontnote kotlinx.serialization.**

# Serialization core uses `java.lang.ClassValue` for caching inside these specified classes.
# If there is no `java.lang.ClassValue` (for example, in Android), then R8/ProGuard will print a warning.
# However, since in this case they will not be used, we can disable these warnings
-dontwarn kotlinx.serialization.internal.ClassValueReferences

###################### kotlinx-serialization #################################

###################### paging3 #################################
-dontwarn androidx.paging.**
###################### paging3 #################################

# datastore
-keep class androidx.datastore.preferences.** { *; }
-keep class androidx.datastore.core.** { *; }
-keep class okio.** { *; }

-keep class io.ktor.** { *; }
-keep class coil3.** { *; }
-keep class ui.navigation.** { *; }


###################### slf4j #################################
# slf4j
-assumenosideeffects interface org.slf4j.Logger {
public void trace(...);
public void debug(...);
public void info(...);
public void warn(...);
public void error(...);

public boolean isTraceEnabled(...);
public boolean isDebugEnabled(...);
public boolean isWarnEnabled(...);

}

-assumenosideeffects class org.slf4j.LoggerFactory {
public static ** getLogger(...);
}

-dontwarn org.slf4j.**
###################### slf4j #################################

## ktor-apach
-dontwarn org.brotli.dec.BrotliInputStream
-dontwarn org.conscrypt.Conscrypt

-keep class androidx.compose.runtime.** { *; }
-keep class androidx.compose.** { *; }
-keep class kotlinx.coroutines.** { *; }

##
-keep class * extends androidx.room.RoomDatabase
-dontwarn androidx.room.paging.**


-keep class com.crossroad.data.model.** { *; }
-keep class com.crossroad.data.datasource.local.entity.** { *; }
-keep class com.crossroad.data.datasource.datastore.** { *; }
-keep class com.crossroad.data.datasource.remote.model.** { *; }

-keep class com.crossroad.multitimer.data.model.** { *; }
-keep class com.crossroad.user.model.** { *; }
-keep class com.crossroad.timerLogAnalysis.model.** { *; }

# 保留所有被`kotlinx.serialization.Serializable`标记的类
-keep @kotlinx.serialization.Serializable class * { *; }

#korlibs
#-keep class korlibs.** { *; }
#-keep class java.lang.** { *; }
#-keep class kotlin.** { *; }
#-keep class kotlinx.** { *; }
#-keep class kotlinx.coroutines.** { *; }

