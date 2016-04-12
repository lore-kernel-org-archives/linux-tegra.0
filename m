From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] soc/tegra: pmc: Use BIT macro for register field
 definition
Date: Tue, 12 Apr 2016 17:26:42 +0200
Message-ID: <20160412152642.GA30211@ulmo.ba.sec>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460473007-11535-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 08:26:41PM +0530, Laxman Dewangan wrote:
> Use BIT macro for register field definition and make constant as
> unsigned when using in shift operator like instead of (3 << 30),
> make it to (3U << 30).
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/pmc.c | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)

Does this matter at all? We use the explicit notation in quite a number
of places and it works great. I'd like to avoid needless churn unless
there is a very good reason to switch.

Also this contains whitespace changes that remove the extra level of
indentation that is used to separate register field definitions from the
register definitions.

Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDROyAAoJEN0jrNd/PrOh1nQP/AsW9KawuOLDHDJ5fvVFGQ3P
AiRxIRhU2brrz7gnSDq7BsAcVSylGDv0DSmoatECid4dDbqFM/9M3DchekZZuLZ8
nLht0Hzvz63HRr5x0cwi+VFNcR4aPj43N0+GisFPv4B83UMe5QK4qvJ0+vmHr9Jo
zsaZ5+OciBGEyEbM9ejfhfpWn7uUR1ZwNEOFItmoDes8iVbq4dCIuT1ogP5uL/cx
4Fh5Zm7sXDWsrBkG+m2Cq4svFcr6XpSTbhDPL1pN902F+lSZ606NW3LnfUgDEYpD
Z4TFecJm8yS904b5KkstTj9N+mjoQIcLsLVldwri8edaS2a3UQXD86VXqeaEkHr9
YEmkde+laQL7T9LtV1tPW0LY16VNk+rwDMHyLL9xaS4RWULFAVRiYTjQCRsp7W8M
0/Zkwk9xn/aTNgykIrXfC5lHFb6ya1jekpI5DQ49uy94sVP4xGtmUwmvWX5fNusa
4O8qO0xZS+Skgo/r25HKigXpRlJ/m7b9lmhTq4LLpmsqgmooJZLvC+UmAy9R1h8w
MFREehWk1lF6ciYe3ilB3Wy1YK9p/moLkZIk8C8BybvDPMNo4p5aVtTDTrk+BROw
22D+oX5GpnVGiQ5b/t81x4O3kMEaXu3IdPlzCIUzkmE2srRSQ6V1clPQILARQjMb
2Sb98IMSl4BZdTkMqAHP
=EVuj
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
