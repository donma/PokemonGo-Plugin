.class Lcom/upsight/android/internal/persistence/DataStore$6;
.super Ljava/lang/Object;
.source "DataStore.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/upsight/android/internal/persistence/DataStore;->remove(Ljava/lang/Class;Ljava/util/Set;Lcom/upsight/android/persistence/UpsightDataStoreListener;)Lcom/upsight/android/persistence/UpsightSubscription;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Action1",
        "<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/upsight/android/internal/persistence/DataStore;

.field final synthetic val$listener:Lcom/upsight/android/persistence/UpsightDataStoreListener;


# direct methods
.method constructor <init>(Lcom/upsight/android/internal/persistence/DataStore;Lcom/upsight/android/persistence/UpsightDataStoreListener;)V
    .registers 3
    .param p1, "this$0"    # Lcom/upsight/android/internal/persistence/DataStore;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/upsight/android/internal/persistence/DataStore$6;->this$0:Lcom/upsight/android/internal/persistence/DataStore;

    iput-object p2, p0, Lcom/upsight/android/internal/persistence/DataStore$6;->val$listener:Lcom/upsight/android/persistence/UpsightDataStoreListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 134
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/upsight/android/internal/persistence/DataStore$6;->call(Ljava/lang/Throwable;)V

    return-void
.end method

.method public call(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/upsight/android/internal/persistence/DataStore$6;->val$listener:Lcom/upsight/android/persistence/UpsightDataStoreListener;

    new-instance v1, Lcom/upsight/android/UpsightException;

    invoke-direct {v1, p1}, Lcom/upsight/android/UpsightException;-><init>(Ljava/lang/Throwable;)V

    invoke-interface {v0, v1}, Lcom/upsight/android/persistence/UpsightDataStoreListener;->onFailure(Lcom/upsight/android/UpsightException;)V

    .line 138
    return-void
.end method
