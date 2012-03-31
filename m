From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 02/17] ASoC: tegra: ensure clocks are enabled when
 touching registers
Date: Sat, 31 Mar 2012 20:14:15 +0100
Message-ID: <20120331191415.GD5012@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
 <1333148852-17806-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3Pql8miugIZX0722"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1333148852-17806-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--3Pql8miugIZX0722
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 05:07:17PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Debugfs files could be accessed any time, so explicitly enable clocks
> when reading registers to generate debugfs file content.

Applied, thanks.  People keep muttering about regmap support for memory
mapped devices and while there's issues to resolve doing it for things
like this it might be worthwhile...

--3Pql8miugIZX0722
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPd1d+AAoJEBus8iNuMP3dQuEP/0Z2aOcy4oQooBVQI1ytzqwB
rZ05ze5ZnBBog+3j9269N1xYCcJLVRVIB0ZQhCVyfcqH1EgmXCUXIExqKL4nlyDV
lJIhqKMd8hZcPpAolFv7zRU+KpXh1AQx2axcULxxFj9Y55GWSl4TA1pDz0w0y1eO
pisoGzGW7aUuQmUgk6bEC32JROeHONxUbo7Guz5UbHT8kHM8j8ZTBlqE5NdBcdeK
5f38Tk3FrnC2C9Swx5eUlxEDLJrAXZWpNo8Bho1j8aiD8R26xPGWZZxrp2CechgO
pf/qQZuS6g+V6TexciiQE0Cblof3O6lgrUXEX83LB1sCZFXeJrv37CacB53aH4gv
s7cLQ4vNGdwMtHH5RYPbJt5lhvfphfnwA/qiw3Fjzp+wqBsEQVSJ9dpEn3tUbVie
smAtP4mZVpDdcJeqtLtyW5ynzBW32lSK1ALKxoHomN+jXGGIPka+XL0+oQgYsRnt
uGFArTCpKZFRtXAd0SWWPbeJKEhHVGG+2+HA6wqz0gClhGwCbgG7XMLKeUkNxUov
tCUaHhfJSnSeb2zyhA5AtKaxQXBnzxkrM/Y6vVf5qRc6PUSjQ59/Xo/iwK4Bw79k
u1occs/6Jnp+PgEUIkZFdES9gPzDN3cZ8DWbYpymTqhYxfUZjb+prBfjMmbdhcIk
RCBUMISsaDOYAY1DXwIX
=BJVg
-----END PGP SIGNATURE-----

--3Pql8miugIZX0722--
