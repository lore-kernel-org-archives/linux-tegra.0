From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 8/8] drm: tegra: Add gr2d device
Date: Fri, 8 Feb 2013 08:07:34 +0100
Message-ID: <20130208070734.GB15429@avionic-0098.mockup.avionic-design.de>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com>
 <1358250244-9678-9-git-send-email-tbergstrom@nvidia.com>
 <20130204125618.GD595@avionic-0098.mockup.avionic-design.de>
 <511095F9.6040607@nvidia.com>
 <20130205095403.GF20437@avionic-0098.mockup.avionic-design.de>
 <5112C9C5.8080205@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5112C9C5.8080205-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 01:23:17PM -0800, Terje Bergstr=C3=B6m wrote:
> On 05.02.2013 01:54, Thierry Reding wrote:
> > On Mon, Feb 04, 2013 at 09:17:45PM -0800, Terje Bergstr=C3=B6m wrote:
> >> Yeah, it's actually working around the host1x duplicate naming.
> >> host1x_syncpt_get takes struct host1x as parameter, but that's differe=
nt
> >> host1x than in this code.
> >=20
> > So maybe a better way would be to rename the DRM host1x after all. If it
> > avoids the need for workarounds such as this I think it justifies the
> > additional churn.
>=20
> Ok, I'll include that. Do you have a preference for the name? Something
> like "host1x_drm" might work?

Yes, that sounds good.

> >>> Also, how useful is it to create a context? Looking at the gr2d
> >>> implementation for .open_channel(), it will return the same channel to
> >>> whichever userspace process requests them. Can you explain why it is
> >>> necessary at all? From the name I would have expected some kind of
> >>> context switching to take place when different applications submit
> >>> requests to the same client, but that doesn't seem to be the case.
> >>
> >> Hardware context switching will be a later submit, and it'll actually
> >> create a new structure. Hardware context might live longer than the
> >> process that created it, so they'll need to be separate.
> >=20
> > Why would it live longer than the process? Isn't the whole purpose of
> > the context to keep per-process state? What use is that state if the
> > process dies?
>=20
> Hardware context has to be kept alive for as long as there's a job
> running from that process. If an app sends 10 jobs to 2D channel, and
> dies immediately, there's no sane way for host1x to remove the jobs from
> queue. The jobs will keep on running and kernel will need to track them.

Okay, I understand now. There was one additional thing that I wanted to
point out, but the context is gone now. I'll go through the patch again
and reply there.

> > I fail to see how dma_buf would require a separate mem_mgr_type. Can we
> > perhaps postpone this to a later point and just go with CMA as the only
> > alternative for now until we have an actual working implementation that
> > we can use this for?
>=20
> Each submit refers to a number of buffers. Some of them are the streams,
> some are textures or other input/output buffers. Each of these buffers
> might be passed as a GEM handle, or (when implemented) as a dma_buf fd.
> Thus we need a field to tell host1x which API to call to handle that hand=
le.

Understood.

> I think we can leave out the code for managing the type until we
> actually have separate memory managers. That'd make GEM handles
> effectively of type 0, as we don't set it.

I think that's a good idea. Let's start simple for now and who knows
what else will have changed by the time we get to implement dma_buf.
Maybe Lucas will have finished his work on the allocator and we will
need to synchronize with that anyway.

