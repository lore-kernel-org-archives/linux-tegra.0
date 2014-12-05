From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] drm/tegra: checking IS_ERR() instead of NULL
Date: Fri, 5 Dec 2014 14:19:43 +0100
Message-ID: <20141205131942.GB18747@ulmo.nvidia.com>
References: <20141204110035.GC22643@mwanda>
 <20141204132349.GD7262@ulmo.nvidia.com>
 <54819FFF.4000907@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54819FFF.4000907-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 05, 2014 at 01:07:27PM +0100, SF Markus Elfring wrote:
> >> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> >> index e549afe..fa16048 100644
> >> --- a/drivers/gpu/drm/tegra/drm.c
> >> +++ b/drivers/gpu/drm/tegra/drm.c
> >> @@ -36,8 +36,8 @@ static int tegra_drm_load(struct drm_device *drm, un=
signed long flags)
> >> =20
> >>  	if (iommu_present(&platform_bus_type)) {
> >>  		tegra->domain =3D iommu_domain_alloc(&platform_bus_type);
> >> -		if (IS_ERR(tegra->domain)) {
> >> -			err =3D PTR_ERR(tegra->domain);
> >> +		if (!tegra->domain) {
> >> +			err =3D -ENOMEM;
> >>  			goto free;
> >>  		}
> >=20
> > Oh, good catch. Applied, thanks.
>=20
> How do you think about to amend the commit title?
>=20
> Is the following wording more appropriate?
> drm/tegra: Checking for NULL pointer instead of IS_ERR() usage

Sounds better yes. I've gone with:

	drm/tegra: Check for NULL pointer instead of IS_ERR()

Thierry

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUgbDuAAoJEN0jrNd/PrOh5LsP/jDnI79+dvc7PQMcrhokHdwr
S8itrVwYfvz1rMivEpwi8YG9layPEAvtSiYqzgx61CYpcKxEnlk/nvvfasz+SCrX
N9BcD4ebXy0GYqP8Jba0lueMPPgEHGZEqng30qVCDhD9P7l1GqHxNdhsn7rnVhz6
uM54P3jxe6KdPhkVv+7hIOGfB3+xK+KTX2+6kiMXB8TALhtBMotE9OmAI/3HLopQ
qHWKYv1ZroYje1yK/E6tFYXDhAOPvbmhHRo63xTOZSVHSdNJY1eiIKsX0l97miqR
qV4AR65mb8lJFhj8lSPFLW4+iaeuQ6yiU7v81ohFmT7zIe0Po9sACaXiltREKi9Y
e+X9Q75ExnbSrp0tE8HGdxOG9rej6SgfTAab5Di/TC/Mlhu5rIPhdUmEoVQqQXhD
5vAYW0ZzgS1xihSdd4Y++R0wx/ba8MVNlhDsCN1QQ7XyF2eeXFV/Uayo1hJ46kf4
VHH5r02SK62MBNkgLH+1HeC+j1XGRKCHXjKEFI1Yodci4Sz1+QPue1BJojm8F8AC
s7ItBFpRQyDIkg//F3fXVKmyoHdyV4kNYbBLZYCVKxoPWxlYO/KzS9RnhmJdsjyd
KZpdGdVSXSRd7mTFiFxmk2EAAUv3WAxAmwbY546l3wH3Oy0coIqGZzzTfPQ4qvZk
Z/5E+01uE+bEvB+UI8N7
=9l6T
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
