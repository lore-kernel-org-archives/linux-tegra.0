From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: Add basic support for carma devkit
Date: Tue, 27 Aug 2013 09:56:55 +0200
Message-ID: <20130827075654.GG8686@ulmo>
References: <1371994685-4997-1-git-send-email-chris.desjardins@amscins.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gvF4niNJ+uBMJnEh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371994685-4997-1-git-send-email-chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--gvF4niNJ+uBMJnEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2013 at 03:38:05PM +0200, Chris Desjardins wrote:
>=20
> Signed-off-by: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra30-carma.dts |  461 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 461 insertions(+)
>  create mode 100644 arch/arm/boot/dts/tegra30-carma.dts

Hi Chris,

The new PCIe driver is going to be merged in 3.12, so it would be nice
to see this patch merged as well as given that it is one of the few
users of PCIe.

Have you had a chance to look at the comments you received?

Thierry

--gvF4niNJ+uBMJnEh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHFvGAAoJEN0jrNd/PrOhQEEQAI0YTUTrjKXma7qzmzO5NPRH
m4ub+5usUcdVY2lByGIoxEo3+gCArS2iObfbo8JLZdalt5n3AtsCNHW42DvNJlA8
QYeRJ+59Wbn0fFjh89X2pBjDRCTlPACpG56TtlIEMcoJK20WSYK24mQIKT4w7iUB
ou9xfa1rUSG51LRIwB3CxXeEH9e5Ssgi+VIbqE4Z7M58WljGUFb9MvN78Xm1TB2m
mcgdPNknXsdYUnnKVeS1SvU1RYw0nAPill6f1/yyLGfLvxqbxg3Kwggn8etf3nm2
W1iH/W5gclP9Ef8Anliken5l3bbMEA2u1v9Ec00Kbe6Rpx1joYJtNIooCqqoivFL
nZJhme70NBw8PYdExbvjpjB+nuWxAQaFznNd0fTT7C9DRp7ng9vs9M1eh54Nv/WO
OI123VXwZ7YV10UFa5YkDMyk1nLsQ+b/AaYLlL3ZKjDMCW/71qNlvaBv5fGIm+lj
LKJOdkeTRAXdijdYlnoaLStPosAe3ADttarXTdr+tz6KtObZGAXpFFb8zpeiyiJa
rie6wwkY7lw8Djv2VKwMMF2DXnqXBdpkYc7zbrFvoefNp17LnGxcZvD5ly0pqKfP
Xrmzm4J92v8toYfAOh5bI1NFGml6qLQeIGyjb5k2YGxBDXJDRy5yIY4E4hu0wha7
6nSW0QZRSonxK1DtiIFi
=iu1/
-----END PGP SIGNATURE-----

--gvF4niNJ+uBMJnEh--
