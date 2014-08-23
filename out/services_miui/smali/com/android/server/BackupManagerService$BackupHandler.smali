.class Lcom/android/server/BackupManagerService$BackupHandler;
.super Landroid/os/Handler;
.source "BackupManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BackupManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BackupHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/BackupManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/BackupManagerService;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter "looper"

    .prologue
    .line 543
    iput-object p1, p0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    .line 544
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 545
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 31
    .parameter "msg"

    .prologue
    .line 549
    move-object/from16 v0, p1

    iget v3, v0, Landroid/os/Message;->what:I

    packed-switch v3, :pswitch_data_0

    .line 803
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 552
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iput-wide v9, v3, Lcom/android/server/BackupManagerService;->mLastBackupPass:J

    .line 553
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-wide v9, v9, Lcom/android/server/BackupManagerService;->mLastBackupPass:J

    const-wide/32 v11, 0x36ee80

    add-long/2addr v9, v11

    iput-wide v9, v3, Lcom/android/server/BackupManagerService;->mNextBackupPass:J

    .line 555
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v9, v9, Lcom/android/server/BackupManagerService;->mCurrentTransport:Ljava/lang/String;

    #calls: Lcom/android/server/BackupManagerService;->getTransport(Ljava/lang/String;)Lcom/android/internal/backup/IBackupTransport;
    invoke-static {v3, v9}, Lcom/android/server/BackupManagerService;->access$100(Lcom/android/server/BackupManagerService;Ljava/lang/String;)Lcom/android/internal/backup/IBackupTransport;

    move-result-object v4

    .line 556
    .local v4, transport:Lcom/android/internal/backup/IBackupTransport;
    if-nez v4, :cond_1

    .line 557
    const-string v3, "BackupManagerService"

    const-string v9, "Backup requested but no transport available"

    invoke-static {v3, v9}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 558
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v9, v3, Lcom/android/server/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v9

    .line 559
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    const/4 v10, 0x0

    iput-boolean v10, v3, Lcom/android/server/BackupManagerService;->mBackupRunning:Z

    .line 560
    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 561
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    goto :goto_0

    .line 560
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 566
    :cond_1
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 567
    .local v6, queue:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/BackupManagerService$BackupRequest;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v7, v3, Lcom/android/server/BackupManagerService;->mJournal:Ljava/io/File;

    .line 568
    .local v7, oldJournal:Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v9, v3, Lcom/android/server/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v9

    .line 572
    :try_start_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/BackupManagerService;->mPendingBackups:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v3

    if-lez v3, :cond_3

    .line 573
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/BackupManagerService;->mPendingBackups:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v23

    .local v23, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/android/server/BackupManagerService$BackupRequest;

    .line 574
    .local v21, b:Lcom/android/server/BackupManagerService$BackupRequest;
    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 583
    .end local v21           #b:Lcom/android/server/BackupManagerService$BackupRequest;
    .end local v23           #i$:Ljava/util/Iterator;
    :catchall_1
    move-exception v3

    monitor-exit v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v3

    .line 576
    .restart local v23       #i$:Ljava/util/Iterator;
    :cond_2
    :try_start_3
    const-string v3, "BackupManagerService"

    const-string v10, "clearing pending backups"

    invoke-static {v3, v10}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 577
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/BackupManagerService;->mPendingBackups:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    .line 580
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    const/4 v10, 0x0

    iput-object v10, v3, Lcom/android/server/BackupManagerService;->mJournal:Ljava/io/File;

    .line 583
    .end local v23           #i$:Ljava/util/Iterator;
    :cond_3
    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 590
    const/16 v30, 0x1

    .line 591
    .local v30, staged:Z
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_4

    .line 594
    :try_start_4
    invoke-interface {v4}, Lcom/android/internal/backup/IBackupTransport;->transportDirName()Ljava/lang/String;

    move-result-object v5

    .line 595
    .local v5, dirName:Ljava/lang/String;
    new-instance v2, Lcom/android/server/BackupManagerService$PerformBackupTask;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    invoke-direct/range {v2 .. v7}, Lcom/android/server/BackupManagerService$PerformBackupTask;-><init>(Lcom/android/server/BackupManagerService;Lcom/android/internal/backup/IBackupTransport;Ljava/lang/String;Ljava/util/ArrayList;Ljava/io/File;)V

    .line 597
    .local v2, pbt:Lcom/android/server/BackupManagerService$PerformBackupTask;
    const/16 v3, 0x14

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v2}, Lcom/android/server/BackupManagerService$BackupHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v25

    .line 598
    .local v25, pbtMessage:Landroid/os/Message;
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService$BackupHandler;->sendMessage(Landroid/os/Message;)Z
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_0

    .line 610
    .end local v2           #pbt:Lcom/android/server/BackupManagerService$PerformBackupTask;
    .end local v5           #dirName:Ljava/lang/String;
    .end local v25           #pbtMessage:Landroid/os/Message;
    :goto_2
    if-nez v30, :cond_0

    .line 612
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v9, v3, Lcom/android/server/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v9

    .line 613
    :try_start_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    const/4 v10, 0x0

    iput-boolean v10, v3, Lcom/android/server/BackupManagerService;->mBackupRunning:Z

    .line 614
    monitor-exit v9
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 615
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    goto/16 :goto_0

    .line 599
    :catch_0
    move-exception v22

    .line 602
    .local v22, e:Landroid/os/RemoteException;
    const-string v3, "BackupManagerService"

    const-string v9, "Transport became unavailable attempting backup"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 603
    const/16 v30, 0x0

    .line 604
    goto :goto_2

    .line 606
    .end local v22           #e:Landroid/os/RemoteException;
    :cond_4
    const-string v3, "BackupManagerService"

    const-string v9, "Backup requested but nothing pending"

    invoke-static {v3, v9}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 607
    const/16 v30, 0x0

    goto :goto_2

    .line 614
    :catchall_2
    move-exception v3

    :try_start_6
    monitor-exit v9
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw v3

    .line 623
    .end local v4           #transport:Lcom/android/internal/backup/IBackupTransport;
    .end local v6           #queue:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/BackupManagerService$BackupRequest;>;"
    .end local v7           #oldJournal:Ljava/io/File;
    .end local v30           #staged:Z
    :pswitch_2
    :try_start_7
    move-object/from16 v0, p1

    iget-object v8, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v8, Lcom/android/server/BackupManagerService$BackupRestoreTask;

    .line 625
    .local v8, task:Lcom/android/server/BackupManagerService$BackupRestoreTask;
    invoke-interface {v8}, Lcom/android/server/BackupManagerService$BackupRestoreTask;->execute()V
    :try_end_7
    .catch Ljava/lang/ClassCastException; {:try_start_7 .. :try_end_7} :catch_1

    goto/16 :goto_0

    .line 626
    .end local v8           #task:Lcom/android/server/BackupManagerService$BackupRestoreTask;
    :catch_1
    move-exception v22

    .line 627
    .local v22, e:Ljava/lang/ClassCastException;
    const-string v3, "BackupManagerService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Invalid backup task in flight, obj="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p1

    iget-object v10, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 635
    .end local v22           #e:Ljava/lang/ClassCastException;
    :pswitch_3
    :try_start_8
    move-object/from16 v0, p1

    iget-object v8, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v8, Lcom/android/server/BackupManagerService$BackupRestoreTask;

    .line 636
    .restart local v8       #task:Lcom/android/server/BackupManagerService$BackupRestoreTask;
    invoke-interface {v8}, Lcom/android/server/BackupManagerService$BackupRestoreTask;->operationComplete()V
    :try_end_8
    .catch Ljava/lang/ClassCastException; {:try_start_8 .. :try_end_8} :catch_2

    goto/16 :goto_0

    .line 637
    .end local v8           #task:Lcom/android/server/BackupManagerService$BackupRestoreTask;
    :catch_2
    move-exception v22

    .line 638
    .restart local v22       #e:Ljava/lang/ClassCastException;
    const-string v3, "BackupManagerService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Invalid completion in flight, obj="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p1

    iget-object v10, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 647
    .end local v22           #e:Ljava/lang/ClassCastException;
    :pswitch_4
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v24, v0

    check-cast v24, Lcom/android/server/BackupManagerService$FullBackupParams;

    .line 648
    .local v24, params:Lcom/android/server/BackupManagerService$FullBackupParams;
    new-instance v8, Lcom/android/server/BackupManagerService$PerformFullBackupTask;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v24

    iget-object v10, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->fd:Landroid/os/ParcelFileDescriptor;

    move-object/from16 v0, v24

    iget-object v11, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->observer:Landroid/app/backup/IFullBackupRestoreObserver;

    move-object/from16 v0, v24

    iget-boolean v12, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->includeApks:Z

    move-object/from16 v0, v24

    iget-boolean v13, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->includeObbs:Z

    move-object/from16 v0, v24

    iget-boolean v14, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->includeShared:Z

    move-object/from16 v0, v24

    iget-object v15, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->curPassword:Ljava/lang/String;

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->encryptPassword:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v24

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->allApps:Z

    move/from16 v17, v0

    move-object/from16 v0, v24

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->includeSystem:Z

    move/from16 v18, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->packages:[Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->latch:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v20, v0

    invoke-direct/range {v8 .. v20}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;-><init>(Lcom/android/server/BackupManagerService;Landroid/os/ParcelFileDescriptor;Landroid/app/backup/IFullBackupRestoreObserver;ZZZLjava/lang/String;Ljava/lang/String;ZZ[Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 652
    .local v8, task:Lcom/android/server/BackupManagerService$PerformFullBackupTask;
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, v8}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 658
    .end local v8           #task:Lcom/android/server/BackupManagerService$PerformFullBackupTask;
    .end local v24           #params:Lcom/android/server/BackupManagerService$FullBackupParams;
    :pswitch_5
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v24, v0

    check-cast v24, Lcom/android/server/BackupManagerService$RestoreParams;

    .line 659
    .local v24, params:Lcom/android/server/BackupManagerService$RestoreParams;
    const-string v3, "BackupManagerService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "MSG_RUN_RESTORE observer="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, v24

    iget-object v10, v0, Lcom/android/server/BackupManagerService$RestoreParams;->observer:Landroid/app/backup/IRestoreObserver;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 660
    new-instance v8, Lcom/android/server/BackupManagerService$PerformRestoreTask;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v24

    iget-object v10, v0, Lcom/android/server/BackupManagerService$RestoreParams;->transport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v0, v24

    iget-object v11, v0, Lcom/android/server/BackupManagerService$RestoreParams;->dirName:Ljava/lang/String;

    move-object/from16 v0, v24

    iget-object v12, v0, Lcom/android/server/BackupManagerService$RestoreParams;->observer:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v0, v24

    iget-wide v13, v0, Lcom/android/server/BackupManagerService$RestoreParams;->token:J

    move-object/from16 v0, v24

    iget-object v15, v0, Lcom/android/server/BackupManagerService$RestoreParams;->pkgInfo:Landroid/content/pm/PackageInfo;

    move-object/from16 v0, v24

    iget v0, v0, Lcom/android/server/BackupManagerService$RestoreParams;->pmToken:I

    move/from16 v16, v0

    move-object/from16 v0, v24

    iget-boolean v0, v0, Lcom/android/server/BackupManagerService$RestoreParams;->needFullBackup:Z

    move/from16 v17, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/android/server/BackupManagerService$RestoreParams;->filterSet:[Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-direct/range {v8 .. v18}, Lcom/android/server/BackupManagerService$PerformRestoreTask;-><init>(Lcom/android/server/BackupManagerService;Lcom/android/internal/backup/IBackupTransport;Ljava/lang/String;Landroid/app/backup/IRestoreObserver;JLandroid/content/pm/PackageInfo;IZ[Ljava/lang/String;)V

    .line 664
    .local v8, task:Lcom/android/server/BackupManagerService$PerformRestoreTask;
    const/16 v3, 0x14

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v8}, Lcom/android/server/BackupManagerService$BackupHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v28

    .line 665
    .local v28, restoreMsg:Landroid/os/Message;
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService$BackupHandler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 673
    .end local v8           #task:Lcom/android/server/BackupManagerService$PerformRestoreTask;
    .end local v24           #params:Lcom/android/server/BackupManagerService$RestoreParams;
    .end local v28           #restoreMsg:Landroid/os/Message;
    :pswitch_6
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v24, v0

    check-cast v24, Lcom/android/server/BackupManagerService$FullRestoreParams;

    .line 674
    .local v24, params:Lcom/android/server/BackupManagerService$FullRestoreParams;
    new-instance v8, Lcom/android/server/BackupManagerService$PerformFullRestoreTask;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v24

    iget-object v10, v0, Lcom/android/server/BackupManagerService$FullRestoreParams;->fd:Landroid/os/ParcelFileDescriptor;

    move-object/from16 v0, v24

    iget-object v11, v0, Lcom/android/server/BackupManagerService$FullRestoreParams;->curPassword:Ljava/lang/String;

    move-object/from16 v0, v24

    iget-object v12, v0, Lcom/android/server/BackupManagerService$FullRestoreParams;->encryptPassword:Ljava/lang/String;

    move-object/from16 v0, v24

    iget-object v13, v0, Lcom/android/server/BackupManagerService$FullRestoreParams;->observer:Landroid/app/backup/IFullBackupRestoreObserver;

    move-object/from16 v0, v24

    iget-object v14, v0, Lcom/android/server/BackupManagerService$FullRestoreParams;->latch:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct/range {v8 .. v14}, Lcom/android/server/BackupManagerService$PerformFullRestoreTask;-><init>(Lcom/android/server/BackupManagerService;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;Ljava/lang/String;Landroid/app/backup/IFullBackupRestoreObserver;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 677
    .local v8, task:Lcom/android/server/BackupManagerService$PerformFullRestoreTask;
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, v8}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 683
    .end local v8           #task:Lcom/android/server/BackupManagerService$PerformFullRestoreTask;
    .end local v24           #params:Lcom/android/server/BackupManagerService$FullRestoreParams;
    :pswitch_7
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v24, v0

    check-cast v24, Lcom/android/server/BackupManagerService$ClearParams;

    .line 684
    .local v24, params:Lcom/android/server/BackupManagerService$ClearParams;
    new-instance v3, Lcom/android/server/BackupManagerService$PerformClearTask;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v24

    iget-object v10, v0, Lcom/android/server/BackupManagerService$ClearParams;->transport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v0, v24

    iget-object v11, v0, Lcom/android/server/BackupManagerService$ClearParams;->packageInfo:Landroid/content/pm/PackageInfo;

    invoke-direct {v3, v9, v10, v11}, Lcom/android/server/BackupManagerService$PerformClearTask;-><init>(Lcom/android/server/BackupManagerService;Lcom/android/internal/backup/IBackupTransport;Landroid/content/pm/PackageInfo;)V

    invoke-virtual {v3}, Lcom/android/server/BackupManagerService$PerformClearTask;->run()V

    goto/16 :goto_0

    .line 691
    .end local v24           #params:Lcom/android/server/BackupManagerService$ClearParams;
    :pswitch_8
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v24, v0

    check-cast v24, Lcom/android/server/BackupManagerService$ClearRetryParams;

    .line 692
    .local v24, params:Lcom/android/server/BackupManagerService$ClearRetryParams;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v24

    iget-object v9, v0, Lcom/android/server/BackupManagerService$ClearRetryParams;->transportName:Ljava/lang/String;

    move-object/from16 v0, v24

    iget-object v10, v0, Lcom/android/server/BackupManagerService$ClearRetryParams;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v9, v10}, Lcom/android/server/BackupManagerService;->clearBackupData(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 701
    .end local v24           #params:Lcom/android/server/BackupManagerService$ClearRetryParams;
    :pswitch_9
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v9, v3, Lcom/android/server/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v9

    .line 702
    :try_start_9
    new-instance v26, Ljava/util/HashSet;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/BackupManagerService;->mPendingInits:Ljava/util/HashSet;

    move-object/from16 v0, v26

    invoke-direct {v0, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 703
    .local v26, queue:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/BackupManagerService;->mPendingInits:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->clear()V

    .line 704
    monitor-exit v9
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 706
    new-instance v3, Lcom/android/server/BackupManagerService$PerformInitializeTask;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v26

    invoke-direct {v3, v9, v0}, Lcom/android/server/BackupManagerService$PerformInitializeTask;-><init>(Lcom/android/server/BackupManagerService;Ljava/util/HashSet;)V

    invoke-virtual {v3}, Lcom/android/server/BackupManagerService$PerformInitializeTask;->run()V

    goto/16 :goto_0

    .line 704
    .end local v26           #queue:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    :catchall_3
    move-exception v3

    :try_start_a
    monitor-exit v9
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    throw v3

    .line 712
    :pswitch_a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v10, v3, Lcom/android/server/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v10

    .line 713
    :try_start_b
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, p1

    iget v3, v0, Landroid/os/Message;->arg1:I

    if-eqz v3, :cond_5

    const/4 v3, 0x1

    move v9, v3

    :goto_3
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v11, v9, v3}, Lcom/android/server/BackupManagerService;->recordInitPendingLocked(ZLjava/lang/String;)V

    .line 714
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    #getter for: Lcom/android/server/BackupManagerService;->mAlarmManager:Landroid/app/AlarmManager;
    invoke-static {v3}, Lcom/android/server/BackupManagerService;->access$200(Lcom/android/server/BackupManagerService;)Landroid/app/AlarmManager;

    move-result-object v3

    const/4 v9, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v13, v13, Lcom/android/server/BackupManagerService;->mRunInitIntent:Landroid/app/PendingIntent;

    invoke-virtual {v3, v9, v11, v12, v13}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 716
    monitor-exit v10

    goto/16 :goto_0

    :catchall_4
    move-exception v3

    monitor-exit v10
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    throw v3

    .line 713
    :cond_5
    const/4 v3, 0x0

    move v9, v3

    goto :goto_3

    .line 723
    :pswitch_b
    const/16 v29, 0x0

    .line 724
    .local v29, sets:[Landroid/app/backup/RestoreSet;
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v24, v0

    check-cast v24, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;

    .line 726
    .local v24, params:Lcom/android/server/BackupManagerService$RestoreGetSetsParams;
    :try_start_c
    move-object/from16 v0, v24

    iget-object v3, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->transport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v3}, Lcom/android/internal/backup/IBackupTransport;->getAvailableRestoreSets()[Landroid/app/backup/RestoreSet;

    move-result-object v29

    .line 728
    move-object/from16 v0, v24

    iget-object v9, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->session:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    monitor-enter v9
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_3

    .line 729
    :try_start_d
    move-object/from16 v0, v24

    iget-object v3, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->session:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    move-object/from16 v0, v29

    iput-object v0, v3, Lcom/android/server/BackupManagerService$ActiveRestoreSession;->mRestoreSets:[Landroid/app/backup/RestoreSet;

    .line 730
    monitor-exit v9
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    .line 731
    if-nez v29, :cond_6

    const/16 v3, 0xb0f

    const/4 v9, 0x0

    :try_start_e
    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v3, v9}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_3

    .line 735
    :cond_6
    move-object/from16 v0, v24

    iget-object v3, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    if-eqz v3, :cond_7

    .line 737
    :try_start_f
    move-object/from16 v0, v24

    iget-object v3, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v0, v29

    invoke-interface {v3, v0}, Landroid/app/backup/IRestoreObserver;->restoreSetsAvailable([Landroid/app/backup/RestoreSet;)V
    :try_end_f
    .catch Landroid/os/RemoteException; {:try_start_f .. :try_end_f} :catch_4
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_5

    .line 746
    :cond_7
    :goto_4
    const/16 v3, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/server/BackupManagerService$BackupHandler;->removeMessages(I)V

    .line 747
    const/16 v3, 0x8

    const-wide/32 v9, 0xea60

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v9, v10}, Lcom/android/server/BackupManagerService$BackupHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 749
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    goto/16 :goto_0

    .line 730
    :catchall_5
    move-exception v3

    :try_start_10
    monitor-exit v9
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_5

    :try_start_11
    throw v3
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_6
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_3

    .line 732
    :catch_3
    move-exception v22

    .line 733
    .local v22, e:Ljava/lang/Exception;
    :try_start_12
    const-string v3, "BackupManagerService"

    const-string v9, "Error from transport getting set list"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_6

    .line 735
    move-object/from16 v0, v24

    iget-object v3, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    if-eqz v3, :cond_8

    .line 737
    :try_start_13
    move-object/from16 v0, v24

    iget-object v3, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v0, v29

    invoke-interface {v3, v0}, Landroid/app/backup/IRestoreObserver;->restoreSetsAvailable([Landroid/app/backup/RestoreSet;)V
    :try_end_13
    .catch Landroid/os/RemoteException; {:try_start_13 .. :try_end_13} :catch_6
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_7

    .line 746
    :cond_8
    :goto_5
    const/16 v3, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/server/BackupManagerService$BackupHandler;->removeMessages(I)V

    .line 747
    const/16 v3, 0x8

    const-wide/32 v9, 0xea60

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v9, v10}, Lcom/android/server/BackupManagerService$BackupHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 749
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    goto/16 :goto_0

    .line 738
    .end local v22           #e:Ljava/lang/Exception;
    :catch_4
    move-exception v27

    .line 739
    .local v27, re:Landroid/os/RemoteException;
    const-string v3, "BackupManagerService"

    const-string v9, "Unable to report listing to observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 740
    .end local v27           #re:Landroid/os/RemoteException;
    :catch_5
    move-exception v22

    .line 741
    .restart local v22       #e:Ljava/lang/Exception;
    const-string v3, "BackupManagerService"

    const-string v9, "Restore observer threw"

    move-object/from16 v0, v22

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4

    .line 738
    :catch_6
    move-exception v27

    .line 739
    .restart local v27       #re:Landroid/os/RemoteException;
    const-string v3, "BackupManagerService"

    const-string v9, "Unable to report listing to observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 740
    .end local v27           #re:Landroid/os/RemoteException;
    :catch_7
    move-exception v22

    .line 741
    const-string v3, "BackupManagerService"

    const-string v9, "Restore observer threw"

    move-object/from16 v0, v22

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5

    .line 735
    .end local v22           #e:Ljava/lang/Exception;
    :catchall_6
    move-exception v3

    move-object/from16 v0, v24

    iget-object v9, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    if-eqz v9, :cond_9

    .line 737
    :try_start_14
    move-object/from16 v0, v24

    iget-object v9, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v0, v29

    invoke-interface {v9, v0}, Landroid/app/backup/IRestoreObserver;->restoreSetsAvailable([Landroid/app/backup/RestoreSet;)V
    :try_end_14
    .catch Landroid/os/RemoteException; {:try_start_14 .. :try_end_14} :catch_8
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_9

    .line 746
    :cond_9
    :goto_6
    const/16 v9, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/android/server/BackupManagerService$BackupHandler;->removeMessages(I)V

    .line 747
    const/16 v9, 0x8

    const-wide/32 v10, 0xea60

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v10, v11}, Lcom/android/server/BackupManagerService$BackupHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 749
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v9, v9, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v9}, Landroid/os/PowerManager$WakeLock;->release()V

    throw v3

    .line 738
    :catch_8
    move-exception v27

    .line 739
    .restart local v27       #re:Landroid/os/RemoteException;
    const-string v9, "BackupManagerService"

    const-string v10, "Unable to report listing to observer"

    invoke-static {v9, v10}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    .line 740
    .end local v27           #re:Landroid/os/RemoteException;
    :catch_9
    move-exception v22

    .line 741
    .restart local v22       #e:Ljava/lang/Exception;
    const-string v9, "BackupManagerService"

    const-string v10, "Restore observer threw"

    move-object/from16 v0, v22

    invoke-static {v9, v10, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    .line 756
    .end local v22           #e:Ljava/lang/Exception;
    .end local v24           #params:Lcom/android/server/BackupManagerService$RestoreGetSetsParams;
    .end local v29           #sets:[Landroid/app/backup/RestoreSet;
    :pswitch_c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, p1

    iget v9, v0, Landroid/os/Message;->arg1:I

    move-object/from16 v0, p1

    iget-object v10, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v3, v9, v10}, Lcom/android/server/BackupManagerService;->handleTimeout(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 762
    :pswitch_d
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    monitor-enter v9

    .line 763
    :try_start_15
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/BackupManagerService;->mActiveRestoreSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    if-eqz v3, :cond_a

    .line 768
    const-string v3, "BackupManagerService"

    const-string v10, "Restore session timed out; aborting"

    invoke-static {v3, v10}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 769
    new-instance v3, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v10, v10, Lcom/android/server/BackupManagerService;->mActiveRestoreSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v12, v12, Lcom/android/server/BackupManagerService;->mActiveRestoreSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    invoke-direct {v3, v10, v11, v12}, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;-><init>(Lcom/android/server/BackupManagerService$ActiveRestoreSession;Lcom/android/server/BackupManagerService;Lcom/android/server/BackupManagerService$ActiveRestoreSession;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/server/BackupManagerService$BackupHandler;->post(Ljava/lang/Runnable;)Z

    .line 772
    :cond_a
    monitor-exit v9
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_8

    .line 777
    :pswitch_e
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v9, v3, Lcom/android/server/BackupManagerService;->mFullConfirmations:Landroid/util/SparseArray;

    monitor-enter v9

    .line 778
    :try_start_16
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/BackupManagerService;->mFullConfirmations:Landroid/util/SparseArray;

    move-object/from16 v0, p1

    iget v10, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {v3, v10}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/android/server/BackupManagerService$FullParams;

    .line 779
    .local v24, params:Lcom/android/server/BackupManagerService$FullParams;
    if-eqz v24, :cond_c

    .line 780
    const-string v3, "BackupManagerService"

    const-string v10, "Full backup/restore timed out waiting for user confirmation"

    invoke-static {v3, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 783
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v24

    invoke-virtual {v3, v0}, Lcom/android/server/BackupManagerService;->signalFullBackupRestoreCompletion(Lcom/android/server/BackupManagerService$FullParams;)V

    .line 786
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/BackupManagerService;->mFullConfirmations:Landroid/util/SparseArray;

    move-object/from16 v0, p1

    iget v10, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {v3, v10}, Landroid/util/SparseArray;->delete(I)V

    .line 789
    move-object/from16 v0, v24

    iget-object v3, v0, Lcom/android/server/BackupManagerService$FullParams;->observer:Landroid/app/backup/IFullBackupRestoreObserver;
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_7

    if-eqz v3, :cond_b

    .line 791
    :try_start_17
    move-object/from16 v0, v24

    iget-object v3, v0, Lcom/android/server/BackupManagerService$FullParams;->observer:Landroid/app/backup/IFullBackupRestoreObserver;

    invoke-interface {v3}, Landroid/app/backup/IFullBackupRestoreObserver;->onTimeout()V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_7
    .catch Landroid/os/RemoteException; {:try_start_17 .. :try_end_17} :catch_a

    .line 799
    :cond_b
    :goto_7
    :try_start_18
    monitor-exit v9

    goto/16 :goto_0

    .end local v24           #params:Lcom/android/server/BackupManagerService$FullParams;
    :catchall_7
    move-exception v3

    monitor-exit v9
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_7

    throw v3

    .line 772
    :catchall_8
    move-exception v3

    :try_start_19
    monitor-exit v9
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_8

    throw v3

    .line 797
    .restart local v24       #params:Lcom/android/server/BackupManagerService$FullParams;
    :cond_c
    :try_start_1a
    const-string v3, "BackupManagerService"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "couldn\'t find params for token "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p1

    iget v11, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v3, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_7

    goto :goto_7

    .line 792
    :catch_a
    move-exception v3

    goto :goto_7

    .line 549
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_7
        :pswitch_9
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_6
        :pswitch_a
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method