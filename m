From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 12/17] ASoC: tegra: utils: add support for Tegra30 devices
Date: Mon, 2 Apr 2012 22:30:44 +0100
Message-ID: <20120402213043.GC3160@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
 <1333148852-17806-13-git-send-email-swarren@wwwdotorg.org>
 <20120331202015.GN5012@opensource.wolfsonmicro.com>
 <4F77B5F8.8080205@wwwdotorg.org>
 <20120401102814.GC3153@opensource.wolfsonmicro.com>
 <4F79E584.7080904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F79E584.7080904-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 02, 2012 at 11:44:36AM -0600, Stephen Warren wrote:

> I guess the utility code can just call of_machine_is_compatible() during
> probe, and so not require the machine driver to pass the value in. That
> doesn't feel /too/ gross, and avoids having to export any new soc_is()
> or similar APIs for Tegra.

> Does that seem reasonable to you?

I guess, yes.

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPehp9AAoJEBus8iNuMP3dvc0P/A4q3WwNv8QFYxDksjhns+3W
ZE0RqsSmAipxXJrZUg0B3RN6yoCdyWZ4aL3sRFfXnGHGQvTI3ktJ38tvf+Uv5pUr
zSTjF2QL4EvjZz+GU6NHMJiivKAhaJPN9fcFN8GlPKBUSS3+PhrbBkMkH8AkGbkH
Y/WqFf3hSuB1vkNr7/UPVo8XzLqmphPHIlctSuu+ZArWNHj980X0ryUnWKuXEaPi
jkFTii5uwWQVETjAgmUH8s4JUZ4HxRCdOgJpU33jJ4xDHtx/aKGlyBiX0Gr4yvR7
4v/rpYXKy/SN1byfeLNCB5sz5SyHHPwr1wgi/1b/0AfpTZiEOc91TLwMoEJlPKuo
2E+FrPfavk5pIlo42AvXplm+T6zRthJ3JawUSpX7sCGRJIvRJL+a0NwEbBCKAEQk
fk0Me6D4Hr8tsNc90665XUCgKpWew5sOLfIfno1HFZn2UP6wq1pfHbW6+PWQk0Q7
K3OJZu7rk7gTJVlkM5Arh7arie1/ZdPauetwDzdEE3IAhvpYle16hYH3EPJosHw5
/fHuCwSS4FtM2molYqdizh+8z5sdf6sivbvNOe7+jZ+jRLRGxnnfKg4F4WcvVKjR
fkhwMHhJMr/Yib04UWzZSxgbHNlxNmhNsCHHUQsgmxaHoGfUmaqovUUT3+d4UWA3
qOtpQw7/gh4cUfsvz55O
=f74z
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
