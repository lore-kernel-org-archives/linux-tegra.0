From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 12/13] arm64: tegra: Add sor-safe clock to DPAUX
 binding
Date: Fri, 17 Jun 2016 18:47:46 +0200
Message-ID: <20160617164746.GM27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-13-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yklP1rR72f9kjNtc"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466165027-17917-13-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--yklP1rR72f9kjNtc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 17, 2016 at 01:03:46PM +0100, Jon Hunter wrote:
> Populate the 'sor-safe' clock for DPAUX devices on Tegra210 that require
> this clock for operation. Update the compatability string for the DPAUX
> instance at address 0x545c0000 to be "nvidia,tegra210-dpaux" to ensure
> that the 'sor-safe' clock is enabled for this device.

Does the second DPAUX need this, too? I have a vague recollection that
they were both slightly different.

Thierry

--yklP1rR72f9kjNtc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZCmxAAoJEN0jrNd/PrOhlGcP/3Lcp5M8d5khqNCvcUOTw8ts
XbTb3h2Zw3sWEBQdICczENHFnxo78VlAceLXkU4IEzmhTYIO6iMSFxS+tlqTSrx7
rAmoBUb0KKDNCiXjDSGCJ5PYttpi6yhRngjRalVLJL2+XRIs55/JBmYqGPTZsD1C
La92KTf+0U5NUv97+2nMrrfgcH9ue74Os6MfiN8H8/97RDo/omiWYch76HQkrbnn
QRt6todDdlPDbeKWmpsrhCnyQLoVZo8Iefd7WH4W5BhFce2wP8F2Dnl7v6TAZJbn
jJy9/lLkW/dtTnKB/xD52iqYwGCdat/o5Gcci00b0OwHLNsvTGR1EXEqsGQJRC9D
YuU9LDbWrx+j1Kx3Dc3v1IZ3N+mFRTb4BFLt4gqsHJgAzlvCgNWeOhfBE0P9kTDP
CYcIZQkabq8lt/wTKx4gxluB+C80v4DqQGmDewHnafinaQckJPP3v4k/kf41Xdb4
sJ+KC3ufUNEDqumunfcuUV75s89kaK1RSCSiiS5VnfxLdY8BxHoAjirco1+YDozg
4Hp4TMwTAAaf4it9UHHUgCrlC8u2lYH92wfqnba3J9377WSfkho0gk7Ap75pRBTJ
sXAwkAqkakY6R0icuz3rjp8XYMnGUH0yMrxNjXqOB5s6QgEvczvop4jb74M9Jxer
1OAorCPiPfrPnDJnnF/g
=x/XS
-----END PGP SIGNATURE-----

--yklP1rR72f9kjNtc--
