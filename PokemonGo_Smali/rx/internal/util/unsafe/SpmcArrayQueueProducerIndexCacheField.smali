.class abstract Lrx/internal/util/unsafe/SpmcArrayQueueProducerIndexCacheField;
.super Lrx/internal/util/unsafe/SpmcArrayQueueMidPad;
.source "SpmcArrayQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/SpmcArrayQueueMidPad",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private volatile producerIndexCache:J


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "capacity"    # I

    .prologue
    .line 88
    .local p0, "this":Lrx/internal/util/unsafe/SpmcArrayQueueProducerIndexCacheField;, "Lrx/internal/util/unsafe/SpmcArrayQueueProducerIndexCacheField<TE;>;"
    invoke-direct {p0, p1}, Lrx/internal/util/unsafe/SpmcArrayQueueMidPad;-><init>(I)V

    .line 89
    return-void
.end method


# virtual methods
.method protected final lvProducerIndexCache()J
    .registers 3

    .prologue
    .line 92
    .local p0, "this":Lrx/internal/util/unsafe/SpmcArrayQueueProducerIndexCacheField;, "Lrx/internal/util/unsafe/SpmcArrayQueueProducerIndexCacheField<TE;>;"
    iget-wide v0, p0, Lrx/internal/util/unsafe/SpmcArrayQueueProducerIndexCacheField;->producerIndexCache:J

    return-wide v0
.end method

.method protected final svProducerIndexCache(J)V
    .registers 4
    .param p1, "v"    # J

    .prologue
    .line 96
    .local p0, "this":Lrx/internal/util/unsafe/SpmcArrayQueueProducerIndexCacheField;, "Lrx/internal/util/unsafe/SpmcArrayQueueProducerIndexCacheField<TE;>;"
    iput-wide p1, p0, Lrx/internal/util/unsafe/SpmcArrayQueueProducerIndexCacheField;->producerIndexCache:J

    .line 97
    return-void
.end method
