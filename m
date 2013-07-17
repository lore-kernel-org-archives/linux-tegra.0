From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: depend on ARCH_TEGRA, not ARCH_TEGRA_*
Date: Wed, 17 Jul 2013 23:33:09 +0100
Message-ID: <20130717223309.GZ22506@sirena.org.uk>
References: <1374013667-21435-1-git-send-email-swarren@wwwdotorg.org>
 <20130717083003.GA22506@sirena.org.uk>
 <51E6CDEA.7060003@wwwdotorg.org>
 <20130717175701.GY22506@sirena.org.uk>
 <51E6E107.8020300@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OLq6itPlQwcDjwuA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51E6E107.8020300-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--OLq6itPlQwcDjwuA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 17, 2013 at 12:23:03PM -0600, Stephen Warren wrote:
> On 07/17/2013 11:57 AM, Mark Brown wrote:

> > So how do they disable the core support for the older SoCs with the
> > new model?

> They don't; the core support is so small it's not worth having the
> ifdefs in it; just a few K. As such, it seems simpler to just always
> compile in the core support, and remove the need for all the ifdef
> nests in mach-tegra/. The bulk of the differences are different
> drivers for different chips.

So my take on that is that it seems like it's simpler to just have the
core selection since that's just one option for the user to choose and
save all the space for whatever device they're not interested in rather
than having to go through individual drivers disabling the boring SoCs.
It seems more straightfoward from a UI point of view but perhaps I'm not
thinking about it from the right angle?

--OLq6itPlQwcDjwuA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5xuiAAoJELSic+t+oim9Z+sP/3hnU77y1ARLhKHTvkASvQeQ
WmM35HjJ78k3KAqt38wZSJe9k7JY+OBQZ43Y+gRI6k0QGZCCbCZEcMCRN2aYVGOW
GRnHgn8LTpaAKDeLKWddBmVplhmnYC/0iXHPsKRErwijv7/RI2gITVzFvZQxcnHt
UCQ6ckblXSBDqwOlYlesCclWi2p5tbw3PpBPNve6ay45MHk2lrGQpnjwteAtJ4Jy
UDJ3YzEWC+CWiiRri6UNlcDgU18TdMmLaLp+eKaUWDPUHw7p99l3LM+eJ/eNr7zd
RW+2f2XMC9HNkqE2BXB6LKDHpSskNwBofBzp2ck+zRuYYY2e+4k0vuWlgx8+OPIp
GsWwmK62mj7FcDcx8qpp/KgpunqKlTPF5wsj5DeMyW0dTTwzC0rm/DjNmzopjZ21
uHWkIFbmzflvMcz3k/BGU9TPsyVo183NU3rLhnc2uVL6YLX+DV9n2UeRhdREw4kV
3K+PKlhxafJZoRD7PUBSbUYi586IHfqJKX4Sstl/+51rUWVEpzIAdbD1aQQAgW2T
o/AuctxJsKRCJGmFKx5g3Gs7fpsYPHVpQpul64MJI6vc5mb5H2ozbnANvnlG94P/
+D4chNrEDZ9wVibBFkRaKdh5olKWqCzqCr1LBFdr5gePc1qo9pIUwMeA0ovVRN6S
Kuw4Tfow3ZjYtn/mOi6M
=Jt7x
-----END PGP SIGNATURE-----

--OLq6itPlQwcDjwuA--
