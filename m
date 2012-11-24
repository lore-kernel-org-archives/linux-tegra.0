From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: tegra: Add auxiliary data for nvhost
Date: Sat, 24 Nov 2012 20:11:03 +0100
Message-ID: <20121124191103.GD26154@avionic-0098.adnet.avionic-design.de>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com>
 <1353577684-7896-3-git-send-email-tbergstrom@nvidia.com>
 <20121123234527.GE21555@avionic-0098.adnet.avionic-design.de>
 <50B07297.3090001@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50B07297.3090001-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 24, 2012 at 09:09:11AM +0200, Terje Bergstr=C3=B6m wrote:
> On 24.11.2012 01:45, Thierry Reding wrote:
> > I think I remember a discussion about this back when we designed the DT
> > bindings. The result I seem to remember was that since syncpoints can be
> > arbitrarily assigned they wouldn't have to be statically allocated at
> > compile time.
> > Instead we could just have them allocated when a host1x client registers
> > with host1x. Or have each client request its required syncpoints
> > explicitly. The latter would make it trivial to associate a label with
> > it.
>=20
> True. I didn't yet have time to implement dynamic allocation and I
> didn't want to wait for that to get the code out. I'll try to find time
> for that.

Okay, sounds good. I agree that it was good to post these patches soon.
The earlier they can be discussed and reviewed the better.

> >> +
> >> +static struct host1x_device_info host1x_info =3D {
> >> +	.nb_channels	=3D 8,
> >> +	.nb_pts		=3D 32,
> >> +	.nb_mlocks	=3D 16,
> >> +	.nb_bases	=3D 8,
> >> +	.syncpt_names	=3D host1x_syncpt_names,
> >> +	.client_managed	=3D NVSYNCPTS_CLIENT_MANAGED,
> >> +};
> >> +
> >> +static struct nvhost_device_data tegra_host1x_info =3D {
> >> +	.clocks =3D { {"host1x", UINT_MAX} },
> >> +	NVHOST_MODULE_NO_POWERGATE_IDS,
> >> +	.private_data =3D &host1x_info,
> >> +};
> >> +
> >> +static struct nvhost_device_data tegra_gr2d_info =3D {
> >> +	.index		=3D 2,
> >> +	.syncpts	=3D BIT(NVSYNCPT_2D_0) | BIT(NVSYNCPT_2D_1),
> >> +	.clocks		=3D { {"gr2d", UINT_MAX, true}, {"epp", UINT_MAX, true} },
> >> +	NVHOST_MODULE_NO_POWERGATE_IDS,
> >> +	.clockgate_delay =3D 0,
> >> +	.serialize	=3D true,
> >> +};
> >=20
> > Again, this doesn't seem like it should be statically configured in the
> > board data.
>=20
> The host1x specifics (number of channels, pts etc) are description of
> hardware, so they could go to a device tree binding.

I'm not sure that's even required. The number of syncpoints and channels
should be static for a particular version of SoC, right? In that case it
can be derived from the DT compatible property, can't it?

> The allocation of sync points is a software policy that could be handled
> by the driver.
>=20
> Clocks are waiting for the general discussion about clock bindings in
> device trees, but that data is SoC specific, so that's why I've put that
> in board data.
>=20
> Clock gating policy is software feature that could be in driver.
>=20
> >> diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach=
-tegra/tegra20_clocks_data.c
> >> index 7f049ac..3314e50 100644
> >> --- a/arch/arm/mach-tegra/tegra20_clocks_data.c
> >> +++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
> >> @@ -1041,10 +1041,10 @@ static struct clk_duplicate tegra_clk_duplicat=
es[] =3D {
> >>  	CLK_DUPLICATE("usbd",	"utmip-pad",	NULL),
> >>  	CLK_DUPLICATE("usbd",	"tegra-ehci.0",	NULL),
> >>  	CLK_DUPLICATE("usbd",	"tegra-otg",	NULL),
> >> -	CLK_DUPLICATE("2d",	"tegra_grhost",	"gr2d"),
> >> -	CLK_DUPLICATE("3d",	"tegra_grhost",	"gr3d"),
> >> -	CLK_DUPLICATE("epp",	"tegra_grhost",	"epp"),
> >> -	CLK_DUPLICATE("mpe",	"tegra_grhost",	"mpe"),
> >> +	CLK_DUPLICATE("2d",	NULL,		"gr2d"),
> >> +	CLK_DUPLICATE("3d",	NULL,		"gr3d"),
> >> +	CLK_DUPLICATE("epp",	NULL,		"epp"),
> >> +	CLK_DUPLICATE("mpe",	NULL,		"mpe"),
> >=20
> > Are these actually required here?
>=20
> I think we had problems in driver acquiring the clocks without this
> (mismatch of driver), but I could retry. The old bindings assumed that
> driver would be called "tegra_grhost", but that's not the case.

I hope that DT clock support will go into 3.9, in which case the issue
will just go away.

Thierry

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQsRvHAAoJEN0jrNd/PrOheBwP/R1mafKSCDWkDsNSWuJ+kkIp
y9qKKLnEDbXo4OILyoF8mqa82I+H0K9wxN3fAsZuTBGTCKFBBhEDXpryCQ06om0L
/845LtLg4bxB5UBKcnn/2zyfpiF3nvvsDfTbHpg3hruKsoq5Whdq4VQhjMcxq+wN
/s7jWRVrdAX88iYle2qsZNTm9bQIE2gvBoS8h9kxuJEwBPW8DDge58wv6XnnOoOp
wVi5eWfz0idn/DjjhYQqNSLKPLPEBESNPf/Xpu4OTXBmE6/SAbK7jDIXu/ccY4ZI
48Y45CTt4GAQkKneWWzY5vPh+iJnDhBzXt593BcwM27CA8fQrCLt0qDvGS0ulKu1
nxElOGvCTo0d2CBIbtYVUaBQv8CyUeGlLKcTc79LQzBXj5/4Zv8tc5Y/nCq/eZro
CMeKsLw56a6yG/9y+Y11DLahYZDxX4ozqpR3mIVrKW7ohl5JXthYr+sue5qC+2Yq
Xkj+sCCGRHb91L/abYciyRb87g/ARfvQa9eNGC5E/76dxIlJuSigDit0VpP2HtNB
4OOxQuBAImcQUEdW5P0i2IfSCtQ5QyJ6z2QRGpIWw8jCL2XC30FZj1qmHzXThnVU
zlRlUioYPy1n3Gh7KHJ2GitUu6Qm+2LO4XLWaPzq+SuXi5vQiXEfOO8z/tLr47g5
MmPkVrT1ec6nZgZhA7FH
=Hbiu
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--
