From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] reset: Add Tegra BPMP reset driver
Date: Tue, 15 Nov 2016 18:38:48 +0100
Message-ID: <20161115173848.GA12764@ulmo.ba.sec>
References: <20161115161749.31221-1-thierry.reding@gmail.com>
 <1479229876.2456.41.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479229876.2456.41.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2016 at 06:11:16PM +0100, Philipp Zabel wrote:
> Hi Thierry,
>=20
> Am Dienstag, den 15.11.2016, 17:17 +0100 schrieb Thierry Reding:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > This driver uses the services provided by the BPMP firmware driver to
> > implement a reset driver based on the MRQ_RESET request.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Hi Philipp,
> >=20
> > I'm looking for an Acked-by on this because there are complicated
> > dependencies between this and other branches in the Tegra tree, so I
> > think it would be easiest to merge through that.
> >=20
> > Thanks,
> > Thierry
> >=20
> >  drivers/reset/Kconfig            |  1 +
> >  drivers/reset/Makefile           |  1 +
> >  drivers/reset/tegra/Kconfig      |  3 ++
> >  drivers/reset/tegra/Makefile     |  1 +
> >  drivers/reset/tegra/reset-bpmp.c | 71 ++++++++++++++++++++++++++++++++=
++++++++
> >  5 files changed, 77 insertions(+)
> >  create mode 100644 drivers/reset/tegra/Kconfig
> >  create mode 100644 drivers/reset/tegra/Makefile
> >  create mode 100644 drivers/reset/tegra/reset-bpmp.c
> >=20
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 06d9fa2f3bc0..172dc966a01f 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -94,5 +94,6 @@ config RESET_ZYNQ
> > =20
> >  source "drivers/reset/sti/Kconfig"
> >  source "drivers/reset/hisilicon/Kconfig"
> > +source "drivers/reset/tegra/Kconfig"
> > =20
> >  endif
> > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > index bbe7026617fc..13b346e03d84 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -1,6 +1,7 @@
> >  obj-y +=3D core.o
> >  obj-y +=3D hisilicon/
> >  obj-$(CONFIG_ARCH_STI) +=3D sti/
> > +obj-$(CONFIG_ARCH_TEGRA) +=3D tegra/
>=20
> Could drivers therein be compiled without ARCH_TEGRA enabled? If so,
> please use obj-y here.
>=20
> >  obj-$(CONFIG_RESET_ATH79) +=3D reset-ath79.o
> >  obj-$(CONFIG_RESET_BERLIN) +=3D reset-berlin.o
> >  obj-$(CONFIG_RESET_LPC18XX) +=3D reset-lpc18xx.o
> > diff --git a/drivers/reset/tegra/Kconfig b/drivers/reset/tegra/Kconfig
> > new file mode 100644
> > index 000000000000..0ec57a7016e6
> > --- /dev/null
> > +++ b/drivers/reset/tegra/Kconfig
> > @@ -0,0 +1,3 @@
> > +config RESET_TEGRA_BPMP
> > +	def_bool y
> > +	depends on TEGRA_BPMP
>=20
> Or probably not, it looks like TEGRA_BPMP depends on ARCH_TEGRA and
> doesn't provide any stubs. I think this could be just
> 	def_bool TEGRA_BPMP
> though. But see below, RESET_TEGRA_BPMP doesn't seem to be used at all.

Yes, this is all really Tegra-specific, so I don't think it makes sense
to allow building this without.

> > diff --git a/drivers/reset/tegra/Makefile b/drivers/reset/tegra/Makefile
> > new file mode 100644
> > index 000000000000..fd943b1ae029
> > --- /dev/null
> > +++ b/drivers/reset/tegra/Makefile
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_ARCH_TEGRA_186_SOC)	+=3D reset-bpmp.o
>=20
> This should probably be obj-$(CONFIG_RESET_TEGRA_BPMP).

Yes indeed. I had introduced RESET_TEGRA_BPMP is a way of resolving the
dependencies more nicely. The code structure is such that the BPMP
driver needs to call clock and reset drivers, and there are
CLOCK_TEGRA_BPMP and RESET_TEGRA_BPMP symbols to protect those bits of
the code and avoid a circular dependency.

