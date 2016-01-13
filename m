From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V1 04/10] thermal: tegra: add T210-specific SOC_THERM
 driver
Date: Wed, 13 Jan 2016 16:06:56 +0100
Message-ID: <20160113150656.GD2588@ulmo>
References: <1452671929-32740-1-git-send-email-wni@nvidia.com>
 <1452671929-32740-5-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LKTjZJSUETSlgu2t"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452671929-32740-5-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LKTjZJSUETSlgu2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2016 at 03:58:43PM +0800, Wei Ni wrote:
[...]
> diff --git a/drivers/thermal/tegra/tegra_soctherm_fuse.c b/drivers/therma=
l/tegra/tegra_soctherm_fuse.c
> index 7c608698f1ae..22f402240672 100644
> --- a/drivers/thermal/tegra/tegra_soctherm_fuse.c
> +++ b/drivers/thermal/tegra/tegra_soctherm_fuse.c
> @@ -28,6 +28,17 @@
>  #define FUSE_TSENSOR_COMMON			0x180
> =20
>  /*
> + * T210: Layout of bits in FUSE_TSENSOR_COMMON:
> + *    3                   2                   1                   0
> + *  1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
> + * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> + * |       BASE_FT       |      BASE_CP      | SHFT_FT | SHIFT_CP  |
> + * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> + *
> + * In chips prior to T210, this fuse was incorrectly sized as 26 bits,
> + * and didn't hold SHIFT_CP in [31:26]. Therefore these missing six bits

The above diagram aso doesn't contain SHIFT_CP in bits [31:26] but
rather in bits [5:0]. Which one is correct: the text or the diagram?

Thierry

--LKTjZJSUETSlgu2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWlmgQAAoJEN0jrNd/PrOhWRQP/AoPBxB4YW9DSBFO4dSX2x3f
Ya9jwiJ65r3juncdKCsUBlLUPOgkhLELlRsjpb+G1mbKqvz/udLNIyf7xoYebBSJ
bOBCw1u5O6A+wK1RkoNpbVrSQ6YjI19URzcgLJ+60iAIwrZR79Vl+2tPYxyssilh
Cj9dr5cGo0iEpcVIDFSVBewxcWaObnKSGuc5XEmbyaD8d/IBQ+tDcrxlswoMPvpn
pvZYFMO4d5js3CBQ6SRXBbRpCK8TAKpKlq934dNqChSM/lx7DxN9E5rHnNwqnFdt
IQd7S3/2thlAyLhZqqHM5KZJPSxJAFVH3tpt6FBOBWOAvyqcQ4xo6ZNZ9C2eDsM7
OzyeGVZGARn9BxDIQ82g2JF75zugeuHgVPePEw8QVgXOT8Gw9OLTDiFt3Xk3OiC0
yIFLlqMXHP6l9QHwpPcpegaCjcGwegYZz3gP1WhbnkZE4OwQ26MMSfDZCx4KukvI
UCZ94wIsztiqEtkuEEj4MhfEwzSm0HZ4kjgdCGw85eHi1Y280fxEL1XAjfKpvl2K
Tqgpkc5gsxiKXg6+MIZRrxKCutnDH4hWzgrXTLXtANYSYf7kD7KmdST7GDOIpFP9
ZYjHsKi2WUc6VfcoLFmb/pO84ucLmYVEyCWOGq6+qHapk3q/Tgw5iev8Ins+nen3
CZoe9E0EYukBBuMCHB+R
=8Syz
-----END PGP SIGNATURE-----

--LKTjZJSUETSlgu2t--
