From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: depend on ARCH_TEGRA, not ARCH_TEGRA_*
Date: Thu, 18 Jul 2013 10:58:15 +0100
Message-ID: <20130718095815.GE22506@sirena.org.uk>
References: <1374013667-21435-1-git-send-email-swarren@wwwdotorg.org>
 <20130717083003.GA22506@sirena.org.uk>
 <51E6CDEA.7060003@wwwdotorg.org>
 <20130717175701.GY22506@sirena.org.uk>
 <51E6E107.8020300@wwwdotorg.org>
 <20130717223309.GZ22506@sirena.org.uk>
 <51E7203A.2020007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m7GK0ytKUM7VScCy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51E7203A.2020007-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--m7GK0ytKUM7VScCy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 17, 2013 at 04:52:42PM -0600, Stephen Warren wrote:

> The key to enable tegra30_i2s.c should really be ARCH_TEGRA_3x_SOC ||
> ARCH_TEGRA_114_SOC, which gets a bit unwieldy once you have, say, 4
> different SoCs in that list and a similar list starts to apply to a
> lot of different HW-modules/drivers. Even creating an
> ARCH_TEGRA_30_OR_LATER_SOC will get problematic, since defining "or
> later" will likely become progressively more complex over time, as we
> start putting our more SoCs. What are your thoughts on the best way to
> solve that?

Can't you just say Tegra 20 or later is Tegra 20 plus Tegra 30 or later
and so on?

--m7GK0ytKUM7VScCy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR57w0AAoJELSic+t+oim9/W0P/2GNjzwPymgibdHL3Cy3TF+c
yWl9xBkyJFju9U3wJqfuCCTYod77wFntdcNzXfOaPwmZlkDiTqWckUBXB7ac2gFn
aIptUhURla82RxwbAHtRm79skR0nR7wozpRidmYfSUHiBGAF1KMx4stoz9oSQpPr
eJ/VzjGv/SuayvZrrlC3z1VRUsMMIRuCs/3iH0VuSh4958G5p7fnCG5AhaXTMno0
xcMmdmRNpYM/CEJxm9SvfT5oGoLR2Y8ujiQXKe16m8Ykd0+cyIk4/td97tikvq0n
/pS2BR85kHNgAvotNXchEADdZ6PElgqVkXihW4Wrp/2khzPSaIP2FcbAJMoUoVJL
qAPVwwlaTxGjC0dZLJJgEfFJvR6ivROXhGdYC1C3ooHD+mSaLmeLpGj0EXxTl0Up
LBcvW6VXDpAfJ8vn4gfWKvBMASYCMzDLs1yyAVYNFTmKVIAgkvZs3G3A8EImq0Qp
pOj7PHUuIA2iXec7/LBpIyxwrZGyKdb4rWPXgdz8YcT1K1HcFf2Nf3Hyh+3Xx2aa
m3/zsekgEY/YWVR1ThY9gNM3QToUyUG+5kwhqgKw7ogdwtVNyQZAbJ0yQZ4kBEmV
4bDQ0wePAMfClGTHs2c6MBvfA/Eg+iFbXoTMotS9UldRyn4ogONped+rr2BJaEOh
lTmT9DFJ2Oj6RHrbf/oe
=aMWY
-----END PGP SIGNATURE-----

--m7GK0ytKUM7VScCy--
