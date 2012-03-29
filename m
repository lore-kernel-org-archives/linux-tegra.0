From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v5 02/16] pwm: Allow chips to support multiple PWMs
Date: Thu, 29 Mar 2012 22:50:13 +0100
Message-ID: <20120329215013.GH4153@opensource.wolfsonmicro.com>
References: <1332945238-14897-1-git-send-email-thierry.reding@avionic-design.de>
 <1332945238-14897-3-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6cMF9JLEeZkfJjkP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332945238-14897-3-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--6cMF9JLEeZkfJjkP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 28, 2012 at 04:33:44PM +0200, Thierry Reding wrote:
> Many PWM controllers provide access to more than a single PWM output and
> may even share some resource among them. Allowing a PWM chip to provide
> multiple PWM devices enables better sharing of those resources. As a
> side-effect this change allows easy integration with the device tree
> where a given PWM can be looked up based on the PWM chip's phandle and a
> corresponding index.

Reviewed-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

--6cMF9JLEeZkfJjkP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPdNj8AAoJEBus8iNuMP3dZGwP/0L0veyEA/396s/Ucf87+1k1
p7sqIgFAESk7zfmrtGZbs3zAQWgvSykU1s35JQLDW/CVCHS+/R6tZnpaziCYfSyz
fOBRxga3nqhWpCjB7FEdiy9IXf2FVeTZJf3J4+XOhkjwWZjlcvi/zcAQupopm/4K
1miPKsKLLGpC3SPiK4xGazeA/hQzuqeSc7syB2uxY/Glbc76INK9BcE4uZHEgXTO
eSQDLzM2K4r75zbROb0lYzmuF64JzNS9FDZ7u2y9FLn1xwpSsgFsbd4narlSYm4o
nZTR4mt+r+i/9qFTxtin2sXCnnbo778vWT7DTm7bGgaTgK2iEYsItHWxDOkVqCMt
I3P9oIs9nPyi0O3dpQu6qqH88DfVSDGCcqHcydjJkmJi6Bzps5BYtkDAeYStYV5H
8FP+m5RFZSAI2JrmTOtixWkJKxIS4jA7sEXDd4HasoOsf4xHOMULDlygvx5xoVMa
xsRKMxn/6mkhZjmGeQA6Jks3KeO7O6Cst/lvtIrSC9gThWqdDVivpRsKg9kiECog
M0ggu/jEy/mq7uVEnesKPw+l91bhfGwxDHSQLQomb5+lad4bmCWaSi/3nar9Pu3Q
/jOfOR5Wiu/DxDObHO7+wr/FxviM9oLdeBs8A9xFCuciU7aEXDQPVPTMq4hQgiUf
LyZK2NQXMVkddMMzQblN
=RKIw
-----END PGP SIGNATURE-----

--6cMF9JLEeZkfJjkP--
