.class Lcom/android/server/media/RemoteDisplayProviderProxy$Connection$1;
.super Ljava/lang/Object;
.source "RemoteDisplayProviderProxy.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/media/RemoteDisplayProviderProxy$Connection;->register()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/media/RemoteDisplayProviderProxy$Connection;


# direct methods
.method constructor <init>(Lcom/android/server/media/RemoteDisplayProviderProxy$Connection;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/server/media/RemoteDisplayProviderProxy$Connection$1;->this$1:Lcom/android/server/media/RemoteDisplayProviderProxy$Connection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/server/media/RemoteDisplayProviderProxy$Connection$1;->this$1:Lcom/android/server/media/RemoteDisplayProviderProxy$Connection;

    iget-object v0, v0, Lcom/android/server/media/RemoteDisplayProviderProxy$Connection;->this$0:Lcom/android/server/media/RemoteDisplayProviderProxy;

    iget-object v1, p0, Lcom/android/server/media/RemoteDisplayProviderProxy$Connection$1;->this$1:Lcom/android/server/media/RemoteDisplayProviderProxy$Connection;

    #calls: Lcom/android/server/media/RemoteDisplayProviderProxy;->onConnectionReady(Lcom/android/server/media/RemoteDisplayProviderProxy$Connection;)V
    invoke-static {v0, v1}, Lcom/android/server/media/RemoteDisplayProviderProxy;->access$300(Lcom/android/server/media/RemoteDisplayProviderProxy;Lcom/android/server/media/RemoteDisplayProviderProxy$Connection;)V

    return-void
.end method
