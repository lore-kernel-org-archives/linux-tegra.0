From: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
Subject: Re: [PATCH 1/8] drm/atomic-helper: reset vblank on crtc reset
Date: Wed, 24 Jun 2020 11:42:03 +0200
Message-ID: <20200624094203.5dw267lb4c7ongvy@gilmour.lan>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200612160056.2082681-1-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Boris Brezillon <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tetsuo Handa <penguin-kernel-1yMVhJb1mP/7nzcFbJAaVXf5DAMn2ifp@public.gmane.org>, syzbot+0871b14ca2e2fb64f6e3-Pl5Pbv+GP7P466ipTTIvnc23WoclnBCfAL8bYrjMMd8@public.gmane.org, "James (Qian) Wang" <james.qian.wang-5wv7dgnIgG8@public.gmane.org>, Mihail Atanassov <mihail.atanassov-5wv7dgnIgG8@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Boris Brezillon <bbrezillon-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>Maarten Lankhorst <m>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 06:00:49PM +0200, Daniel Vetter wrote:
> Only when vblanks are supported ofc.
>=20
> Some drivers do this already, but most unfortunately missed it. This
> opens up bugs after driver load, before the crtc is enabled for the
> first time. syzbot spotted this when loading vkms as a secondary
> output. Given how many drivers are buggy it's best to solve this once
> and for all in shared helper code.
>=20
> Aside from moving the few existing calls to drm_crtc_vblank_reset into
> helpers (i915 doesn't use helpers, so keeps its own) I think the
> regression risk is minimal: atomic helpers already rely on drivers
> calling drm_crtc_vblank_on/off correctly in their hooks when they
> support vblanks. And driver that's failing to handle vblanks after
> this is missing those calls already, and vblanks could only work by
> accident when enabling a CRTC for the first time right after boot.
>=20
> Big thanks to Tetsuo for helping track down what's going wrong here.
>=20
> There's only a few drivers which already had the necessary call and
> needed some updating:
> - komeda, atmel and tidss also needed to be changed to call
>   __drm_atomic_helper_crtc_reset() intead of open coding it
> - tegra and msm even had it in the same place already, just code
>   motion, and malidp already uses __drm_atomic_helper_crtc_reset().
>=20
> Only call left is in i915, which doesn't use drm_mode_config_reset,
> but has its own fastboot infrastructure. So that's the only case where
> we actually want this in the driver still.
>=20
> I've also reviewed all other drivers which set up vblank support with
> drm_vblank_init. After the previous patch fixing mxsfb all atomic
> drivers do call drm_crtc_vblank_on/off as they should, the remaining
> drivers are either legacy kms or legacy dri1 drivers, so not affected
> by this change to atomic helpers.
>=20
> v2: Use the drm_dev_has_vblank() helper.
>=20
> v3: Laurent pointed out that omap and rcar-du used drm_crtc_vblank_off
> instead of drm_crtc_vblank_reset. Adjust them too.
>=20
> v4: Laurent noticed that rcar-du and omap open-code their crtc reset
> and hence would actually be broken by this patch now. So fix them up
> by reusing the helpers, which brings the drm_crtc_vblank_reset() back.
>=20
> Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Reviewed-by: Boris Brezillon <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Acked-by: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Link: https://syzkaller.appspot.com/bug?id=3D0ba17d70d062b2595e1f06123147=
4800f076c7cb
> Reported-by: Tetsuo Handa <penguin-kernel-JPay3/Yim36HaxMnTkn67Xf5DAMn2ifp@public.gmane.org>
> Reported-by: syzbot+0871b14ca2e2fb64f6e3-Pl5Pbv+GP7P466ipTTIvnc23WoclnBCfAL8bYrjMMd8@public.gmane.org
> Cc: Tetsuo Handa <penguin-kernel-JPay3/Yim36HaxMnTkn67Xf5DAMn2ifp@public.gmane.org>
> Cc: "James (Qian) Wang" <james.qian.wang-5wv7dgnIgG8@public.gmane.org>
> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> Cc: Mihail Atanassov <mihail.atanassov-5wv7dgnIgG8@public.gmane.org>
> Cc: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
> Cc: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
> Cc: Boris Brezillon <bbrezillon-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> Cc: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
> Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
> Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
> Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
> Cc: Emil Velikov <emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Cc: zhengbin <zhengbin13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Acked-by: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Maxime
