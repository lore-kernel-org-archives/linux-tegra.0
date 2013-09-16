From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: use %pa to print dma_addr_t
Date: Mon, 16 Sep 2013 17:17:17 +0200
Message-ID: <20130916151716.GA5613@ulmo>
References: <1378960909-15773-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1378960909-15773-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2013 at 09:41:49PM -0700, Olof Johansson wrote:
> This removes two warnings where dma_addr_t variables were printed using
> %x when built with CONFIG_ARM_LPAE=3Dy, thus having 64-bit dma_addr_t:
>=20
>   drivers/gpu/host1x/hw/cdma_hw.c:57:3: warning: format '%x' expects argu=
ment of type 'unsigned int', but argument 5 has type 'dma_addr_t'
>   drivers/gpu/host1x/hw/debug_hw.c:175:10: warning: format '%x' expects a=
rgument of type 'unsigned int', but argument 3 has type 'dma_addr_t'

Hi Olof,

I can't reproduce this. Does this perhaps depend on some other patch?
When I enable LPAE I do see similar warnings in drivers/iommu/tegra-*.c
and those can indeed be fixed using an equivalent patch.

Thierry

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSNyD8AAoJEN0jrNd/PrOhRsAP/208GNSrh0QqcEKk3HYahT0e
nCz5wR8KHgK5r6M7GBLo2N796Yc8h8FrB8U2Wmt1CrnoYc1P6cKqmPVCJHMbefl1
JUAC2dz0Zv+ryP/8pqJ5fHwqSuhjeOpsSVZdJ00/kFwTGm/6J0G18+osOtEduhtK
Ri7h7p5iZo2KDyPZSrwYXKyTzucdQOHP9W6aOYDV9ZCmb87jozr5NKEDfjYMQ1kf
SkpSdoCCIeJuhT586kqRp9TXQ07JVhwjYexZUfA3PExWODU4REmXQbSZL+cgs5zz
pPIjM3SX6jJt4hFDfkh2kISencrmvHbCjwdMHcOc62mtWG08Jnd5yfUAkQibMbOg
d21DPdIOEMvnr6XR7FTXSN3KLsUW25eWwiRgrhNexaGQWfe/j/XxH2nGsVM8ZS+4
DWiOJg3C66A4eKo1ZPG0RFnHu05eUDvexqFX4xzlOfNl60SOaioIj8DJ6WDuUXNm
/eqTSMXxrgKaNe4+aSCzzLEiuYMLqVnHmUHfybSM36ZrMnh24Us5OoeSSUCl9WKW
Vg+R9Oj7x8mT8oXkrlTZBy7pT5M+2i7Pp+jwJFyf8G0VZtDYRlsu4SgfBTCB4kxR
KAWN787XEFyQJeRfLiS4egYKq56OQE3vJVxVEHymBW+pds5MpZMloztdH3Qssx82
4aTM52OiAExTD6mFs2eZ
=Tkd3
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
