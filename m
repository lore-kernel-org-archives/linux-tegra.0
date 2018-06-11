From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm: nouveau: Enable gp20b/gp10b firmware tag
 when relevant
Date: Mon, 11 Jun 2018 13:10:26 +0200
Message-ID: <20180611111026.GB31977@ulmo>
References: <20180610110131.10490-1-kwizart@gmail.com>
 <20180611083319.GA31977@ulmo>
 <CABr+WTk19So=oLbQ0UMLza5HGRo7QvCyZdcOw25zH42oAELLqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1833297901=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CABr+WTk19So=oLbQ0UMLza5HGRo7QvCyZdcOw25zH42oAELLqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============1833297901==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 11, 2018 at 11:32:53AM +0200, Nicolas Chauvet wrote:
> 2018-06-11 10:33 GMT+02:00 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> > On Sun, Jun 10, 2018 at 01:01:31PM +0200, Nicolas Chauvet wrote:
> >> This allows to have the related MODULE_FIRMWARE tag only
> >> on relevant arch (arm64).
> >> This will saves about 400k on initramfs when not relevant
> >>
> >> Signed-off-by: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c | 2 ++
> >>  drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c | 2 ++
> >>  2 files changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> >> index 30491d132d59..df8b919dcf09 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> >> @@ -129,6 +129,7 @@ gm20b_secboot_new(struct nvkm_device *device, int index,
> >>       return 0;
> >>  }
> >>
> >> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
> >>  MODULE_FIRMWARE("nvidia/gm20b/acr/bl.bin");
> >>  MODULE_FIRMWARE("nvidia/gm20b/acr/ucode_load.bin");
> >>  MODULE_FIRMWARE("nvidia/gm20b/gr/fecs_bl.bin");
> >> @@ -144,3 +145,4 @@ MODULE_FIRMWARE("nvidia/gm20b/gr/sw_method_init.bin");
> >>  MODULE_FIRMWARE("nvidia/gm20b/pmu/desc.bin");
> >>  MODULE_FIRMWARE("nvidia/gm20b/pmu/image.bin");
> >>  MODULE_FIRMWARE("nvidia/gm20b/pmu/sig.bin");
> >> +#endif
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> >> index 632e9545e292..28ca29d0eeee 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> >> @@ -74,6 +74,7 @@ gp10b_secboot_new(struct nvkm_device *device, int index,
> >>       return 0;
> >>  }
> >>
> >> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
> >>  MODULE_FIRMWARE("nvidia/gp10b/acr/bl.bin");
> >>  MODULE_FIRMWARE("nvidia/gp10b/acr/ucode_load.bin");
> >>  MODULE_FIRMWARE("nvidia/gp10b/gr/fecs_bl.bin");
> >> @@ -91,3 +92,4 @@ MODULE_FIRMWARE("nvidia/gp10b/gr/sw_method_init.bin");
> >>  MODULE_FIRMWARE("nvidia/gp10b/pmu/desc.bin");
> >>  MODULE_FIRMWARE("nvidia/gp10b/pmu/image.bin");
> >>  MODULE_FIRMWARE("nvidia/gp10b/pmu/sig.bin");
> >> +#endif
> >
> > I suppose that makes sense, so:
> >
> > Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > On a side-note, I was checking for what we do for gk20a, but it seems
> > like we don't have MODULE_FIRMWARE() entries for Tegra124. How do we
> > make sure that firmware is automatically pulled into initramfs on the
> > Tegra124 devices?
> The MODULE_FIRMWARE entries related to gtk20a are located in
> drivers/gpu/drm/nouveau/nouveau_platform.c
> This file is only built when using ARCH_TEGRA.
> I'm not aware that nouveau can build a gk20a only driver, so moving
> theses entries to a gk20a specific file will have the same effect at
> this time.

Huh... you're right. I must've screwed up my git grep invocation. All
looks well, then.

Thierry

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlseWJ8ACgkQ3SOs138+
s6FrYw//SHmEb9fzBk4qFdwWRumfk6I8yPl+piewuy3Cw5kjf1OMWJQIgXvIrpJn
ox1DmYDCgvcKRUOk/iBSHhnF6uRFgJjgutRENI8C41F6tGoG06W4OLZVfiAE/DId
SIbolizoEJbEnT2nbwhmtlOsEeESRnqL7GPzrbY9xjbmHVEpC0OpqP9orJ/VnFog
+H8ybJs5csG9meOddRrFY8tU4GM3SIwKnF3dE2nVTrLqrD5tScJHvzXVdh12v0Ys
wrV0zw5HdHnqI4/0a0nESQHueCExSFM1AFJAdsrnxPHzpbw73I78jMOBU6nvat8N
HVj+o0c/qKTMXazNohCm+49M2Usv1r9njS5b2J3GTyXK9U8tORNbPPNc4TX5aASl
gkdz8vC+5dHNzuDYr2Tnc+0J7q6Cq3LX51OK6PfB8bXaFWlLB8E349wxIiJ0faxr
xeZkHQmE77JzHqMTPND+Qm//4Djq+pPBgBbE+lhHaU8thJNHCaYvgournohpl0xJ
hE7gzZ4PxjG389ErscdZCKqbGPmf3LQo1x7lj84gfEcLix3shUDF4Cf6g68speHO
a/hKfyyW8/MmuV8a/gxiA39G1tLWmkUiIL4fyAG0oFNS7fpYAqFChhCd9l1i7dQm
pjkNAi3g+qI1S13pRBfYEkaIOyMrnveqLLSyCOu+7OsnvIwvgUo=
=OoMq
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--

--===============1833297901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1833297901==--
