.class public final Lcom/upsight/android/Upsight;
.super Ljava/lang/Object;
.source "Upsight.java"


# static fields
.field private static final CORE_COMPONENT_FACTORY:Ljava/lang/String; = "com.upsight.core"

.field private static final EXTENSION_PREFIX:Ljava/lang/String; = "com.upsight.extension."

.field public static final LOG_TAG:Ljava/lang/String; = "Upsight"

.field private static final MIN_ANDROID_API_LEVEL:I = 0xe

.field private static sUpsight:Lcom/upsight/android/UpsightContext;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static create(Landroid/content/Context;)Lcom/upsight/android/UpsightContext;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 72
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-ge v3, v4, :cond_c

    .line 73
    new-instance v2, Lcom/upsight/android/UpsightContextCompat;

    invoke-direct {v2, p0}, Lcom/upsight/android/UpsightContextCompat;-><init>(Landroid/content/Context;)V

    .line 86
    :goto_b
    return-object v2

    .line 77
    :cond_c
    invoke-static {p0}, Lcom/upsight/android/Upsight;->loadCoreComponent(Landroid/content/Context;)Lcom/upsight/android/UpsightCoreComponent;

    move-result-object v0

    .line 80
    .local v0, "component":Lcom/upsight/android/UpsightCoreComponent;
    invoke-static {p0}, Lcom/upsight/android/Upsight;->loadExtensions(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    .line 83
    .local v1, "extensions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/upsight/android/UpsightExtension;>;"
    invoke-interface {v0}, Lcom/upsight/android/UpsightCoreComponent;->upsightContext()Lcom/upsight/android/UpsightContext;

    move-result-object v2

    .line 84
    .local v2, "upsight":Lcom/upsight/android/UpsightContext;
    invoke-virtual {v2, v0, v1}, Lcom/upsight/android/UpsightContext;->onCreate(Lcom/upsight/android/UpsightCoreComponent;Ljava/util/Map;)V

    goto :goto_b
.end method

.method public static declared-synchronized createContext(Landroid/content/Context;)Lcom/upsight/android/UpsightContext;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    const-class v1, Lcom/upsight/android/Upsight;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/upsight/android/Upsight;->sUpsight:Lcom/upsight/android/UpsightContext;

    if-nez v0, :cond_d

    .line 59
    invoke-static {p0}, Lcom/upsight/android/Upsight;->create(Landroid/content/Context;)Lcom/upsight/android/UpsightContext;

    move-result-object v0

    sput-object v0, Lcom/upsight/android/Upsight;->sUpsight:Lcom/upsight/android/UpsightContext;

    .line 61
    :cond_d
    sget-object v0, Lcom/upsight/android/Upsight;->sUpsight:Lcom/upsight/android/UpsightContext;
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_11

    monitor-exit v1

    return-object v0

    .line 58
    :catchall_11
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static loadCoreComponent(Landroid/content/Context;)Lcom/upsight/android/UpsightCoreComponent;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 100
    const-string v3, "com.upsight.core"

    invoke-static {p0, v3}, Lcom/upsight/android/Upsight;->loadMetadataByName(Landroid/content/Context;Ljava/lang/String;)Landroid/util/Pair;

    move-result-object v2

    .line 101
    .local v2, "entry":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v2, :cond_63

    .line 103
    :try_start_8
    iget-object v3, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 104
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v3, Lcom/upsight/android/UpsightCoreComponent$Factory;

    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_42

    .line 105
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Class %s must implement %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 106
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Lcom/upsight/android/UpsightCoreComponent$Factory;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    .line 105
    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_37
    .catch Ljava/lang/ClassNotFoundException; {:try_start_8 .. :try_end_37} :catch_37
    .catch Ljava/lang/InstantiationException; {:try_start_8 .. :try_end_37} :catch_4d
    .catch Ljava/lang/IllegalAccessException; {:try_start_8 .. :try_end_37} :catch_58

    .line 110
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_37
    move-exception v1

    .line 111
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 109
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_42
    :try_start_42
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/upsight/android/UpsightCoreComponent$Factory;

    invoke-interface {v3, p0}, Lcom/upsight/android/UpsightCoreComponent$Factory;->create(Landroid/content/Context;)Lcom/upsight/android/UpsightCoreComponent;
    :try_end_4b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_42 .. :try_end_4b} :catch_37
    .catch Ljava/lang/InstantiationException; {:try_start_42 .. :try_end_4b} :catch_4d
    .catch Ljava/lang/IllegalAccessException; {:try_start_42 .. :try_end_4b} :catch_58

    move-result-object v3

    .line 118
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_4c
    return-object v3

    .line 112
    :catch_4d
    move-exception v1

    .line 113
    .local v1, "e":Ljava/lang/InstantiationException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-virtual {v1}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 114
    .end local v1    # "e":Ljava/lang/InstantiationException;
    :catch_58
    move-exception v1

    .line 115
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 118
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :cond_63
    const/4 v3, 0x0

    goto :goto_4c
