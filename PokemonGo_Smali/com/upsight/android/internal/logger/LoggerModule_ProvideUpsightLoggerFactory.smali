.class public final Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;
.super Ljava/lang/Object;
.source "LoggerModule_ProvideUpsightLoggerFactory.java"

# interfaces
.implements Ldagger/internal/Factory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ldagger/internal/Factory",
        "<",
        "Lcom/upsight/android/logger/UpsightLogger;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final dataStoreProvider:Ljavax/inject/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/inject/Provider",
            "<",
            "Lcom/upsight/android/persistence/UpsightDataStore;",
            ">;"
        }
    .end annotation
.end field

.field private final module:Lcom/upsight/android/internal/logger/LoggerModule;

.field private final writerProvider:Ljavax/inject/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/inject/Provider",
            "<",
            "Lcom/upsight/android/internal/logger/LogWriter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 10
    const-class v0, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/upsight/android/internal/logger/LoggerModule;Ljavax/inject/Provider;Ljavax/inject/Provider;)V
    .registers 5
    .param p1, "module"    # Lcom/upsight/android/internal/logger/LoggerModule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/upsight/android/internal/logger/LoggerModule;",
            "Ljavax/inject/Provider",
            "<",
            "Lcom/upsight/android/persistence/UpsightDataStore;",
            ">;",
            "Ljavax/inject/Provider",
            "<",
            "Lcom/upsight/android/internal/logger/LogWriter;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p2, "dataStoreProvider":Ljavax/inject/Provider;, "Ljavax/inject/Provider<Lcom/upsight/android/persistence/UpsightDataStore;>;"
    .local p3, "writerProvider":Ljavax/inject/Provider;, "Ljavax/inject/Provider<Lcom/upsight/android/internal/logger/LogWriter;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    sget-boolean v0, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;->$assertionsDisabled:Z

    if-nez v0, :cond_f

    if-nez p1, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 26
    :cond_f
    iput-object p1, p0, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;->module:Lcom/upsight/android/internal/logger/LoggerModule;

    .line 27
    sget-boolean v0, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;->$assertionsDisabled:Z

    if-nez v0, :cond_1d

    if-nez p2, :cond_1d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 28
    :cond_1d
    iput-object p2, p0, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;->dataStoreProvider:Ljavax/inject/Provider;

    .line 29
    sget-boolean v0, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;->$assertionsDisabled:Z

    if-nez v0, :cond_2b

    if-nez p3, :cond_2b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 30
    :cond_2b
    iput-object p3, p0, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;->writerProvider:Ljavax/inject/Provider;

    .line 31
    return-void
.end method

.method public static create(Lcom/upsight/android/internal/logger/LoggerModule;Ljavax/inject/Provider;Ljavax/inject/Provider;)Ldagger/internal/Factory;
    .registers 4
    .param p0, "module"    # Lcom/upsight/android/internal/logger/LoggerModule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/upsight/android/internal/logger/LoggerModule;",
            "Ljavax/inject/Provider",
            "<",
            "Lcom/upsight/android/persistence/UpsightDataStore;",
            ">;",
            "Ljavax/inject/Provider",
            "<",
            "Lcom/upsight/android/internal/logger/LogWriter;",
            ">;)",
            "Ldagger/internal/Factory",
            "<",
            "Lcom/upsight/android/logger/UpsightLogger;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    .local p1, "dataStoreProvider":Ljavax/inject/Provider;, "Ljavax/inject/Provider<Lcom/upsight/android/persistence/UpsightDataStore;>;"
    .local p2, "writerProvider":Ljavax/inject/Provider;, "Ljavax/inject/Provider<Lcom/upsight/android/internal/logger/LogWriter;>;"
    new-instance v0, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;

    invoke-direct {v0, p0, p1, p2}, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;-><init>(Lcom/upsight/android/internal/logger/LoggerModule;Ljavax/inject/Provider;Ljavax/inject/Provider;)V

    return-object v0
.end method


# virtual methods
.method public get()Lcom/upsight/android/logger/UpsightLogger;
    .registers 4

    .prologue
    .line 35
    iget-object v2, p0, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;->module:Lcom/upsight/android/internal/logger/LoggerModule;

    iget-object v0, p0, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;->dataStoreProvider:Ljavax/inject/Provider;

    .line 36
    invoke-interface {v0}, Ljavax/inject/Provider;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/upsight/android/persistence/UpsightDataStore;

    iget-object v1, p0, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;->writerProvider:Ljavax/inject/Provider;

    invoke-interface {v1}, Ljavax/inject/Provider;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/upsight/android/internal/logger/LogWriter;

    invoke-virtual {v2, v0, v1}, Lcom/upsight/android/internal/logger/LoggerModule;->provideUpsightLogger(Lcom/upsight/android/persistence/UpsightDataStore;Lcom/upsight/android/internal/logger/LogWriter;)Lcom/upsight/android/logger/UpsightLogger;

    move-result-object v0

    const-string v1, "Cannot return null from a non-@Nullable @Provides method"

    .line 35
    invoke-static {v0, v1}, Ldagger/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/upsight/android/logger/UpsightLogger;

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 10
    invoke-virtual {p0}, Lcom/upsight/android/internal/logger/LoggerModule_ProvideUpsightLoggerFactory;->get()Lcom/upsight/android/logger/UpsightLogger;

    move-result-object v0

    return-object v0
.end method