> > diff --git a/drivers/reset/tegra/reset-bpmp.c b/drivers/reset/tegra/res=
et-bpmp.c
> > new file mode 100644
> > index 000000000000..5daf2ee1a396
> > --- /dev/null
> > +++ b/drivers/reset/tegra/reset-bpmp.c
> > @@ -0,0 +1,71 @@
> > +/*
> > + * Copyright (C) 2016 NVIDIA Corporation
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/reset-controller.h>
> > +
> > +#include <soc/tegra/bpmp.h>
> > +#include <soc/tegra/bpmp-abi.h>
> > +
> > +static struct tegra_bpmp *to_tegra_bpmp(struct reset_controller_dev *r=
stc)
> > +{
> > +	return container_of(rstc, struct tegra_bpmp, rstc);
> > +}
> > +
> > +static int tegra_bpmp_reset_common(struct reset_controller_dev *rstc,
> > +				   enum mrq_reset_commands command,
> > +				   unsigned int id)
> > +{
> > +	struct tegra_bpmp *bpmp =3D to_tegra_bpmp(rstc);
> > +	struct mrq_reset_request request;
> > +	struct tegra_bpmp_message msg;
> > +
> > +	memset(&request, 0, sizeof(request));
> > +	request.cmd =3D command;
> > +	request.reset_id =3D id;
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.mrq =3D MRQ_RESET;
> > +	msg.tx.data =3D &request;
> > +	msg.tx.size =3D sizeof(request);
> > +
> > +	return tegra_bpmp_transfer(bpmp, &msg);
> > +}
> > +
> > +static int tegra_bpmp_reset_module(struct reset_controller_dev *rstc,
> > +				   unsigned long id)
> > +{
> > +	return tegra_bpmp_reset_common(rstc, CMD_RESET_MODULE, id);
> > +}
> > +
> > +static int tegra_bpmp_reset_assert(struct reset_controller_dev *rstc,
> > +				   unsigned long id)
> > +{
> > +	return tegra_bpmp_reset_common(rstc, CMD_RESET_ASSERT, id);
> > +}
> > +
> > +static int tegra_bpmp_reset_deassert(struct reset_controller_dev *rstc,
> > +				     unsigned long id)
> > +{
> > +	return tegra_bpmp_reset_common(rstc, CMD_RESET_DEASSERT, id);
> > +}
> > +
> > +static const struct reset_control_ops tegra_bpmp_reset_ops =3D {
> > +	.reset =3D tegra_bpmp_reset_module,
> > +	.assert =3D tegra_bpmp_reset_assert,
> > +	.deassert =3D tegra_bpmp_reset_deassert,
> > +};
> > +
> > +int tegra_bpmp_init_resets(struct tegra_bpmp *bpmp)
> > +{
> > +	bpmp->rstc.ops =3D &tegra_bpmp_reset_ops;
> > +	bpmp->rstc.owner =3D THIS_MODULE;
> > +	bpmp->rstc.of_node =3D bpmp->dev->of_node;
> > +	bpmp->rstc.nr_resets =3D bpmp->soc->num_resets;
> > +
> > +	return devm_reset_controller_register(bpmp->dev, &bpmp->rstc);
> > +}
>=20
> With the Kconfig symbol confusion resolved,
>=20
> Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>=20
> to merge this via the Tegra trees.

Great, I'll make that change and merge through the Tegra tree.

Thanks!
Thierry

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYK0glAAoJEN0jrNd/PrOhwcwP/19swDq5YWKEXGzWWbVyuwMG
bHve8rd3WTUpe1W5BGfMb1KBJo0aLpLyFGI2oINNJHYpXXHrCnaeQ4j2kdtejndT
f3XaE2J4MiphqPpfp7bparRe1IXCdZ7gexgS7TEFaQ09XNyplmhbYhApsNrZ+N6Q
FvFZYrtu1O24gdAPyrfYNa4+yBn9cRzFGJBfs3pwOsNK0Jnfhnp7lIHGRA8zVXmp
sLkUU49hzbixdAuwz5YXrYPyLYUvnL4nyd0hdS+v7ctEASfs5iSy+9AautY2JfSd
RLG4CZrFdILifmtG11dKvh9SXZSJgqQqttjZ+faQJ/5obNCgaITLq887Ho7ar4WY
X4+mz7WdGfokc7OlV5deCu5Y/tfO6kiCnlxM6Zrf3APCWjVxt4+bOCgNHoGaaSKK
QQ49ucpqgQYfvOVvUY765f998jl3rEoaewo5vsdN0vgou4HJ9tFNUecGyuExGRCb
MaWZvlyfR4VKhelUOPXK0nW6HmJ/UGjpDlQi2PkO3yCji4SvrtWbi5udQwR4kmwO
DQ6u8vftwQg6ivsJ3UnSMjDYRS1gunIZl+mH/0XAS09KTOij1Gv6RSlhSSXd7PDm
X3Os3wd8JB66bsBIHNy8wjy1yvkX+aSXdPCSgwA0e30o2E0gFOKD6ow3dQKhSSJ3
PKpgB22jm/eqGFXuNRnl
=GD1U
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
