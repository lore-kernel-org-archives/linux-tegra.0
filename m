From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: tegra: correct Beaver pinmux
Date: Fri, 22 Apr 2016 13:46:42 +0200
Message-ID: <20160422114642.GD9047@ulmo.ba.sec>
References: <1456514310-27605-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n2Pv11Ogg/Ox8ay5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456514310-27605-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--n2Pv11Ogg/Ox8ay5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2016 at 08:18:30PM +0100, Lucas Stach wrote:
> Update pinmux to get rid of invalid uses of the rsvd1 function, which lead
> to the mux settings on those pins to not be applied.
>=20
> Also add correct drive settings, derived from the Tegra3 TRM, for SDIO1,
> which makes some more SD-cards work.
>=20
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra30-beaver.dts | 39 ++++++++++++++++++++++--------=
------
>  1 file changed, 24 insertions(+), 15 deletions(-)

Applied, thanks.

Stephen, you had looked at this before. If you're happy with it, would
you mind providing an Acked-by? I can apply it after the fact.

Thierry

--n2Pv11Ogg/Ox8ay5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXGg8hAAoJEN0jrNd/PrOhfhkP/iBgJo9D1R9Wmrr7gwe4+K+a
VUqGAZ+1bxYLKknC+UBrn1nBoaWWAXkdpxvYtGGzWTl2KAb0xuJZVEtheKwSdFod
lXCgCLqxltis1J3Q/H5hRcu9JbannV75D66jglwUgzQBlbTEJBn3EJG/zb0ei4GC
69jm2moTi3IxHR6WgSIk95GKiaX4jj8B+G0/R1smtCnVxBo98z/aSBT9NaO7MvGC
ncMqwcLK3tnNJK0AHnT1eELud37mQ6YfMBDiBm2eeMt1f5xfEqrMrzIcS+ObIeRn
vl31fqDyTaCh99Nf9Wue3IWynQOMO7TUd1MaXjJPIsdbKRBWvhy5q6i2WM/+whu6
E8yUOy9Mj6Ufi0mbcInXZOtxLCWzLSeSITpaBtUSopdjY8PjKtHjAZhBHM5f+xJ3
tdhD77Gb3b2SE2pXNLdl3QquLilEiMLNx05ZBYXKdP1wZWRXccZO4ww3voHyB3Ws
KnaKI5vnsHb0XWQ7X4TEeprc787tTK9O1VE59YikWUSGF15l+5ekHh1k5DXjoh5P
ksLh+vXXSe4unTp5FBxKfA77JgkRp0pL05OvbmnlFRy0aJhzHPLxU/CdGQ9C2prV
CcunmsgHaeUKAaLKjlgn+IfOdTM9bQgxmRY4rbrS7NHgnu7s9XNn9ANR3b5LvJtw
Rk5Zx2cOU7O74FAreBfq
=pbg4
-----END PGP SIGNATURE-----

--n2Pv11Ogg/Ox8ay5--
