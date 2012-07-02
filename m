From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: 3ad1308 pwm: tegra: Add device tree support
Date: Mon, 2 Jul 2012 21:26:14 +0200
Message-ID: <20120702192614.GB1299@avionic-0098.mockup.avionic-design.de>
References: <4FF1DC86.1030508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FF1DC86.1030508-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2012 at 11:38:14AM -0600, Stephen Warren wrote:
> Thierry,
>=20
> Could I ask you to apply a small fix to the following commit in your pwm
> for-next tree:
>=20
> 3ad1308 pwm: tegra: Add device tree support
>=20
> The pwm node is added in the wrong place; the nodes should be sorted
> numerically by address in the reg property, which would put the addition
> between serial and i2c, not between i2c and pmc.

I can do that.

> If you're unable to rebase that branch for some reason, I can send an
> incremental patch to do that.

As mentioned in the other thread, if you carry the two Tegra-specific
patches I can rebase without a problem.

Thierry

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP8fXWAAoJEN0jrNd/PrOhGp8QAJt60gOZ5OmTrtUTV4Nk4pTx
SuOQfPJrordpqIGKMO6OIZPsTCJLcxLaltik9+aCtZ54sv46qNf62X2iPXz+T1ST
cAkzT7RVO/0Et0DrNbh0VVg6ktsbGzm+J0hMjwBJHXSzVLu75sy2ZHBiEAy4LNVP
JIWIKIZLm3zidpmmnGDAVoEMBuUmXnovuGyrI9FgvLGyqEMCt31ysDSP+F8sGrER
GtGjE7XlIZYojMMPhLWAw0zUnORh3q6/dDLvUFIRvmKst8AI7RwEb4G9S2wfHtwb
7unPcJh5xnFinHGFuxgCxDmQLN/6SuMQb4UjAKtWPtA9g/t23hdtfJFW/LEl6apD
TM0uAKaT1auQshObFcwe0rATdzEcBhESe0rZU7Z6+oDeElVhU7fosR1DH6ILcP2a
D6EdyyuPPn9r8f6dYxHwqKzRHbUhiDsxvKADkWuyXxwmbytAmQfMymBn8m8o0dr2
AhymC0Vvltr/lEwjIKqXD2rvAfZ3uls7CfY9iOaxUL2s1xo74oeF3CTi3KRqVG2S
8BD4JL5RexJXeEqbdSZsgn8dYbGChQDjzrC/q3jMCp5S4Tx7DIw+uFrC36L3rRW8
twFT3E6Jyx/UrlnWx4LJOxg9JLDbw85xwgoMDt3Jf8sZ3NTOOhQjXnFLOn06LqTl
p8oIRgJpr7K0of4Inb5h
=ghET
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
