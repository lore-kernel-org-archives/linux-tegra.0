From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 04/17] ASoC: tegra: add description to a couple Kconfig
 options
Date: Mon, 2 Apr 2012 17:37:18 +0100
Message-ID: <20120402163718.GE15197@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
 <1333148852-17806-5-git-send-email-swarren@wwwdotorg.org>
 <20120331194848.GG5012@opensource.wolfsonmicro.com>
 <4F79D49F.9000000@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a+b56+3nqLzpiR9O"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F79D49F.9000000-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--a+b56+3nqLzpiR9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 02, 2012 at 10:32:31AM -0600, Stephen Warren wrote:

> When doing that, I figured why hide those options, even if they're
> typically auto-selected? Perhaps some out-of-tree ASoC machine driver
> needs those modules built.

I've never seen anyone actually build out of tree ASoC modules, everyone
always patches their machine drivers into their kernel.

> Still, I can go either way; do you want me to drop this, and remove the
> equivalent descriptions from the Tegra30 patches?

Drop them (or fix all other platforms to have descriptions but my
preference is to drop).

--a+b56+3nqLzpiR9O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPedU7AAoJEBus8iNuMP3dkKQP/RRLWpKNHp13G95GtLsxJTCF
Ok+SXJrSkN3Vgde256FMnd2V4796TBlm+Q9kaFPvhb0SWP629k6p/NqKbYm/yPPf
CixwtGHRqmaC9Amntb1KUIPqlQFaywXrheeLLga31d8y+fsZCYnkTd01yAppjrQn
U7u4/RhFqzfydNzbMbSdIPmyySKA1ddbiR37go19Y4K2xG1ZiHjXejtXWuED4D9U
AslnoJn6KpQ5kQnI497TZFF1jazMuuOCwykzaNzw6UZIVZK09oILIbJjzSsXzE//
p3gg9oEWMe0/4NdzsGkIZRplhIFrzuUBUDSeviwOzh8q+w4BGckQZ570QrBD/3C2
eVfO+q0b1+LNkIOYVE54f+LX4sJpgHmdOBxFEbzcr4Qd0h9AIg79J+axAHzniYsR
iZqB/pbyj3Oydx1RGOquqmKmuWCtIXIwAqlQEVFXmzG7Oe2lo1CzYJ5njniXAM40
Wpa1zzkqKtviysQyEOPps7aBOInuwL+hUGaMG6NbexDFE3sp8UIV9FsyJDwSsTTL
zoOO8ypPfsLng2kYIYy2bj9GmXxs6TtwXbjxbbqYK/tFme08fvd9/8rXWnvEXyiB
W2ZMpVEnQ62oAupw6oDO1m4RJYcZB1SGOiHMBkdq2BKfGAMS1yy504y66SqI26Hk
npDRyWfuQye20FIS5v3F
=JiDO
-----END PGP SIGNATURE-----

--a+b56+3nqLzpiR9O--
