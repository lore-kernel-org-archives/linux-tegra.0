From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regulator: tps65910: Sleep off rails when ext sleep
 configured
Date: Thu, 8 Mar 2012 18:09:09 +0000
Message-ID: <20120308180908.GW3638@opensource.wolfsonmicro.com>
References: <1331124709-30402-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Er97KPJOrxRt+yKZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1331124709-30402-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-l0cyMroinI0@public.gmane.org, jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Er97KPJOrxRt+yKZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 07, 2012 at 06:21:49PM +0530, Laxman Dewangan wrote:
> Keep the rails OFF in sleep mode only when the rails are
> controlled by external sleep control.

Applied, thanks.

--Er97KPJOrxRt+yKZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPWPW+AAoJEBus8iNuMP3dKQYP/1YRroaPPCmLz0lC45aOoAuW
/46J4yooll1ttFDWPFwpwjWg4GYmujPxPITk6OMIY6EdKcccLWM8lo3PvA9AV6rQ
zFyC1H0vwa95qXoeTpxZP6211RSywGQVHTo6ILGifLthKCIX505Y5/a70f+CIFQA
sWOk6wxMTb8R/TDLg4EfD323e35CSI5YPI09toslBV478q07X+B3QITPUBpEVUJq
zmngiWuST2olCLt6ogx3yzJXPq5K80NEq7bqgiPxXLOPnvZ323yeHjfzYvMQJw95
cCkiVcrxKoJnn5XKsYQ0VyB1ysSI9018IxPO+TallWhnpJH2eu4Q2LgyUW4ABJyX
Xbr+a7pyCcdT16eKAP1mF8SWShU3LEwxMJnZcBucWiiS/QYyE2YnNnhGTnxUSjm3
8GJQwUHuCm0hx25FdaWd6Yzd28++707Zw6wY8u1k4ozIi2k5HLclXPV6WoPuu+fz
t/lfyaPtHMUZ9O9J0x/KdN4ZKNUXhD5HF7GJSQH74AwwHXRzXWTY0zBoJS/daLMW
AlyuPu1QsYCprNsnwLqS0AVoWcOQFqrBHIXyzhOfskPt5axHTKNhrkRShUS+PJmq
7tsW6U9Hprl0MX+EK98JdMGMkZuhWjKwRW7gzZH0el75lBBIkoTXwmbJkQAqBfg5
EXgbkEtE3eoUplhrh4ry
=Hwdy
-----END PGP SIGNATURE-----

--Er97KPJOrxRt+yKZ--
