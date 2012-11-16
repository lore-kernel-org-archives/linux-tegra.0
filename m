From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] drm: Add NVIDIA Tegra30 support
Date: Fri, 16 Nov 2012 08:11:29 +0100
Message-ID: <20121116071129.GB21837@avionic-0098.mockup.avionic-design.de>
References: <1353041889-3114-1-git-send-email-markz@nvidia.com>
 <20121116064331.GA21671@avionic-0098.mockup.avionic-design.de>
 <50A5E1D7.7020902@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A5E1D7.7020902-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 16, 2012 at 02:48:55PM +0800, Mark Zhang wrote:
> On 11/16/2012 02:43 PM, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Fri, Nov 16, 2012 at 12:58:09PM +0800, Mark Zhang wrote:
> >> This patch is based on Thierry's drm patch for Tegra20:
> >> - [PATCH v2 0/6] Device tree updates for host1x support
> >> - [PATCH v3 0/2] NVIDIA Tegra DRM driver
> >>
> >> It adds the support for NVIDIA Tegra30.
> >>
> >> Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Hi Mark,
> >=20
> > I already carry a similar patch in my tegra/next branch and was going to
> > post that once I get word back that tegra-drm actually works on Tegra30.
> >
>=20
> Sorry for that. Actually I didn't sync your tree yet.
>=20
> > You do have the hardware available, right? Did you test this patch on
> > top of the latest (v3) tegra-drm patches and arch/arm/mach-tegra (v2)
> > patches I sent a few hours ago?
> >=20
>=20
> Yes, I have a cardhu here. Yes, I made this patch on top of your v3 & v2
> patches and it worked on my cardhu.

Okay, that's great! The reason I wanted this to be tested again
explicitly is that I've made some minor modifications to bring the
Tegra30 code more in line with the Tegra20 code where clock setup is
concerned.

Since everything works for you on Tegra30, I'll push the Tegra30 related
patches into the branch that David will pull from.

Thierry

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQpechAAoJEN0jrNd/PrOh7VAP+gMllGFLKm3dcu+cUY64jXWl
GpiNHtl9c5F7fchL8l6Sn4HPm3MKDJ9qfIu4SDa1RTbE/LGN6rHLmEkTD0oumEg8
H4AX4sZNwzIB6YeAO69lBJaP1tSC6WmR6kLsEmxFy9MlxaTuV1b8HEbIVm70IUBU
Of4kjAZO3tPMV5Y97I1yQllrfP1RhQXhBQtqUodj7IX6pIT1gJPWZAfmzASJmv/f
/h5xnE7kZWP5XwjJ5Zw2qi0CLFk5NdaHJbg8clfEDa8yMUHQTrcKHLgrn2tBvASH
pIy6uD+OrdhBdEI13b5nr0feufw5zfh2DwU2o/qtPAo+hMP0SevsNuPBKu1NOY+U
Q8rifx9/Ru7t5nk1RMGILOYQEQqgvIdxlX07TqDTDKgNWMH1fnu4QLhWGQzgWQU3
UJB25a++Xr0+lozHdMO9Cd0StmFYhyhnAg7fTmPxEKLe6+g6fTOfyaIb2Wybok50
PhyKUfLL+DJDsmbOvmPZ8r1u1AveT1Sds3bLv3HxOysONNNT2yVsVzu2JlIxgzwE
IvA3sek46dFbBtohGrxwdq8d34zYny6GD+UqDmudCg1/7zPFdZe4DYdrDdC/yXYz
EtFBdPyC5/kAL2Tl0f39X4vE7AqGCm1FCRAjfMloBL01Z6MkLxTlGO9zUo9psQuo
0mRggQrGxctjEIiSBBAS
=K1Xl
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
