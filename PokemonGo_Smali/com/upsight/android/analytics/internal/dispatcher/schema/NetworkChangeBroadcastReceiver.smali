.class public Lcom/upsight/android/analytics/internal/dispatcher/schema/NetworkChangeBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "NetworkChangeBroadcastReceiver.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 23
    invoke-static {p1}, Lcom/upsight/android/Upsight;->createContext(Landroid/content/Context;)Lcom/upsight/android/UpsightContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/upsight/android/UpsightContext;->getCoreComponent()Lcom/upsight/android/UpsightCoreComponent;

    move-result-object v1

    invoke-interface {v1}, Lcom/upsight/android/UpsightCoreComponent;->bus()Lcom/squareup/otto/Bus;

    move-result-object v0

    .line 25
    .local v0, "bus":Lcom/squareup/otto/Bus;
    new-instance v1, Lcom/upsight/android/analytics/internal/dispatcher/schema/NetworkChangeEvent;

    .line 26
    invoke-static {p1}, Lcom/upsight/android/internal/util/NetworkHelper;->getActiveNetworkType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 27
    invoke-static {p1}, Lcom/upsight/android/internal/util/NetworkHelper;->getNetworkOperatorName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/upsight/android/analytics/internal/dispatcher/schema/NetworkChangeEvent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    invoke-virtual {v0, v1}, Lcom/squareup/otto/Bus;->post(Ljava/lang/Object;)V

    .line 29
    return-void
.end method
