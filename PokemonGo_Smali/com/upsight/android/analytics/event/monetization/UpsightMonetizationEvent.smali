.class public Lcom/upsight/android/analytics/event/monetization/UpsightMonetizationEvent;
.super Lcom/upsight/android/analytics/internal/AnalyticsEvent;
.source "UpsightMonetizationEvent.java"


# annotations
.annotation runtime Lcom/upsight/android/persistence/annotation/UpsightStorableType;
    value = "upsight.monetization"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/upsight/android/analytics/event/monetization/UpsightMonetizationEvent$Builder;,
        Lcom/upsight/android/analytics/event/monetization/UpsightMonetizationEvent$UpsightData;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/upsight/android/analytics/internal/AnalyticsEvent",
        "<",
        "Lcom/upsight/android/analytics/event/monetization/UpsightMonetizationEvent$UpsightData;",
        ">;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 318
    invoke-direct {p0}, Lcom/upsight/android/analytics/internal/AnalyticsEvent;-><init>()V

    .line 320
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Lcom/upsight/android/analytics/event/monetization/UpsightMonetizationEvent$UpsightData;Lcom/upsight/android/analytics/event/UpsightPublisherData;)V
    .registers 4
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "upsightData"    # Lcom/upsight/android/analytics/event/monetization/UpsightMonetizationEvent$UpsightData;
    .param p3, "publisherData"    # Lcom/upsight/android/analytics/event/UpsightPublisherData;

    .prologue
    .line 315
    invoke-direct {p0, p1, p2, p3}, Lcom/upsight/android/analytics/internal/AnalyticsEvent;-><init>(Ljava/lang/String;Ljava/lang/Object;Lcom/upsight/android/analytics/event/UpsightPublisherData;)V

    .line 316
    return-void
.end method

.method public static createBuilder(Ljava/lang/Double;Ljava/lang/String;)Lcom/upsight/android/analytics/event/monetization/UpsightMonetizationEvent$Builder;
    .registers 3
    .param p0, "totalPrice"    # Ljava/lang/Double;
    .param p1, "currency"    # Ljava/lang/String;

    .prologue
    .line 31
    new-instance v0, Lcom/upsight/android/analytics/event/monetization/UpsightMonetizationEvent$Builder;

    invoke-direct {v0, p0, p1}, Lcom/upsight/android/analytics/event/monetization/UpsightMonetizationEvent$Builder;-><init>(Ljava/lang/Double;Ljava/lang/String;)V

    return-object v0
.end method
