From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] GPU-host1x: Use a signed return type for do_relocs()
Date: Mon, 25 Jan 2016 15:05:05 +0100
Message-ID: <20160125140505.GC7014@ulmo.nvidia.com>
References: <56754606.6060201@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56754606.6060201-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 19, 2015 at 12:56:54PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> Date: Sat, 19 Dec 2015 12:48:31 +0100
>=20
> The return type "unsigned int" was used by the do_relocs() function
> despite of the aspect that it will eventually return a negative error cod=
e.
> Improve this implementation detail by deletion of the type qualifier then.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> ---
>  drivers/gpu/host1x/job.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Good catch. Applied, thanks.

Thierry

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWpiuQAAoJEN0jrNd/PrOhDIYP/Ru9zk+R0zm6MOIPWGhaJZ81
ZaQ/yjejYi0gNlCepK7pdcOl2cpQnI3uOPC1PH8Gg+hYshiI3qaH9DBOIVim2zqQ
RWRrFZ7Tn+tstGfRQF34OjqkQVgm1wYkCXkpSCtKTTMRtFDKYBUQpo65LiGLV/+K
sF7HEBXovKeRnCQIVDChNBOTWzlOCPayeJkcQoVnMvWx3XGP4hL2laFmrGHLDAnH
aaprD7bTiAd6FuOHPCTK3Ai+kBO95lekxr/DGeMWIAiFvX7HiABzzSLG0LNenUZk
TFzph/xyYccV2uH/2iOy4yDQ/DJgq3oEbdAK0D2HRd7t5nE84ZAmsNrUZXiZdubE
z7BxM347NBijs478FoAxm8zX8VrHm/8aIoWJ7pfNNAeXN/0li5sfxYquJ0YaNOm4
qf7HFet+oiN6ELypBvCMivfYxcn1gcyn6cPhZ2L+l9qmui+3SDfZ0MQtZywcZn36
XS1n0JAzTz7f8nTLgn9JfMau216oEf9FaY4BwUYYyEmcqQOArWWhsxfLH2Fj9U94
A5cBRfLyk1xk1XW4Jp1XHSZ1IpngZ6mnI8/qcQlDNOyTevnkx4SGpJP7nmlPhPcn
IdYG0XvSy/HQxfptucmSrJrF+8l/u8rT9/oXc6kmg2482z0DqG0a5FImKezHPnhQ
GlSwVe7oh4d/h4O/hA3C
=T+B9
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
