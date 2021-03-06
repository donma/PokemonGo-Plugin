.class public Lrx/internal/util/SynchronizedSubscription;
.super Ljava/lang/Object;
.source "SynchronizedSubscription.java"

# interfaces
.implements Lrx/Subscription;


# instance fields
.field private final s:Lrx/Subscription;


# direct methods
.method public constructor <init>(Lrx/Subscription;)V
    .registers 2
    .param p1, "s"    # Lrx/Subscription;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lrx/internal/util/SynchronizedSubscription;->s:Lrx/Subscription;

    .line 23
    return-void
.end method


# virtual methods
.method public declared-synchronized isUnsubscribed()Z
    .registers 2

    .prologue
    .line 32
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lrx/internal/util/SynchronizedSubscription;->s:Lrx/Subscription;

    invoke-interface {v0}, Lrx/Subscription;->isUnsubscribed()Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unsubscribe()V
    .registers 2

    .prologue
    .line 27
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lrx/internal/util/SynchronizedSubscription;->s:Lrx/Subscription;

    invoke-interface {v0}, Lrx/Subscription;->unsubscribe()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 28
    monitor-exit p0

    return-void

    .line 27
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method
