.class Lrx/internal/operators/OperatorSingle$Holder;
.super Ljava/lang/Object;
.source "OperatorSingle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorSingle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Holder"
.end annotation


# static fields
.field static final INSTANCE:Lrx/internal/operators/OperatorSingle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorSingle",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    new-instance v0, Lrx/internal/operators/OperatorSingle;

    invoke-direct {v0}, Lrx/internal/operators/OperatorSingle;-><init>()V

    sput-object v0, Lrx/internal/operators/OperatorSingle$Holder;->INSTANCE:Lrx/internal/operators/OperatorSingle;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