.end method

.method private static loadExtensions(Landroid/content/Context;)Ljava/util/Map;
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/upsight/android/UpsightExtension;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 130
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 131
    .local v4, "extensions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/upsight/android/UpsightExtension;>;"
    const-string v5, "com.upsight.extension."

    invoke-static {p0, v5}, Lcom/upsight/android/Upsight;->loadMetadataByPrefix(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 132
    .local v3, "extensionMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_13
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_be

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 134
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_1f
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 135
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v5, Lcom/upsight/android/UpsightExtension;

    invoke-virtual {v5, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-nez v5, :cond_70

    .line 136
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Class %s must implement %s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    .line 137
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-class v9, Lcom/upsight/android/UpsightExtension;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    .line 136
    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_50
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1f .. :try_end_50} :catch_50
    .catch Ljava/lang/InstantiationException; {:try_start_1f .. :try_end_50} :catch_7e
    .catch Ljava/lang/IllegalAccessException; {:try_start_1f .. :try_end_50} :catch_9e

    .line 141
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_50
    move-exception v1

    .line 142
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to load extension: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v6, v5, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 140
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_70
    :try_start_70
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/upsight/android/UpsightExtension;

    invoke-interface {v4, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_70 .. :try_end_7d} :catch_50
    .catch Ljava/lang/InstantiationException; {:try_start_70 .. :try_end_7d} :catch_7e
    .catch Ljava/lang/IllegalAccessException; {:try_start_70 .. :try_end_7d} :catch_9e

    goto :goto_13

    .line 143
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_7e
    move-exception v1

    .line 144
    .local v1, "e":Ljava/lang/InstantiationException;
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to load extension: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v6, v5, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 145
    .end local v1    # "e":Ljava/lang/InstantiationException;
    :catch_9e
    move-exception v1

    .line 146
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to load extension: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v6, v5, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 149
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_be
    return-object v4
.end method

.method private static loadMetadataByName(Landroid/content/Context;Ljava/lang/String;)Landroid/util/Pair;
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 160
    const/4 v2, 0x0

    .line 162
    .local v2, "entry":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 163
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x80

    .line 162
    invoke-virtual {v7, v8, v9}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v4

    .line 164
    .local v4, "info":Landroid/content/pm/ApplicationInfo;
    iget-object v0, v4, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 165
    .local v0, "bundle":Landroid/os/Bundle;
    if-eqz v0, :cond_43

    .line 166
    invoke-virtual {v0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1b
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_43

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 167
    .local v5, "key":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1b

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1b

    .line 168
    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 169
    .local v6, "value":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1b

    .line 170
    new-instance v3, Landroid/util/Pair;

    invoke-direct {v3, v5, v6}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_42
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_42} :catch_44

    .end local v2    # "entry":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    .local v3, "entry":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    move-object v2, v3

    .line 179
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v3    # "entry":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4    # "info":Landroid/content/pm/ApplicationInfo;
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    .restart local v2    # "entry":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_43
    :goto_43
    return-object v2

    .line 176
    :catch_44
    move-exception v1

    .line 177
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v7, "Upsight"

    const-string v8, "Unexpected error: Package name missing"

    invoke-static {v7, v8, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_43
.end method

.method private static loadMetadataByPrefix(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 190
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 192
    .local v2, "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_5
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 193
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x80

    .line 192
    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    .line 194
    .local v3, "info":Landroid/content/pm/ApplicationInfo;
    iget-object v0, v3, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 195
    .local v0, "bundle":Landroid/os/Bundle;
    if-eqz v0, :cond_4d

    .line 196
    invoke-virtual {v0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1f
    :goto_1f
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4d

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 197
    .local v4, "key":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1f

    invoke-virtual {v4, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1f

    .line 198
    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 199
    .local v5, "value":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1f

    .line 200
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_44
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5 .. :try_end_44} :catch_45

    goto :goto_1f

    .line 205
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v3    # "info":Landroid/content/pm/ApplicationInfo;
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :catch_45
    move-exception v1

    .line 206
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v6, "Upsight"

    const-string v7, "Unexpected error: Package name missing"

    invoke-static {v6, v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 208
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_4d
    return-object v2
.end method
