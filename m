From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: Implement Tegra186 PMC support
Date: Thu, 17 Nov 2016 18:52:18 +0100
Message-ID: <20161117175218.GA7751@ulmo.ba.sec>
References: <20161117171636.20580-1-thierry.reding@gmail.com>
 <0068ebe4-09f3-4434-fc38-071cf2d553bc@arm.com>
 <20161117173110.GA7915@ulmo.ba.sec>
 <efb274c8-d361-f4d1-95aa-547b9e941d68@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <efb274c8-d361-f4d1-95aa-547b9e941d68-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 05:40:35PM +0000, Sudeep Holla wrote:
>=20
>=20
> On 17/11/16 17:31, Thierry Reding wrote:
> > On Thu, Nov 17, 2016 at 05:28:53PM +0000, Sudeep Holla wrote:
> > >=20
> > >=20
> > > On 17/11/16 17:16, Thierry Reding wrote:
> > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > >=20
> > > > The power management controller on Tegra186 has changed in backward=
s-
> > > > incompatible ways with respect to earlier generations. This impleme=
nts a
> > > > new driver that supports inversion of the PMU interrupt as well as =
the
> > > > "recovery", "bootloader" and "forced-recovery" reboot commands.
> > > >=20
> > > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > >  .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |  34 +++++
> > > >  drivers/soc/tegra/Makefile                         |   2 +-
> > > >  drivers/soc/tegra/pmc-tegra186.c                   | 169 +++++++++=
++++++++++++
> > > >  3 files changed, 204 insertions(+), 1 deletion(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvi=
dia,tegra186-pmc.txt
> > > >  create mode 100644 drivers/soc/tegra/pmc-tegra186.c
> > > >=20
> > >=20
> > > [...]
> > >=20
> > > > diff --git a/drivers/soc/tegra/pmc-tegra186.c b/drivers/soc/tegra/p=
mc-tegra186.c
> > > > new file mode 100644
> > > > index 000000000000..ee28eddd8e3c
> > > > --- /dev/null
> > > > +++ b/drivers/soc/tegra/pmc-tegra186.c
> > >=20
> > > [...]
> > >=20
> > > > +
> > > > +	/*
> > > > +	 * If available, call the system restart implementation that was
> > > > +	 * registered earlier (typically PSCI).
> > > > +	 */
> > > > +	if (pmc->system_restart) {
> > > > +		pmc->system_restart(reboot_mode, cmd);
> > > > +		return NOTIFY_DONE;
> > > > +	}
> > > > +
> > >=20
> > > IIUC, Tegra186 implements PSCI v1.0 and it always takes above path.
> > > So what other platforms does this driver support ? The name is
> > > pmc-tegra186.c, hence the confusion.
> >=20
> > It's technically possible to run Tegra186 without PSCI enabled, or even
> > boot it with firmware that doesn't implement PSCI. In such cases it
>=20
> OK, with enable-method as "spin-table" I suppose ?

Yes, that would probably be the other choice for SMP.

> > would be nice to still be able to reboot via the PMC code above.
>=20
> I assume it's only for development purposes as you won't have much CPU
> power management support without PSCI.

This is what I had primarily in mind. Sometimes it might be useful to
boot without PSCI at all (as a poor man's way of disable SMP), in which
case this driver can still be used for reboot into the bootloader or
recovery mode.

Thierry

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYLe5PAAoJEN0jrNd/PrOhm0kP/A9I46gas9QqV+Y0hoqp/wUm
NjcGfBoYBPzsILknCrZBpQU6SSg7X6LTh+3wk+cFg3Lgu/WR01cI90XkeMESfvTl
nRC4SpO7Wcc6pr+JyUTHZy8/aTsDRZPOp1Gf0AT8ms9R2MiC/YgY0YszaymJUYcm
tmHCTiJX3Sq1SsF7I/RcGZxKUKfomXEvdV1sJwMO+pwqPhvdhS5GsonYzbq538a2
6ks/iMIGOzjJN77osLwK+uR/tT8pxuQd0SXzn2eDDDX4synlItkvHPOz5dr13EYJ
f+WXI2j4jvtq6ve8gdvvY7Z+h2AG3JPPUQBCq2iGmgDrmBwxlRNBdCO1w6rAaWtV
wh5/qJ+amM+7ARPBp8Mb8AyDClQWK6YWeblEPVxY2DpD3nC3gPkwwtTt3njQGAmE
2EtpozH7DtQD8ZaBjtjQrzeyaoP6NdK5T/BhsVb13bErdWND4CYG3TnPwI7wfyYv
PCmA/tqokq1e6FMKU70kEAdU6+lGLxXMkj66d+VFSPCWQbX1pLPEimnlRV3hIrx1
j6ZOEJDTMY9+gkP69aeOSJs3lrp/oRLwYeZbwyX5AaoyP6SI0VpEqJdLVODwpudZ
8VzAWh7rqdEa6+pygBVbaJkLCYxPc8HAQfG8kWghLIrtMC6wZxuUoRcN/+YXPwHI
TgnZFddlx/S931POmcq2
=nPgK
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
