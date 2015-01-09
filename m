From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5][resend v4] of: replace Asahi Kasei Corp vendor prefix
Date: Fri, 9 Jan 2015 16:04:49 +0000
Message-ID: <20150109160449.GG2634@sirena.org.uk>
References: <878ulzx6hr.wl%kuninori.morimoto.gx@gmail.com>
 <871tn4uv0j.wl%kuninori.morimoto.gx@renesas.com>
 <CAL_Jsq+GjM+3M63amyh3Rvijkz7Lch_cdUt9vScc9wZeOubOPA@mail.gmail.com>
 <5363275.ZK3ulH6EUO@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wa3xFDkrbo+Lac6I"
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5363275.ZK3ulH6EUO@wuerfel>
Sender: linux-sh-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Simon Horman <horms@verge.net.au>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, SH-Linux <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>, Simon Horman <horms+renesas@verge.net.au>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-tegra@vger.kernel.org


--Wa3xFDkrbo+Lac6I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 09, 2015 at 02:55:40PM +0100, Arnd Bergmann wrote:

> It's an i2c device, so it won't break, based on the implementation
> we use in the kernel that ignores the vendor part when the part number
> matches the i2c driver name.

Plus this update is actually changing the board DT file have the ID
which we've always had in the driver, the driver has always used the new
string and never the ak, based one that the device tree is registering.

--Wa3xFDkrbo+Lac6I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUr/wgAAoJECTWi3JdVIfQ+nMH/Rulo4/Hc9qtxPbaFs+Rvvtb
6BlpNHZzOskKWRqBDvu2Uy45o6ymjLP8jO5iC2C3C1IlN6NEn/7e6XngwnAFUIRb
7ai38qiqZJWnRd8BZp0YBIL2eDBVC0GHvllGoXGdp/+8aVBQnkmm8Ixc6z77JREX
i1VKyZMBiWlM+Zjucxn+n9jKKr8bYkyaTpK3h64axDmlg9JYmAqOPPANvvm+6QMj
SgVaymyzHWJb5Wm2ePecLdkjdNdBcn7EVp/cw9RoHFpZSBNAcpEX2yOP4+AzCI1S
uo4SrEaUXxde1VDtleJ3A5FTFAar1VjXsRQeb3QjBnvuD00Y4TZH1RHkVtmm1wU=
=lkgW
-----END PGP SIGNATURE-----

--Wa3xFDkrbo+Lac6I--
