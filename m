From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/12] Initial Tegra186 support
Date: Mon, 28 Nov 2016 08:33:15 +0100
Message-ID: <20161128073315.GA18805@ulmo.ba.sec>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
 <20161126133927.GE20568@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161126133927.GE20568-5NIqAleC692hcjWhqY66xCZi+YwRKgec@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 26, 2016 at 02:39:27PM +0100, Pavel Machek wrote:
> Hi!
>=20
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Hi everyone,
> >=20
> > This is a set of patches to add initial support for Tegra186. It is
> > based on Joseph's patches but I rewrote some of the drivers to be a
> > little easier to comprehend and maintain (hopefully). I've also
> > included clock and reset drivers as a proof of concept.
>=20
> Is there any phone/tablet on the market with this chipset?

I'm not aware of any. The chip is primarily targetted at automotive
use-cases and probably not suited for phones or tablets.

Thierry

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYO922AAoJEN0jrNd/PrOhO0oP/1TN9yID0rD2xOwWhpz3Pesy
lUtHboHlVTsttsjgVdDhNNKL8nGu3d2d/fqh3O48h/k/1sKrJ29nIQ6IOx5PeMPs
qeDh6u404PdxI8ZDdxbMPgdvGhHE1LwtNs80LJo46VypcDBEAQegDYWdvlkn9pfB
VJMLsNCjL/K3VVihjhiCYNt855URC9FWwKafSLEw+5QwhB9ZKxB/DyQCB3NHKEAS
pdD993o2Pa2MY3sfnWVfsBuBNEgA8L6HLcdPiOq6pJZKcalDxiz+f77QWNKgQtf3
ncVOGcEan1l5aqnxn8ejyePqhGW3gERqRylQamLJH2rUq0wTIpC/Jou6fPDOUtSv
eTKoauP2R/2WSv0J1+ORGBOz8SfSumXAgQ9Qh9N9XGDEnHVmT8cNrYZyCW31yDkS
2YPMH+xLcvFIRgH00/rs2MdPNoADsFPtX3s/oQJAIOTyExs0+xErtKYX497XXAIF
SNIO4cu98K+qsJanhDCSfuSpOnyUfPF8gE8c7Kl3j6d+mza0787RkatSQDaL6ijn
clYq4Tg6dRQaVwUhspbuOH4T14SRJwWQl5lETiCSQPIZ0x2VV1PpAReDidxLPKGU
IdloWznUecJTGWd5bytSrx6MK8MYG4leR+QqAZBOAk49icQFUzdDPGje1NxffptK
wriit1Afwx3I3JT2FlN1
=P/EM
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