> >>>> +static int gr2d_submit(struct host1x_drm_context *context,
> >>>> +             struct tegra_drm_submit_args *args,
> >>>> +             struct drm_device *drm,
> >>>> +             struct drm_file *file_priv)
> >>>> +{
> >>>> +     struct host1x_job *job;
> >>>> +     int num_cmdbufs =3D args->num_cmdbufs;
> >>>> +     int num_relocs =3D args->num_relocs;
> >>>> +     int num_waitchks =3D args->num_waitchks;
> >>>> +     struct tegra_drm_cmdbuf __user *cmdbufs =3D
> >>>> +             (void * __user)(uintptr_t)args->cmdbufs;
> >>>> +     struct tegra_drm_reloc __user *relocs =3D
> >>>> +             (void * __user)(uintptr_t)args->relocs;
> >>>> +     struct tegra_drm_waitchk __user *waitchks =3D
> >>>> +             (void * __user)(uintptr_t)args->waitchks;
> >>>
> >>> No need for all the uintptr_t casts.
> >>
> >> Will try to remove - but I do remember getting compiler warnings witho=
ut
> >> them.
> >=20
> > I think you shouldn't even have to cast to void * first. Just cast to
> > the target type directly. I don't see why the compiler should complain.
>=20
> This is what I get without them:
>=20
> drivers/gpu/host1x/drm/gr2d.c:108:3: warning: cast to pointer from
> integer of different size [-Wint-to-pointer-cast]
> drivers/gpu/host1x/drm/gr2d.c:110:3: warning: cast to pointer from
> integer of different size [-Wint-to-pointer-cast]
> drivers/gpu/host1x/drm/gr2d.c:112:3: warning: cast to pointer from
> integer of different size [-Wint-to-pointer-c
>=20
> The problem is that the fields are __u64's and can't be cast directly
> into 32-bit pointers.

Alright.

> >> That's the security firewall. It walks through each submit, and ensures
> >> that each register write that writes an address, goes through the host=
1x
> >> reloc mechanism. This way user space cannot ask 2D to write to arbitra=
ry
> >> memory locations.
> >=20
> > I see. Can this be made more generic? Perhaps adding a table of valid
> > registers to the device and use a generic function to iterate over that
> > instead of having to provide the same function for each client.
>=20
> For which one does gcc generate more efficient code? I've thought a
> switch-case statement might get compiled into something more efficient
> than a table lookup.
>=20
> But the rest of the code is generic - just the one function which
> compares against known address registers is specific to 2D.

Table lookup should be pretty fast. I wouldn't worry too much about
performance at this stage, though. Readability is more important in my
opinion. A lookup table is a lot more readable and reusable I think. If
it turns out that using a function is actually faster we can always
optimize later.

Thierry

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRFKQ2AAoJEN0jrNd/PrOhVYoP/iV+7yD/9vH6OM3LhBJCqzk8
w+UYfDwjvKB0h2ZXSrMt0pqnhhO/8kF+RclXHwcVmfHVwcKAAv8G7SOiRxFBd2qd
8om+OwMUXqLOUklZqpyDJrbhkgJ9b339vHuFtiX7+BmmJuHhCOmK3OjZ+IssL3dk
hYi0XiOnXFXPKsZBrrSGPgMZtSlXist0cuD7h375YY54nUJSmRvirmIXV2ExhzHQ
g3FEFHUCUmW49i4UdEVP+/JxIKGne4SkrCsretDdCv6jG3vihEbH22bqWdc+LRCH
omvrrv4XYHE8C4Bss6hh8mYCEV71vHJlwxY3qZN8U8z9vqtzipXfl5S/aNvN5FAz
zwH2xEMudgUpAwXVKMG7otJ27XOdpsttsf4DHueO3FSnn2FEzFpXvo1OQRJWQgwQ
TP028Oz7YUhxg/tL07+Bqrd3PAGNuhY3MRSZ8PnFSvMiC/xNv6xlVCHVtp2W0+XC
BVTQvEByM6cK8jLep3CIvdu89GkbRC5sWJjqcHodxCBxvcvFvsFZXgHeOGtIGi7D
KX/+ZhN/scTtMw/bVNGAHzx9F396Dy/IITHXYGMaOrPDCGtT7Hw8sWFvFA0sZnif
f0uS+MHUUsNijBdqiDhdba0+A+jb8orBSKwh5Oid1uFYvKO8OiOA2B62S38DwXRV
9JaZ46Vltkz0/BNThcj6
=vA7d
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
