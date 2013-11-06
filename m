From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Wed, 6 Nov 2013 08:51:00 +0000
Message-ID: <20131106085100.GB11602@sirena.org.uk>
References: <1383203126-3243-1-git-send-email-wni@nvidia.com>
 <20131031162029.GF2493@sirena.org.uk>
 <527737C5.5080901@nvidia.com>
 <20131104161828.GK2493@sirena.org.uk>
 <5278B4CB.9050305@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5278B4CB.9050305-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 05, 2013 at 05:05:15PM +0800, Wei Ni wrote:
> On 11/05/2013 12:18 AM, Mark Brown wrote:

> > We can do it as part of parsing the DT or deciding to parse the DT.

> I checked the kernel codes, it seems the different arch uses different
> way to parse DT, and I think these codes are related with DT, it's not
> better to add such regulator full constraints codes.

There's a lot of shared code there, and it's most likely that any new
platforms will be using the flattened device tree code.  Anything other
than doing this when we start device tree is going to leave a window
where we will be using device tree but not handling that in the
regulator API.

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSegLwAAoJELSic+t+oim9weIP+gNQrWipSe/kyoK3CQLdGMB0
W2ndOwWRg4IUyTNIWtPr+xvfBwcpmBdlHM5LAx1dBeQGyoa2+3aeIccbNYpkaugg
rXvcoXBtM2ZI1bCkRWGOFOD8nnjsXzCorLP23hssheD0Q+8v7FAYoaNSEdXgUuIV
GPN+LORWKxrbgTWI7ilsJPNNTcgPC/AUjZxpd9Hw6UsnHJ8jJ6pS/yBCMgS0uDYQ
r+NyhnN8d0F0mw7gDqtaLbBulIlws47WQnLJR5afh7w0/fRj8d6+vaCRvN62BFbt
4s1+srDuajXWW5nEbdNWex7c7jCn+okJwdq68f0vOd+7Ho1Ml/I5nckONOet61KU
n6Qm8uT7FU3nu5MFQn/0o3v1yS2ivXny27cY7L+DiuQPGYBxL6Pbyo1tvat3ZHUy
VQ0Sz7VLv7o6w5/L363xYmNJvlagW9ww+HgaQ1jEtkqbD3OqzpG/QOr0mKbY1DUO
SFVTIXW4J3RrRg27wLoWOxernWNe2af59JWRCbL8FHRlsUKiKH0lySgyDVhe1AuA
jFrpQIb4G9JaX72XAaLgeu6uY45lc0AqhgGzwB/dKik/fFzPUuX161weszp0Kv9X
Z2Vu59NiIpkQMbC7q3u/MKVQk47lRqlCn+mxYvVonz1THv73bk4TvSnYP/P33RwU
tmZLWyDB7bAVSsW/78Tl
=Y3iN
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
