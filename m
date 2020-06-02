From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH] drm/atomic-helper: reset vblank on crtc reset
Date: Tue, 2 Jun 2020 11:43:59 +0200
Message-ID: <20200602094359.GA20149@phenom.ffwll.local>
References: <20200527094757.1414174-2-daniel.vetter@ffwll.ch>
 <20200527095332.1439425-1-daniel.vetter@ffwll.ch>
 <20200530032258.GD5961@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200530032258.GD5961-N3hz7ZxfLydczECFQUw77jytWr6r+dGw0E9HWUfgJXw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Tetsuo Handa <penguin-kernel-JPay3/Yim36HaxMnTkn67Xf5DAMn2ifp@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mihail Atanassov <mihail.atanassov-5wv7dgnIgG8@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Emil Velikov <emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "James (Qian) Wang" <james.qian.wang-5wv7dgnIgG8@public.gmane.org>, syzbot+0871b14ca2e2fb64f6e3-Pl5Pbv+GP7P466ipTTIvnc23WoclnBCfAL8bYrjMMd8@public.gmane.org, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Intel
List-Id: linux-tegra@vger.kernel.org

On Sat, May 30, 2020 at 06:22:58AM +0300, Laurent Pinchart wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> On Wed, May 27, 2020 at 11:53:32AM +0200, Daniel Vetter wrote:
> > Only when vblanks are supported ofc.
> > 
> > Some drivers do this already, but most unfortunately missed it. This
> > opens up bugs after driver load, before the crtc is enabled for the
> > first time. syzbot spotted this when loading vkms as a secondary
> > output. Given how many drivers are buggy it's best to solve this once
> > and for all in shared helper code.
> > 
> > Aside from moving the few existing calls to drm_crtc_vblank_reset into
> > helpers (i915 doesn't use helpers, so keeps its own) I think the
> > regression risk is minimal: atomic helpers already rely on drivers
> > calling drm_crtc_vblank_on/off correctly in their hooks when they
> > support vblanks. And driver that's failing to handle vblanks after
> > this is missing those calls already, and vblanks could only work by
> > accident when enabling a CRTC for the first time right after boot.
> > 
> > Big thanks to Tetsuo for helping track down what's going wrong here.
> > 
> > There's only a few drivers which already had the necessary call and
> > needed some updating:
> > - komeda, atmel and tidss also needed to be changed to call
> >   __drm_atomic_helper_crtc_reset() intead of open coding it
> > - tegra and msm even had it in the same place already, just code
> >   motion, and malidp already uses __drm_atomic_helper_crtc_reset().
> 
> Have you intentionally not touched drivers that use
> drm_crtc_vblank_off() at init time instead of drm_crtc_vblank_reset() ?
> I'm thinking about omapdrm and rcar-du that both call neither
> drm_crtc_vblank_reset() nor __drm_atomic_helper_crtc_reset() in their
> CRTC reset handler, and call drm_crtc_vblank_off() at init time. Should
> these (and likely other) drivers be updated ?

Good catch, I think we should remove those too with this patch.

I also used that opportunity to review all callers fo drm_crtc_vblank_off,
and I found two bogus callers in malidp and hdlcd. But only in the unload
code, so doesn't matter much.

I'll resend a new version.
-Daniel

> Other than that the patch looks good to me,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> 
> > Only call left is in i915, which doesn't use drm_mode_config_reset,
> > but has its own fastboot infrastructure. So that's the only case where
> > we actually want this in the driver still.
> > 
> > I've also reviewed all other drivers which set up vblank support with
> > drm_vblank_init. After the previous patch fixing mxsfb all atomic
> > drivers do call drm_crtc_vblank_on/off as they should, the remaining
> > drivers are either legacy kms or legacy dri1 drivers, so not affected
> > by this change to atomic helpers.
> > 
> > v2: Use the drm_dev_has_vblank() helper.
> > 
> > Link: https://syzkaller.appspot.com/bug?id=0ba17d70d062b2595e1f061231474800f076c7cb
> > Reported-by: Tetsuo Handa <penguin-kernel-JPay3/Yim36HaxMnTkn67Xf5DAMn2ifp@public.gmane.org>
> > Reported-by: syzbot+0871b14ca2e2fb64f6e3-Pl5Pbv+GP7P466ipTTIvnc23WoclnBCfAL8bYrjMMd8@public.gmane.org
> > Cc: Tetsuo Handa <penguin-kernel-JPay3/Yim36HaxMnTkn67Xf5DAMn2ifp@public.gmane.org>
> > Cc: "James (Qian) Wang" <james.qian.wang-5wv7dgnIgG8@public.gmane.org>
> > Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mihail Atanassov <mihail.atanassov-5wv7dgnIgG8@public.gmane.org>
> > Cc: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
> > Cc: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
> > Cc: Boris Brezillon <bbrezillon-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> > Cc: Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> > Cc: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > Cc: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
> > Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
> > Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
> > Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Cc: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
> > Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> > Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Cc: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
> > Cc: Emil Velikov <emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> > Cc: zhengbin <zhengbin13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> > Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> > Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Signed-off-by: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 7 ++-----
> >  drivers/gpu/drm/arm/malidp_drv.c                 | 1 -
> >  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c   | 7 ++-----
> >  drivers/gpu/drm/drm_atomic_state_helper.c        | 4 ++++
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c        | 2 --
> >  drivers/gpu/drm/tegra/dc.c                       | 1 -
> >  drivers/gpu/drm/tidss/tidss_crtc.c               | 3 +--
> >  drivers/gpu/drm/tidss/tidss_kms.c                | 4 ----
> >  8 files changed, 9 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > index 56bd938961ee..f33418d6e1a0 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > @@ -492,10 +492,8 @@ static void komeda_crtc_reset(struct drm_crtc *crtc)
> >  	crtc->state = NULL;
> >  
> >  	state = kzalloc(sizeof(*state), GFP_KERNEL);
> > -	if (state) {
> > -		crtc->state = &state->base;
> > -		crtc->state->crtc = crtc;
> > -	}
> > +	if (state)
> > +		__drm_atomic_helper_crtc_reset(crtc, &state->base);
> >  }
> >  
> >  static struct drm_crtc_state *
> > @@ -616,7 +614,6 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
> >  		return err;
> >  
> >  	drm_crtc_helper_add(crtc, &komeda_crtc_helper_funcs);
> > -	drm_crtc_vblank_reset(crtc);
> >  
> >  	crtc->port = kcrtc->master->of_output_port;
> >  
> > diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> > index c2507b7d8512..02904392e370 100644
> > --- a/drivers/gpu/drm/arm/malidp_drv.c
> > +++ b/drivers/gpu/drm/arm/malidp_drv.c
> > @@ -870,7 +870,6 @@ static int malidp_bind(struct device *dev)
> >  	drm->irq_enabled = true;
> >  
> >  	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> > -	drm_crtc_vblank_reset(&malidp->crtc);
> >  	if (ret < 0) {
> >  		DRM_ERROR("failed to initialise vblank\n");
> >  		goto vblank_fail;
> > diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > index 10985134ce0b..ce246b96330b 100644
> > --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > @@ -411,10 +411,8 @@ static void atmel_hlcdc_crtc_reset(struct drm_crtc *crtc)
> >  	}
> >  
> >  	state = kzalloc(sizeof(*state), GFP_KERNEL);
> > -	if (state) {
> > -		crtc->state = &state->base;
> > -		crtc->state->crtc = crtc;
> > -	}
> > +	if (state)
> > +		__drm_atomic_helper_crtc_reset(crtc, &state->base);
> >  }
> >  
> >  static struct drm_crtc_state *
> > @@ -528,7 +526,6 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
> >  	}
> >  
> >  	drm_crtc_helper_add(&crtc->base, &lcdc_crtc_helper_funcs);
> > -	drm_crtc_vblank_reset(&crtc->base);
> >  
> >  	drm_mode_crtc_set_gamma_size(&crtc->base, ATMEL_HLCDC_CLUT_SIZE);
> >  	drm_crtc_enable_color_mgmt(&crtc->base, 0, false,
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > index 8fce6a115dfe..9ad74045158e 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -32,6 +32,7 @@
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_plane.h>
> >  #include <drm/drm_print.h>
> > +#include <drm/drm_vblank.h>
> >  #include <drm/drm_writeback.h>
> >  
> >  #include <linux/slab.h>
> > @@ -93,6 +94,9 @@ __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
> >  	if (crtc_state)
> >  		__drm_atomic_helper_crtc_state_reset(crtc_state, crtc);
> >  
> > +	if (drm_dev_has_vblank(crtc->dev))
> > +		drm_crtc_vblank_reset(crtc);
> > +
> >  	crtc->state = crtc_state;
> >  }
> >  EXPORT_SYMBOL(__drm_atomic_helper_crtc_reset);
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > index ca3368c828d0..9606185c284b 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > @@ -1117,8 +1117,6 @@ static void mdp5_crtc_reset(struct drm_crtc *crtc)
> >  		mdp5_crtc_destroy_state(crtc, crtc->state);
> >  
> >  	__drm_atomic_helper_crtc_reset(crtc, &mdp5_cstate->base);
> > -
> > -	drm_crtc_vblank_reset(crtc);
> >  }
> >  
> >  static const struct drm_crtc_funcs mdp5_crtc_funcs = {
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 83f31c6e891c..9b308b572eac 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -1168,7 +1168,6 @@ static void tegra_crtc_reset(struct drm_crtc *crtc)
> >  		tegra_crtc_atomic_destroy_state(crtc, crtc->state);
> >  
> >  	__drm_atomic_helper_crtc_reset(crtc, &state->base);
> > -	drm_crtc_vblank_reset(crtc);
> >  }
> >  
> >  static struct drm_crtc_state *
> > diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> > index 89a226912de8..4d01c4af61cd 100644
> > --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> > +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> > @@ -352,8 +352,7 @@ static void tidss_crtc_reset(struct drm_crtc *crtc)
> >  		return;
> >  	}
> >  
> > -	crtc->state = &tcrtc->base;
> > -	crtc->state->crtc = crtc;
> > +	__drm_atomic_helper_crtc_reset(crtc, &tcrtc->base);
> >  }
> >  
> >  static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_crtc *crtc)
> > diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> > index 4b99e9fa84a5..e6ab59eed259 100644
> > --- a/drivers/gpu/drm/tidss/tidss_kms.c
> > +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> > @@ -278,10 +278,6 @@ int tidss_modeset_init(struct tidss_device *tidss)
> >  	if (ret)
> >  		return ret;
> >  
> > -	/* Start with vertical blanking interrupt reporting disabled. */
> > -	for (i = 0; i < tidss->num_crtcs; ++i)
> > -		drm_crtc_vblank_reset(tidss->crtcs[i]);
> > -
> >  	drm_mode_config_reset(ddev);
> >  
> >  	dev_dbg(tidss->dev, "%s done\n", __func__);
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
