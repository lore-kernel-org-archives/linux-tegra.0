From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix tegra_powergate_sequence_power_up()
 inline
Date: Tue, 14 Jan 2014 14:42:26 +0100
Message-ID: <20140114134225.GC10936@ulmo.nvidia.com>
References: <1389650502-30017-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389650502-30017-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2014 at 03:01:42PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Remove an invalid semicolon from the inline dummy, thus solving:
> In file included from drivers/gpu/drm/tegra/gr3d.c:15:0:
> include/linux/tegra-powergate.h:119:1: error: expected identifier or '(' =
before '{' token
>=20
> Fixes: 80b28791ff04 ("ARM: tegra: pass reset to tegra_powergate_sequence_=
power_up()")
> Reported-by: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  include/linux/tegra-powergate.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS1T7BAAoJEN0jrNd/PrOhQi0P/01Bb1wHI9fbPaP+EgQBe7OM
OqfCBEAMvOPkYWX7NlnGiO8OMNmZvjvRUVJPL8Syhups0/hBWOUDPSRqK6TRX+Ei
quEcJyMsTYLDNV08qXfhdAwK6hVw2Ophy/Wr7/4fWpchfT8GDu2rgqHPp2MYcvJ4
7e7NOZxA5tK+VPBLdlJhaY6YTe5tF8vYpuPZVvpadhCUrHkNdoOztrux8lzaPOx3
QHHus/WxWVLSmcxpJvs8l4/d7C3grzCyMX9otxeNOfqDs54ktfJoCrK1NhKa/iYY
z9vzZb+vughj1pJYxfbiBb/fLb54BcxrZB+ZnlylG9e29RuZ+4E7rCtHaPZAmULO
dIhAJKiI/M4XTaXtBl3rqlquudVVQbqBSJ3VE4umCKwObST+ilChUUwXbGWJEs1H
069xesTFo2G7wiP7+1EBYmWgyddRe7Ieg/6+R8E4J241+1R3ADotVxszUrbfTUbk
qpykfsrXYDISRl1Az9dEx6a9AfiJWBvdQcA/YjAH5D/3CIYrSZ7p5F7FFCjB0hO/
BRlthaZ9npG61q5o87yNnerHZPCh5Hx2rHQkh3/+49KwWdOKoeN7WHA8mzuqzggG
6/S67G7HtUwM84j+is0RCDBRIQ7++HqASVNSr3ask9kPuNb+rNj2DyyrgYn4jyoe
/+q+uO2Z4+0btHUSYTSU
=MY13
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
