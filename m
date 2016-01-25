From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: remove redundant ARM_L1_CACHE_SHIFT_6 select
Date: Mon, 25 Jan 2016 13:24:15 +0100
Message-ID: <20160125122415.GB20452@ulmo.nvidia.com>
References: <1453539330-11903-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453539330-11903-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 23, 2016 at 05:55:30PM +0900, Masahiro Yamada wrote:
> These two are both ARMv7 SoCs.  They need not explicitly select
> ARM_L1_CACHE_SHIFT_6 because it is enabled along with CPU_V7.
>=20
> Refer to commit a092f2b15399 ("ARM: 7291/1: cache: assume 64-byte L1
> cachelines for ARMv7 CPUs").
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
>=20
>  drivers/soc/tegra/Kconfig | 2 --
>  1 file changed, 2 deletions(-)

Applied, thanks.

Thierry

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphPvAAoJEN0jrNd/PrOhtSsP/j1srkUtsPbSeO8fwHx4ysin
KKU6Xyl37jNMsZCB4/nlO2h4YugkT3BWkF5rtBci8jRrfBG6eCVCi/dN3cvoGhJw
H6maWako/4awm5fxiCApBBGIf/qU0GPA+iQMn0/5UgX9oAR2I40kIGmjbDxaISIe
B0eyDDHM4OT4Kc0hAVv9b7xVkVoJoIALjwdhda8KzlGVtCwJ5HxkCkU4ztwmSC0O
mWtDrVkCTuiR9HczRl0a4Uls42DE4QFiWB8mmQe1J8JnE+pBRHURuZhu+b/+d42i
aVDqvStZSkDoy3nO3WTF0DSs5sdHAfOwPQ/IY5mCWaWNIrXtDObMHUtVknCmyD6g
7AH9QOwsmmoi8iea9ZDRXoaStI3Ygmbpq07Etn34xDA1pGPqTDvfz1h6D1JfRzej
M/bjPJdO7/RvHChYkZzEzegJ/4TKIGpj8Dsy3JnYWuOTX0lknXuFUDc5B847TrCf
Bqq25vDx/h/Vcr+m9nSBC7ndA0DyR5zUvP3c0wCiqzxouxtJewr+HCsU8kBAh+g+
nO3P1duySPaPHeOpF46Na1MUKjDw5V/+QbMw1ZbZFBQRjvNYCdrf9uisZGoM8yTu
HcMZLRU+cwXGuWQX3q3ZO8zZ3sVdGyA2xkiM5wA2u1Ic2uNMBk/BY6q+pTojLFcl
hL8kV3iQzRztURzs+x0W
=BcpX
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
