From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dt: tegra: seaboard: add regulators
Date: Tue, 10 Jul 2012 18:01:13 +0100
Message-ID: <20120710170112.GK10022@opensource.wolfsonmicro.com>
References: <4FE8EFC4.3090509@wwwdotorg.org>
 <4FFC190A.2040800@nvidia.com>
 <20120710134436.GD9409@opensource.wolfsonmicro.com>
 <4FFC31D5.7090600@nvidia.com>
 <20120710135302.GG9409@opensource.wolfsonmicro.com>
 <4FFC4478.7000204@nvidia.com>
 <20120710154201.GE10022@opensource.wolfsonmicro.com>
 <4FFC5ACA.8010003@nvidia.com>
 <20120710165236.GI10022@opensource.wolfsonmicro.com>
 <4FFC5E1C.7000500@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/0U0QBNx7JIUZLHm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FFC5E1C.7000500-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/0U0QBNx7JIUZLHm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 10, 2012 at 10:23:48PM +0530, Laxman Dewangan wrote:

> Then I will have 2 question:
> 1. If that pin is connected to battery then what should be entry?
>    vcc1-supply = <>>>;
> Do we need to register battery supply as fixed (non-gpio based) and
> then refer here for phandle?

Use a fixed voltage regulator to represent the battery.

> 2. what about non-dt case? The regulator registration will also fail
> here because of there is no regulator saying vcc1 in this case. Do
> we need to register the vcc1 regualtor as fixed, battery supplied
> regulator in board files so that the ldo's registration will
> success?

Same thing, use a fixed voltage regulator.

--/0U0QBNx7JIUZLHm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP/F/PAAoJEBus8iNuMP3dosgP/jejgxjqjpLX7sEHQMwxydki
pZCeKgr7mjNi5UHuInnPvjFqvZhQuEgeIA6gbcdHLKJ2xSB1aHViU74Y1SAdpfH3
lg1D3MkLvCWeeqVAqwcmduUWgKKHEzO1O5vs498QYCGjC0xpcT7VPVE/R7TH1GIz
Euxx31XiieqcwctkUIgaSdsRv81gICESWtpt/j9Lo3sl7qPoFBx0SPmsIVlKbHFd
2Y1upL2+7PIc68m3ej5MCak34Wl6eiy9DaIkIz/J4VQBBgq/rECA0hMzk0mfFo4D
hP0B7+hBbmxQ7lr2Vp0CLFVExoPhgAZYyeaCKxl4i0e/dU3oLOBtba9WQMsSkAxf
lHkiacnVwTAH/6TT1H/RSE993/3AfjAeXgE9kpKeAqdg/GU0x4X0mZ6s5I57hEFz
f9DA7B6OgF4s5lfUWBe1VojXtWYbk7aSl4os81WZ/TPqv8Xg3fp3bM3rS3lYusHz
bmWbRzadxorcSOxq8fgzHQWJ3Byf2/4uisrYCLA8NcWqmK2dbfmEtTWxaVFJDeKF
2V1OUjs9rVz7SC/yVIml3r6kzDluqqlb9juENMb3QrNAm4zum5aD6IwzYTcqCgHB
lMQ9bY40mT/LuH269OMwL2qEPkg/nJdHe/IyvxMVOR+98ymXrCTYpOZsa2Di4XjJ
GvIfVt+EO10MtakLwbAt
=1JeG
-----END PGP SIGNATURE-----

--/0U0QBNx7JIUZLHm--
