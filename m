From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 00/13] Add support for Tegra DPAUX pinctrl
Date: Fri, 17 Jun 2016 18:58:42 +0200
Message-ID: <20160617165842.GP27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <20160617165611.GO27475@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wg9FEZT+WCTrEXgJ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160617165611.GO27475-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wg9FEZT+WCTrEXgJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 06:56:11PM +0200, Thierry Reding wrote:
> On Fri, Jun 17, 2016 at 01:03:34PM +0100, Jon Hunter wrote:
> > The Display Port Auxiliary (DPAUX) channel pads can be shared with an
> > internal I2C controller. Add pinctrl support for these pads so that the
> > I2C controller can request and use these pads.
> >=20
> > Jon Hunter (13):
> >   drm/tegra: Clean-up if probing DPAUX fails
> >   drm/tegra: Add helper functions for setting up DPAUX pads
> >   dt-bindings: drm/tegra: Update DPAUX documentation
> >   drm/tegra: Add sor-safe clock for DPAUX on Tegra210
> >   drm/tegra: Prepare DPAUX for supporting generic PM domains
> >   pinctrl: pinconf: Add generic helper function for freeing mappings
> >   dt-bindings: i2c: Add support for 'i2c-bus' subnode
> >   i2c: core: Add support for 'i2c-bus' subnode
> >   dt-bindings: drm/tegra: Add DPAUX pinctrl documentation
> >   drm/tegra: Add pinctrl support for DPAUX
> >   arm64: tegra: Add SOR power-domain node
> >   arm64: tegra: Add sor-safe clock to DPAUX binding
> >   arm64: tegra: Add DPAUX pinctrl bindings
>=20
> There aren't really any hard dependencies between all these patches,
> right? I think the worst case would be if the arm64 DTS changes get
> merged before the I2C core changes (i2c-bus node support), then the
> I2C core will complain about the pinmux nodes, but that wouldn't be
> fatal, or have any bad side-effects, right?

Oh wait... there's the pinctrl helper function that is a build-
dependency. Linus, would you be okay if I took that through the
drm-tegra tree along with the DPAUX driver change, and provide a
stable branch for you to resolve conflicts against if needed?

Thierry

--wg9FEZT+WCTrEXgJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZCxBAAoJEN0jrNd/PrOh9tIP/0k2nvhY19jVEpAFyJVQMV0Q
ZA9spNuPIMLAbD7AvSAngj8DHnwOU4HjL3mUYjf3cRuSg8waSEmGI4QaFNd3fXF1
/hrYUGC6iYFdr1JJRmwPjfDXzze64/mXJ/qnx7nZJjoLd0HgHfnq/Ib6nOGCBFQ7
csNqaJBuhw9KihumpuOZMCeeRLK142xBgdo53ZhYWI2nIJCyHJugO9K+BNgl+Xe0
t0XZWIt/NnVTVSa/rUD27CnNgfngWsOV5kcTiDOpfW1ebgxRTegoT+q6dZItABxA
wly5UuHq/bQC1yI1iMydPbi1DbW7UoQqKDXB3n5jWCh9AfyfBeJnyFsK+njur8jD
jF2Hn4nFaAwQuT4yF7J6hVJFIwKysfaBfXOYD3aYdC2ckKerpAQhWYZ4Af5BYjB8
j8x5tcb8YeP7A8m0XT+xhxuHTBxwL1GPlesM1opSm0vChpZRg5AHzi5ifKpoNux+
Cgy0/9Wpl1SLjCrIJFPshmSOTvK8LorEVN5GtzO+dl7tl1LdfZzDJoX1jsDklx6i
8KrGpOjJZuGEdFbPBFhyO49fSgU5UNHIEqPXnSzCX+y5zWI3IJ/FE+3Mvu2K0lz7
5F2KWEFBXfVxl2T0i1wg29CqW7dmPyfSxm6jdL1BRr8fm0E01Xfgnm9obTIMDXh+
4SqgDeMHwQKb2g78819k
=+75m
-----END PGP SIGNATURE-----

--wg9FEZT+WCTrEXgJ--
