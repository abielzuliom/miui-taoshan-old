.class public Landroid/preference/PreferenceFrameLayout$LayoutParams;
.super Landroid/widget/FrameLayout$LayoutParams;
.source "PreferenceFrameLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/preference/PreferenceFrameLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field public removeBorders:Z


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .parameter "width"
    .parameter "height"

    .prologue
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/preference/PreferenceFrameLayout$LayoutParams;->removeBorders:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .parameter "c"
    .parameter "attrs"

    .prologue
    const/4 v2, 0x0

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-boolean v2, p0, Landroid/preference/PreferenceFrameLayout$LayoutParams;->removeBorders:Z

    sget-object v1, Lcom/android/internal/R$styleable;->PreferenceFrameLayout_Layout:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {v0, v2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Landroid/preference/PreferenceFrameLayout$LayoutParams;->removeBorders:Z

    iget-boolean v1, p0, Landroid/preference/PreferenceFrameLayout$LayoutParams;->removeBorders:Z

    invoke-static {p1, v1}, Landroid/preference/Injector$PreferenceFrameLayoutHook;->isRemoveBorders(Landroid/content/Context;Z)Z

    move-result v1

    iput-boolean v1, p0, Landroid/preference/PreferenceFrameLayout$LayoutParams;->removeBorders:Z

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method
