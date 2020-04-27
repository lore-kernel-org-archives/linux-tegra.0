From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH AUTOSEL 5.6 30/38] i2c: tegra: Better handle case where
 CPU0 is busy for a long time
Date: Mon, 27 Apr 2020 09:22:33 +0200
Message-ID: <20200427072233.GB3451400@ulmo>
References: <20200424122237.9831-1-sashal@kernel.org>
 <20200424122237.9831-30-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200424122237.9831-30-sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 08:22:28AM -0400, Sasha Levin wrote:
> From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> [ Upstream commit a900aeac253729411cf33c6cb598c152e9e4137f ]
>=20
> Boot CPU0 always handle I2C interrupt and under some rare circumstances
> (like running KASAN + NFS root) it may stuck in uninterruptible state for
> a significant time. In this case we will get timeout if I2C transfer is
> running on a sibling CPU, despite of IRQ being raised. In order to handle
> this rare condition, the IRQ status needs to be checked after completion
> timeout.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> Signed-off-by: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)

Hi Sasha,

can you drop this from the v5.6 stable queue please? Jon discovered that
this patch introduces a regression in v5.7, and since we don't have a
good understanding of why this is breaking things I think it'd be best
if we reverted it for v5.7 until we come up with a good fix.

I think the same applies for the other i2c/tegra patch that's 31/38 of
this series.

Thanks,
Thierry

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6miDkACgkQ3SOs138+
s6HFbhAAkw4kw0wOkZzY/9qlB+gSAit5MKAPOvPoPQ+f4LjUlhNdKDu3XysVK0dS
sKAk/f2CHLCm7SMgEATxuVw5agM5I33ufzlr8Jc5zUPpmlIuoOKkV3R433s9O9lC
9sUMHWDn34zJagJKLZ9KIMMpwf4cWD4wp29u/TrZgqhfC2JQSIi72uyk3CzKJxtI
3y0383+ju7JYQ+1iyaJPSsZ5F/Dbmk2cViZC+X2oxe9LozVIM2PAP9GkSx6HXgU7
WJhn92GDamvh1AuOD+K7XRHY+7QqVaK2vAPjPAof3DH0Tn3MH3kStt1P9AuO+IyO
5kdFaJXrbrspmmViYpC/QHdW6IxRlpYnjYDOJJ0ZCrqSDgUH2UfI4zCX0bkBilpZ
qVGqXnnPWhtOAK2hpMxJnZ2T7DCcyldLQKhgaQs+sYRrgS0pDXWsQyiInCUMEgsh
W9dM9rHcWkVNaEJyYlpXb5SAvv5tA0ctcidaCr/LXBfBiwWbDjSxHMBbUxLnfGmD
5EZNx49+q7M4y6E8YO3+iUY83aHx60zUivwElPx2kg7Y8nAeUWVy7QRUGaH1Uk6o
e96D8cHiswWsUV1C2xDakAMdFCLw3w/XXRDuVsZGpq/Y2XYOpQG/2NiBtLJMFqCb
ywW3eBGTPuKlnB7CF9yF/0+3UuyEA69wkUfMvFPSv2A9furafpc=
=W6uU
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
