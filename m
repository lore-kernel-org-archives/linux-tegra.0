From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] drm/tegra: Convert drm_atomic_helper_suspend/resume()
Date: Tue, 18 Sep 2018 17:16:29 +0530
Message-ID: <CAFqt6zZ++D4uDcKnqS=sty82DJCdqMXNMrOOZcxFYdqWNJBLCw@mail.gmail.com>
References: <20180731200705.GA21510@jordon-HP-15-Notebook-PC>
 <CAFqt6zZM_MzAo8vEZ3+C3W6E-xE_78acnNvmMYoPVgYuxaMvGA@mail.gmail.com> <CAFqt6zYTzErgrE_vM0dUJn8FGcBxHHeM9thJbRtHdEXKQQMdtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFqt6zYTzErgrE_vM0dUJn8FGcBxHHeM9thJbRtHdEXKQQMdtA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, airlied@linux.ie, jonathanh@nvidia.com, Ajit Linux <ajitn.linux@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 10, 2018 at 12:16 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> On Mon, Aug 6, 2018 at 11:42 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
> >
> > On Wed, Aug 1, 2018 at 1:37 AM, Souptick Joarder <jrdr.linux@gmail.com> wrote:
> > > convert drm_atomic_helper_suspend/resume() to use
> > > drm_mode_config_helper_suspend/resume().
> > >
> > > With this conversion, tegra_drm_fb_suspend() and
> > > tegra_drm_fb_resume() wil not be used anymore.
> > > Both of these functions can be removed.
> > >
> > > Also, in tegra_drm struct's member state will not be
> > > used anymore. So this can be removed forever.
> > >
> > > Fixed one sparse warning.
> > >
> > > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > > Signed-off-by: Ajit Negi <ajitn.linux@gmail.com>
> > > ---
> >
> > Any comment on this patch ?
>
> If no comment, can we get this patch in queue for 4.20 ?

David/ Daniel,
is this patch [1] good to go in 4.20 ?

[1] https://lkml.org/lkml/2018/7/31/839

> >
> > >  drivers/gpu/drm/tegra/drm.c | 20 ++------------------
> > >  drivers/gpu/drm/tegra/drm.h |  4 ----
> > >  drivers/gpu/drm/tegra/fb.c  | 24 +-----------------------
> > >  3 files changed, 3 insertions(+), 45 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > > index a2bd587..9a0efce 100644
> > > --- a/drivers/gpu/drm/tegra/drm.c
> > > +++ b/drivers/gpu/drm/tegra/drm.c
> > > @@ -1212,31 +1212,15 @@ static int host1x_drm_remove(struct host1x_device *dev)
> > >  static int host1x_drm_suspend(struct device *dev)
> > >  {
> > >         struct drm_device *drm = dev_get_drvdata(dev);
> > > -       struct tegra_drm *tegra = drm->dev_private;
> > > -
> > > -       drm_kms_helper_poll_disable(drm);
> > > -       tegra_drm_fb_suspend(drm);
> > > -
> > > -       tegra->state = drm_atomic_helper_suspend(drm);
> > > -       if (IS_ERR(tegra->state)) {
> > > -               tegra_drm_fb_resume(drm);
> > > -               drm_kms_helper_poll_enable(drm);
> > > -               return PTR_ERR(tegra->state);
> > > -       }
> > >
> > > -       return 0;
> > > +       return drm_mode_config_helper_suspend(drm);
> > >  }
> > >
> > >  static int host1x_drm_resume(struct device *dev)
> > >  {
> > >         struct drm_device *drm = dev_get_drvdata(dev);
> > > -       struct tegra_drm *tegra = drm->dev_private;
> > >
> > > -       drm_atomic_helper_resume(drm, tegra->state);
> > > -       tegra_drm_fb_resume(drm);
> > > -       drm_kms_helper_poll_enable(drm);
> > > -
> > > -       return 0;
> > > +       return drm_mode_config_helper_resume(drm);
> > >  }
> > >  #endif
> > >
> > > diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> > > index 92d2487..1012335 100644
> > > --- a/drivers/gpu/drm/tegra/drm.h
> > > +++ b/drivers/gpu/drm/tegra/drm.h
> > > @@ -60,8 +60,6 @@ struct tegra_drm {
> > >         unsigned int pitch_align;
> > >
> > >         struct tegra_display_hub *hub;
> > > -
> > > -       struct drm_atomic_state *state;
> > >  };
> > >
> > >  struct tegra_drm_client;
> > > @@ -186,8 +184,6 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
> > >  void tegra_drm_fb_free(struct drm_device *drm);
> > >  int tegra_drm_fb_init(struct drm_device *drm);
> > >  void tegra_drm_fb_exit(struct drm_device *drm);
> > > -void tegra_drm_fb_suspend(struct drm_device *drm);
> > > -void tegra_drm_fb_resume(struct drm_device *drm);
> > >
> > >  extern struct platform_driver tegra_display_hub_driver;
> > >  extern struct platform_driver tegra_dc_driver;
> > > diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> > > index 4c22cdd..b947e82 100644
> > > --- a/drivers/gpu/drm/tegra/fb.c
> > > +++ b/drivers/gpu/drm/tegra/fb.c
> > > @@ -356,7 +356,7 @@ static void tegra_fbdev_exit(struct tegra_fbdev *fbdev)
> > >                 /* Undo the special mapping we made in fbdev probe. */
> > >                 if (bo && bo->pages) {
> > >                         vunmap(bo->vaddr);
> > > -                       bo->vaddr = 0;
> > > +                       bo->vaddr = NULL;
> > >                 }
> > >
> > >                 drm_framebuffer_remove(fbdev->fb);
> > > @@ -412,25 +412,3 @@ void tegra_drm_fb_exit(struct drm_device *drm)
> > >         tegra_fbdev_exit(tegra->fbdev);
> > >  #endif
> > >  }
> > > -
> > > -void tegra_drm_fb_suspend(struct drm_device *drm)
> > > -{
> > > -#ifdef CONFIG_DRM_FBDEV_EMULATION
> > > -       struct tegra_drm *tegra = drm->dev_private;
> > > -
> > > -       console_lock();
> > > -       drm_fb_helper_set_suspend(&tegra->fbdev->base, 1);
> > > -       console_unlock();
> > > -#endif
> > > -}
> > > -
> > > -void tegra_drm_fb_resume(struct drm_device *drm)
> > > -{
> > > -#ifdef CONFIG_DRM_FBDEV_EMULATION
> > > -       struct tegra_drm *tegra = drm->dev_private;
> > > -
> > > -       console_lock();
> > > -       drm_fb_helper_set_suspend(&tegra->fbdev->base, 0);
> > > -       console_unlock();
> > > -#endif
> > > -}
> > > --
> > > 1.9.1
> > >
