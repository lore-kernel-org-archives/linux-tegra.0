From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] drm/tegra: checking IS_ERR() instead of NULL
Date: Thu, 4 Dec 2014 14:23:51 +0100
Message-ID: <20141204132349.GD7262@ulmo.nvidia.com>
References: <20141204110035.GC22643@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141204110035.GC22643@mwanda>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2014 at 02:00:35PM +0300, Dan Carpenter wrote:
> iommu_domain_alloc() returns NULL on error, it never returns error
> pointers.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
>=20
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index e549afe..fa16048 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -36,8 +36,8 @@ static int tegra_drm_load(struct drm_device *drm, unsig=
ned long flags)
> =20
>  	if (iommu_present(&platform_bus_type)) {
>  		tegra->domain =3D iommu_domain_alloc(&platform_bus_type);
> -		if (IS_ERR(tegra->domain)) {
> -			err =3D PTR_ERR(tegra->domain);
> +		if (!tegra->domain) {
> +			err =3D -ENOMEM;
>  			goto free;
>  		}

Oh, good catch. Applied, thanks.

Thierry

--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUgGBlAAoJEN0jrNd/PrOhJoMP/RiW9TqVWts7mH2Su9X5tqpc
/icgohd0Lct6coP6vgRhy8cw1YkTsa62KxSXZTcmPNNju0IIZTwRNpkyD6lMb9jJ
bQWNDFQKT9cFK5pmWQ2i5Bdq5nKpbgwsx7PLUbeByLD3HWd+yNWFD8rmlmRiYLoc
b9neVx7x1RklQt23SF/tNXM1gtiikPUxHnZeO+R30SoTR96qDKU4OnihlhImdgTx
DCT5dRj1Zovsp1+pAQr6Y7PtoLLefADDlvgdm46dqrhra6ELWZKDnyESIVsDbrfz
Teq4xQrjmd9cMf/Ow74kS7H+MQYD588fGFAUZgGjGuY1FwLQMF8IocNzDVswX9gb
R2jdpf6sJWyp2S9Nu6l6xDQ1pxe7Glay3JLSI3wUUK9ZkAnj7udi/T9frUBtNqzs
d/6qq5e8/yvBkTQ0eTRKddEiuwzH/LpZuZ1zwEXPjLWjgMaBIXekMRodSEKuyHaC
zpAu8HPEUH+nh/K3TUIlsQXsf5jjZ8+spSYApD4OHkLK+Q5+OPlcoQSqAlYglIbp
21AhFFXiE0fwPFamJadwMXglniqCiSGMj38PUQppMJLeGN+wuxi4enlq68G1Is84
HpHRXWgazxlDZGM/uLRgH5pLS7/aoY37zjIdl1vDVV7XG+4t/ON7xjxA4JBYPoma
umYpU3f06EsTlRoosp0+
=kpLq
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--
