.class final Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;
.super Lrx/Subscriber;
.source "OperatorBufferWithSingleObservable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorBufferWithSingleObservable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "BufferingSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/Subscriber",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final child:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<-",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field chunk:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field

.field done:Z

.field final synthetic this$0:Lrx/internal/operators/OperatorBufferWithSingleObservable;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorBufferWithSingleObservable;Lrx/Subscriber;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Ljava/util/List",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 120
    .local p0, "this":Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;, "Lrx/internal/operators/OperatorBufferWithSingleObservable<TT;TTClosing;>.BufferingSubscriber;"
    .local p2, "child":Lrx/Subscriber;, "Lrx/Subscriber<-Ljava/util/List<TT;>;>;"
    iput-object p1, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->this$0:Lrx/internal/operators/OperatorBufferWithSingleObservable;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 121
    iput-object p2, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->child:Lrx/Subscriber;

    .line 122
    new-instance v0, Ljava/util/ArrayList;

    iget v1, p1, Lrx/internal/operators/OperatorBufferWithSingleObservable;->initialCapacity:I

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->chunk:Ljava/util/List;

    .line 123
    return-void
.end method


# virtual methods
.method emit()V
    .registers 5

    .prologue
    .line 170
    .local p0, "this":Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;, "Lrx/internal/operators/OperatorBufferWithSingleObservable<TT;TTClosing;>.BufferingSubscriber;"
    monitor-enter p0

    .line 171
    :try_start_1
    iget-boolean v2, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->done:Z

    if-eqz v2, :cond_7

    .line 172
    monitor-exit p0

    .line 189
    :goto_6
    return-void

    .line 174
    :cond_7
    iget-object v1, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->chunk:Ljava/util/List;

    .line 175
    .local v1, "toEmit":Ljava/util/List;, "Ljava/util/List<TT;>;"
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->this$0:Lrx/internal/operators/OperatorBufferWithSingleObservable;

    iget v3, v3, Lrx/internal/operators/OperatorBufferWithSingleObservable;->initialCapacity:I

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->chunk:Ljava/util/List;

    .line 176
    monitor-exit p0
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_29

    .line 178
    :try_start_15
    iget-object v2, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v2, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V
    :try_end_1a
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_1a} :catch_1b

    goto :goto_6

    .line 179
    :catch_1b
    move-exception v0

    .line 180
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {p0}, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->unsubscribe()V

    .line 181
    monitor-enter p0

    .line 182
    :try_start_20
    iget-boolean v2, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->done:Z

    if-eqz v2, :cond_2c

    .line 183
    monitor-exit p0

    goto :goto_6

    .line 186
    :catchall_26
    move-exception v2

    monitor-exit p0
    :try_end_28
    .catchall {:try_start_20 .. :try_end_28} :catchall_26

    throw v2

    .line 176
    .end local v0    # "t":Ljava/lang/Throwable;
    .end local v1    # "toEmit":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :catchall_29
    move-exception v2

    :try_start_2a
    monitor-exit p0
    :try_end_2b
    .catchall {:try_start_2a .. :try_end_2b} :catchall_29

    throw v2

    .line 185
    .restart local v0    # "t":Ljava/lang/Throwable;
    .restart local v1    # "toEmit":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :cond_2c
    const/4 v2, 0x1

    :try_start_2d
    iput-boolean v2, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->done:Z

    .line 186
    monitor-exit p0
    :try_end_30
    .catchall {:try_start_2d .. :try_end_30} :catchall_26

    .line 187
    iget-object v2, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->child:Lrx/Subscriber;

    invoke-static {v0, v2}, Lrx/exceptions/Exceptions;->throwOrReport(Ljava/lang/Throwable;Lrx/Observer;)V

    goto :goto_6
.end method

.method public onCompleted()V
    .registers 4

    .prologue
    .line 151
    .local p0, "this":Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;, "Lrx/internal/operators/OperatorBufferWithSingleObservable<TT;TTClosing;>.BufferingSubscriber;"
    :try_start_0
    monitor-enter p0
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_1} :catch_21

    .line 152
    :try_start_1
    iget-boolean v2, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->done:Z

    if-eqz v2, :cond_7

    .line 153
    monitor-exit p0

    .line 166
    :goto_6
    return-void

    .line 155
    :cond_7
    const/4 v2, 0x1

    iput-boolean v2, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->done:Z

    .line 156
    iget-object v1, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->chunk:Ljava/util/List;

    .line 157
    .local v1, "toEmit":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v2, 0x0

    iput-object v2, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->chunk:Ljava/util/List;

    .line 158
    monitor-exit p0
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_1e

    .line 159
    :try_start_10
    iget-object v2, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v2, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V
    :try_end_15
    .catch Ljava/lang/Throwable; {:try_start_10 .. :try_end_15} :catch_21

    .line 164
    iget-object v2, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v2}, Lrx/Subscriber;->onCompleted()V

    .line 165
    invoke-virtual {p0}, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->unsubscribe()V

    goto :goto_6

    .line 158
    .end local v1    # "toEmit":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :catchall_1e
    move-exception v2

    :try_start_1f
    monitor-exit p0
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_1e

    :try_start_20
    throw v2
    :try_end_21
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_21} :catch_21

    .line 160
    :catch_21
    move-exception v0

    .line 161
    .local v0, "t":Ljava/lang/Throwable;
    iget-object v2, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->child:Lrx/Subscriber;

    invoke-static {v0, v2}, Lrx/exceptions/Exceptions;->throwOrReport(Ljava/lang/Throwable;Lrx/Observer;)V

    goto :goto_6
.end method

.method public onError(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 136
    .local p0, "this":Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;, "Lrx/internal/operators/OperatorBufferWithSingleObservable<TT;TTClosing;>.BufferingSubscriber;"
    monitor-enter p0

    .line 137
    :try_start_1
    iget-boolean v0, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->done:Z

    if-eqz v0, :cond_7

    .line 138
    monitor-exit p0

    .line 145
    :goto_6
    return-void

    .line 140
    :cond_7
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->done:Z

    .line 141
    const/4 v0, 0x0

    iput-object v0, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->chunk:Ljava/util/List;

    .line 142
    monitor-exit p0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_17

    .line 143
    iget-object v0, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 144
    invoke-virtual {p0}, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->unsubscribe()V

    goto :goto_6

    .line 142
    :catchall_17
    move-exception v0

    :try_start_18
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    throw v0
.end method

.method public onNext(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 126
    .local p0, "this":Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;, "Lrx/internal/operators/OperatorBufferWithSingleObservable<TT;TTClosing;>.BufferingSubscriber;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    monitor-enter p0

    .line 127
    :try_start_1
    iget-boolean v0, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->done:Z

    if-eqz v0, :cond_7

    .line 128
    monitor-exit p0

    .line 132
    :goto_6
    return-void

    .line 130
    :cond_7
    iget-object v0, p0, Lrx/internal/operators/OperatorBufferWithSingleObservable$BufferingSubscriber;->chunk:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    monitor-exit p0

    goto :goto_6

    :catchall_e
    move-exception v0

    monitor-exit p0
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_e

    throw v0
.end method
