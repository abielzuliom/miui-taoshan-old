.class abstract Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;
.super Ljava/lang/Object;
.source "MiuiGlobalActions.java"

# interfaces
.implements Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MiuiGlobalActions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "ToggleAction"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;
    }
.end annotation


# instance fields
.field protected mDisabledIconResid:I

.field protected mDisabledStatusMessageResId:I

.field protected mEnabledIconResId:I

.field protected mEnabledStatusMessageResId:I

.field protected mMessageResId:I

.field protected mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;


# direct methods
.method public constructor <init>(IIIII)V
    .locals 1
    .parameter "enabledIconResId"
    .parameter "disabledIconResid"
    .parameter "essage"
    .parameter "enabledStatusMessageResId"
    .parameter "disabledStatusMessageResId"

    .prologue
    .line 596
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 576
    sget-object v0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->Off:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    .line 597
    iput p1, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mEnabledIconResId:I

    .line 598
    iput p2, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mDisabledIconResid:I

    .line 599
    iput p3, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mMessageResId:I

    .line 600
    iput p4, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mEnabledStatusMessageResId:I

    .line 601
    iput p5, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mDisabledStatusMessageResId:I

    .line 602
    return-void
.end method


# virtual methods
.method protected changeStateFromPress(Z)V
    .locals 1
    .parameter "buttonOn"

    .prologue
    .line 671
    if-eqz p1, :cond_0

    sget-object v0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->On:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    :goto_0
    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    .line 672
    return-void

    .line 671
    :cond_0
    sget-object v0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->Off:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    goto :goto_0
.end method

.method public create(Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 8
    .parameter "context"
    .parameter "convertView"
    .parameter "parent"
    .parameter "inflater"

    .prologue
    const/4 v3, 0x0

    .line 614
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->willCreate()V

    .line 616
    const v6, 0x603000c

    invoke-virtual {p4, v6, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 619
    .local v5, v:Landroid/view/ViewGroup;
    const v6, 0x1020006

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 620
    .local v1, icon:Landroid/widget/ImageView;
    const v6, 0x102000b

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 621
    .local v2, messageView:Landroid/widget/TextView;
    const v6, 0x60b0084

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 622
    .local v4, statusView:Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->isEnabled()Z

    move-result v0

    .line 624
    .local v0, enabled:Z
    if-eqz v2, :cond_0

    .line 625
    iget v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mMessageResId:I

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(I)V

    .line 626
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 629
    :cond_0
    iget-object v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    sget-object v7, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->On:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    if-eq v6, v7, :cond_1

    iget-object v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    sget-object v7, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->TurningOn:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    if-ne v6, v7, :cond_2

    :cond_1
    const/4 v3, 0x1

    .line 630
    .local v3, on:Z
    :cond_2
    if-eqz v1, :cond_3

    .line 631
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    if-eqz v3, :cond_6

    iget v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mEnabledIconResId:I

    :goto_0
    invoke-virtual {v7, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 633
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 636
    :cond_3
    if-eqz v4, :cond_4

    .line 637
    if-eqz v3, :cond_7

    iget v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mEnabledStatusMessageResId:I

    :goto_1
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(I)V

    .line 638
    const/16 v6, 0x8

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 639
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 641
    :cond_4
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->setEnabled(Z)V

    .line 642
    const v6, 0x60c0014

    iget v7, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mMessageResId:I

    if-ne v6, v7, :cond_5

    .line 643
    const v6, 0x6010038

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->setAdditionalState(I)V

    .line 646
    :cond_5
    return-object v5

    .line 631
    :cond_6
    iget v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mDisabledIconResid:I

    goto :goto_0

    .line 637
    :cond_7
    iget v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mDisabledStatusMessageResId:I

    goto :goto_1
.end method

.method public isEnabled()Z
    .locals 1

    .prologue
    .line 661
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->inTransition()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final onPress()V
    .locals 3

    .prologue
    .line 650
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->inTransition()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 651
    const-string v1, "GlobalActions"

    const-string v2, "shouldn\'t be able to toggle when in transition"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 658
    :goto_0
    return-void

    .line 655
    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    sget-object v2, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->On:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    if-eq v1, v2, :cond_1

    const/4 v0, 0x1

    .line 656
    .local v0, nowOn:Z
    :goto_1
    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->onToggle(Z)V

    .line 657
    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->changeStateFromPress(Z)V

    goto :goto_0

    .line 655
    .end local v0           #nowOn:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method abstract onToggle(Z)V
.end method

.method public updateState(Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;)V
    .locals 0
    .parameter "state"

    .prologue
    .line 677
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    .line 678
    return-void
.end method

.method willCreate()V
    .locals 0

    .prologue
    .line 610
    return-void
.end method
