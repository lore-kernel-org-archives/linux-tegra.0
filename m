From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 5/8] drm: tegra: Move drm to live under host1x
Date: Tue, 5 Feb 2013 10:26:34 +0100
Message-ID: <20130205092634.GE20437@avionic-0098.mockup.avionic-design.de>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com>
 <1358250244-9678-6-git-send-email-tbergstrom@nvidia.com>
 <20130204110804.GA595@avionic-0098.mockup.avionic-design.de>
 <51108E70.5000602@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51108E70.5000602-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2013 at 08:45:36PM -0800, Terje Bergstr=C3=B6m wrote:
> On 04.02.2013 03:08, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Tue, Jan 15, 2013 at 01:44:01PM +0200, Terje Bergstrom wrote:
> > [...]
> >> diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
> >> index 697d49a..ffc8bf1 100644
> >> --- a/drivers/gpu/host1x/Makefile
> >> +++ b/drivers/gpu/host1x/Makefile
> >> @@ -12,4 +12,10 @@ host1x-y =3D \
> >>  	hw/host1x01.o
> >> =20
> >>  host1x-$(CONFIG_TEGRA_HOST1X_CMA) +=3D cma.o
> >> +
> >> +ccflags-y +=3D -Iinclude/drm
> >> +ccflags-$(CONFIG_DRM_TEGRA_DEBUG) +=3D -DDEBUG
> >> +
> >> +host1x-$(CONFIG_DRM_TEGRA) +=3D drm/drm.o drm/fb.o drm/dc.o drm/host1=
x.o
> >> +host1x-$(CONFIG_DRM_TEGRA) +=3D drm/output.o drm/rgb.o drm/hdmi.o
> >>  obj-$(CONFIG_TEGRA_HOST1X) +=3D host1x.o
> >=20
> > Can this be moved into a separate Makefile in the drm subdirectory?
>=20
> I tried, and kernel build helpfully created two .ko files. As having
> cyclic dependencies between two modules isn't nice, I merged them to
> same module and that seemed to force merging Makefile.
>=20
> If anybody has an idea on how to do it otherwise, I'd be happy to keep
> the Makefiles separate.

Okay, I'll take a look.

Thierry

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRENBKAAoJEN0jrNd/PrOh9EAQAKsBOPm3IjPH5x9X5LDZtpxw
+r9tdFT+qBnTud+k8Q+S2FsuqKqe5FIWuhTH4CWKxt1KfASq9kQpMS82bhM53Nq3
EkS5EoDhw866ErH2Eirh8BUdc4KecVj0H/qgjhobfVeAQcOX09r3czPK9/s6wNs9
oAm40Vu+/lTgmADDFltOvh5Bj7CdxY7jwfqtepZfCeVDf2VIaamZO+AQJi9+Fu4C
VhqLsio7vzZ2Cz8oqr6VAZV9lfND9rZfwNq5x18RIE6JPJ/SJztIEIfvidOnftnK
COHuuJh5DDLXVwHyULclTiCOgi25ScOPos5ghUZBR2rl3Tm2chnC1f0/EGVyKaw8
wIE9NDN4aDryzzVPC3s+AktHZxsx66Q4eFblNL3gB4t9hgWAW/9/3raDjTVevbEI
3I7AN8lQs0Q6Je9/HSiu/1dLCdI4Kf24IO1YBYqm5ClvdOtOCuNzW70J/GUvcszM
rjOzzz+cre/O4LTCxr4umTsVlVgNkg8KHZKNPyDuhNRuQ7Hdm//LdBTcziYF0OLB
GUwc6sQZtbUjJMgFZ4WU6R8fAsmUu4CHgdbKTXMbAA7Zy6r+YBBdAK4aU0UyMw/1
KTqiQ9DGF9zhL96QvSMXRPQAzjmTfoptZ3BPGu28iOXHEwFn973iTOnPXptO8nXV
aTF26tenUH5ZfrHmo9hV
=MUHd
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--
