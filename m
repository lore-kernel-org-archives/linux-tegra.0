From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: Implement Tegra186 PMC support
Date: Fri, 18 Nov 2016 15:00:07 +0100
Message-ID: <20161118140007.GC14358@ulmo.ba.sec>
References: <20161117171636.20580-1-thierry.reding@gmail.com>
 <e9a081f5-8e93-d3e8-a702-79903e5a6a78@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e9a081f5-8e93-d3e8-a702-79903e5a6a78-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 09:36:04AM +0000, Jon Hunter wrote:
>=20
> On 17/11/16 17:16, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The power management controller on Tegra186 has changed in backwards-
> > incompatible ways with respect to earlier generations. This implements a
> > new driver that supports inversion of the PMU interrupt as well as the
> > "recovery", "bootloader" and "forced-recovery" reboot commands.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |  34 +++++
> >  drivers/soc/tegra/Makefile                         |   2 +-
> >  drivers/soc/tegra/pmc-tegra186.c                   | 169 +++++++++++++=
++++++++
> >  3 files changed, 204 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,=
tegra186-pmc.txt
> >  create mode 100644 drivers/soc/tegra/pmc-tegra186.c
>=20
> ...
>=20
> > diff --git a/drivers/soc/tegra/Makefile b/drivers/soc/tegra/Makefile
> > index ae857ff7d53d..9976a0de1927 100644
> > --- a/drivers/soc/tegra/Makefile
> > +++ b/drivers/soc/tegra/Makefile
> > @@ -1,4 +1,4 @@
> >  obj-y +=3D fuse/
> > =20
> >  obj-y +=3D common.o
> > -obj-y +=3D pmc.o
> > +obj-y +=3D pmc.o pmc-tegra186.o
>=20
> Do we want to enable this driver for all Tegra devices? Was not sure if
> this should be dependent on ARM64.

Yeah, I think adding an non-user-visible Kconfig symbol for this might
make sense. Then we can use Kconfig to encode the logic about where to
enable this and simply use the Kconfig symbol in the Makefile.

Thierry

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYLwlkAAoJEN0jrNd/PrOhHhMQALWqrKK6cyDU4FnMSaRvS5m2
cW7NVgvZEdvLysooyMD2Z1f/bLajYlh/ud8Yq0wd5AQju58AXVFzVBE0+0NU+aK4
QA7HhJl9MTC7A2CJv+pCV7rQAY5peaBadYj/ks+pLoSEoFj9jh9sA/vQritnG+Xw
9zZtT4i+QG+RtRvwwKX2pRDwNxdopx0z1/TszMfN1LZWi+9ZgweoYhR/jxPI9Cxg
uNG1+sBEaBfo9zyIAoNXLU+JJRjPSmsYDCrwQrVuC93jWrywveNn78kG/DaIm9Jm
CP7NbxUO9c/azHVkyzx1P1sBYp1VF2jUp0FVBk3fCQlp/GVsUs372BYLTxY6esnw
TJEil9XWmMEUa05euLhqPaosaHfI727OFGj/1TorNiW3+tQDPDiOVEOyxHuLcn5j
cdDowwFHRhrKd8q5aRgXA3Gi8zFvw9kZ2gpdfdoKCrOurI8JOgDRcNLUKAXFYcOs
SxpZOOahfByuksgZjjDQ5PigQ9Uj/bQRhpykIEacKPIEZV90X6Pcd3i5ys15cDHj
0qQc+W0WNtXXNa+P/CLS0Wiz6mXe/ZMA/9Mj9VNARhpzlmANz7dv38wxCRCwYPbP
oFdP7By9x4djWN+zFmF4aaHR0pzcRBWZ9AJ6tS5mUk/XXj1YNBo5TPQp8kxagxRa
AL3muICQo7nx1bxzVpCj
=ZZTj
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--
