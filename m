From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Wed, 15 Apr 2020 18:31:20 +0200
Message-ID: <20200415163120.GC2830@ninjato>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200324191217.1829-2-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 10:12:16PM +0300, Dmitry Osipenko wrote:
> Boot CPU0 always handle I2C interrupt and under some rare circumstances
> (like running KASAN + NFS root) it may stuck in uninterruptible state for
> a significant time. In this case we will get timeout if I2C transfer is
> running on a sibling CPU, despite of IRQ being raised. In order to handle
> this rare condition, the IRQ status needs to be checked after completion
> timeout.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied to for-current, thanks!


--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6XNtgACgkQFA3kzBSg
KbYgpw//Tp3dEVOrTD0EDeh5adYZ7oZJ90mS77fM9WqydszpDRrl235F9X6YEGt1
y6DZ6YgwGAYBOPRym13VHYm9fgKwXrRA/zjBO7AEN/ZT4+zKy/z1Yh3rw+BJxtNC
bqVjnRiIm+7bgN9bdo0NV82HWu/a/4GxQ695udZ+SZt07Z2ohDHx2qwbpPCEJHdb
wPH+DipJJI18iNWuKep4+p5GaoKqx7oEqqfghhVVBWDEEc5fPJ/IgtsXCxYwkKjR
8dbe6X3X6dK5VxL9mxBbmP4wJp6S/3/EpD2qmX9TKN/o87W2+v8KxSsj6VuBNcnZ
OU2f12d1HrEnhAc6XYAZuIWGAmAP9DgIofXF9Aep4WCy/aBQ2zeXrUbwKyEmS5jT
ZnMWrGbR+Ir9fNznmMd+oQwgLsrT4qJpr15l2uXp711XjYeshCHNMOfonHgQk4Wi
nRzQkMon/1DbzCBvjwoWcAEJG+faZdxjdOMG0vOJK74DIa3xxTUO/Ws9GmJQBtBs
ulGhzNuVuJyyzduJAv/dRweh7gJ7ARl21IoGDEUbWwX/0j2X830H8pvXwQlRfaIh
uida9TnFVG2IY3AHpZOsadGLCZycDY1IoJ9IJ8j68aljMxCNrz2KrLL+HRxdTl7a
Lyd0PTmyKHp//FdcUCu0GLnM5JufUjSIKM3vc+tyjRH8e2CskWw=
=+7O0
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--
