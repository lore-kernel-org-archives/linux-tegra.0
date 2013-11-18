From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 16/31] ASoC: tegra: use reset framework
Date: Mon, 18 Nov 2013 18:37:16 +0000
Message-ID: <20131118183716.GR2674@sirena.org.uk>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-17-git-send-email-swarren@wwwdotorg.org>
 <20131116095529.GF15393@sirena.org.uk>
 <528A4C8C.3030200@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="foM9DbudB2CcldhH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <528A4C8C.3030200-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--foM9DbudB2CcldhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2013 at 10:21:16AM -0700, Stephen Warren wrote:

> It's fixing a dependency that should already be there, in the
> COMPILE_TEST case. In the (ARCH_TEGRA && TEGRA20_APB_DMA) case,
> COMMON_CLOCK is always selected.

> Do you want me to split this out into a separate patch? If so, I'd
> prefer not to apply that separate patch immediately to 3.13 as a fix,
> since then it'd delay applying this series until after -rc2 is out,
> unless you can get the fix into -rc1 quickly...

I don't really care, it was just that I was looking for something to do
with clocks in the patch and couldn't find anything.  Perhaps a note in
the changelog if you need to respin so I don't forget and say the same
thing again.

--foM9DbudB2CcldhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSil5ZAAoJELSic+t+oim9VDkQAJpjrtTHmawDJ9UblInFj9Za
EdZn+sA4jS03nwt086pTL3ImLZt4t1kIjuUmYYw5UEVhcT99CQ1WjlD5VnZkm8iM
py8CrwDnYXjXQ0qgAv9bD+eO9rtIF6k2HT8Ji3PQpAhkP6zB9ZqUB/MhaCozGc+A
Kr7R9k3z78ahiqZBAmiX+KQTS8fkCX2o5Ne1pm/r9apwSxyThmdR8vrvRimTl3kV
KY16xpVyGxOsr9HvGHtnDEACGktX3nvKw8zz4F9BV9o9IVjavAvqkK70fNlrhbsg
zCG5nsEue3ofO/MyC2/qCpOpqPp2ma2dLbuJPO8Zi51t1SF0RfgUYSXChyKjQR05
2HVklRdCBGkLF9ThLOmmnZEl/zrvtRNvuvUnAjy3yj5CfWYrWKamMbalmLPmJC/3
iGCoJ0x3SWcrF3RmVSetfjK44Yg8/d0506ByDrtkiU+EZb1NWjvWGAXR640kdJLl
UqvlRZNdvVzz7A47+dLrdpayc+CEaTwfch9tzJbvcPC8Qy8BdXYFT2L4ip5Dgk9w
kBiqukP+bj/Gr4yKHKAtpiWbdfYSNa+TPkO4ENaW1CBp05m3l0Qypjnkg8bcfGCH
CRGqWw2g88qDeZOht9kaHPMvU7jMVeaciCZ6YbOdeXKAs48uBKOhCSK/zz8EMuCk
V+cYtfWPxMpjWnW2cIQM
=4H6Q
-----END PGP SIGNATURE-----

--foM9DbudB2CcldhH--
