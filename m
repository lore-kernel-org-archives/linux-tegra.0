From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 4/8] memory: tegra: Add Tegra210 EMC clock driver
Date: Wed, 26 Feb 2020 17:57:46 +0100
Message-ID: <20200226165746.GA818759@ulmo>
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-5-josephl@nvidia.com>
 <403181d4-100b-679e-b1d8-c052c6d1f3ac@gmail.com>
 <2f9722b4-df92-546b-9659-3b02768bbe41@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2f9722b4-df92-546b-9659-3b02768bbe41-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2019 at 10:45:01AM +0800, Joseph Lo wrote:
> On 5/29/19 9:26 PM, Dmitry Osipenko wrote:
> > 29.05.2019 11:21, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > This is the initial patch for Tegra210 EMC clock driver, which doesn't
> > > include the support code and detail sequence for clock scaling yet.
> > >=20
> > > The driver is designed to support LPDDR4 SDRAM. Because of the LPDDR4
> > > devices need to do initial time training before it can be used, the
> > > firmware will help to do that at early boot stage. Then, the trained
> > > table of the rates we support will pass to the kernel via DT. So the
> > > driver can get the trained table for clock scaling support.
> > >=20
> > > For the higher rate support (above 800MHz), the periodic training is
> > > needed for the timing compensation. So basically, two methodologies f=
or
> > > clock scaling are supported, one is following the clock changing
> > > sequence to update the EMC table to EMC registers and another is if t=
he
> > > rate needs periodic training, then we will start a timer to do that
> > > periodically until it scales to the lower rate.
> > >=20
> > > Based on the work of Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
> > >=20
> > > Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > > v4:
> > > - remove the statistic data in debugfs
> > > - add tegra210_clk_register_emc API to make it compatible with the ca=
se
> > >    if the kernel still uses the older DTB which doesn't have EMC node.
> > >    And the MC and EMC clock can still be registered successfully.
> > > v3:
> > > - address almost all the comments from the previous version
> > > - remove the DT parser of EMC table
> > > - The EMC table is passing as a binary blob now.
> > > ---
> > >   drivers/memory/tegra/Kconfig        |  10 +
> > >   drivers/memory/tegra/Makefile       |   1 +
> > >   drivers/memory/tegra/tegra210-emc.c | 671 +++++++++++++++++++++++++=
+++
> > >   drivers/memory/tegra/tegra210-emc.h | 156 +++++++
> > >   include/soc/tegra/emc.h             |   2 +
> > >   5 files changed, 840 insertions(+)
> > >   create mode 100644 drivers/memory/tegra/tegra210-emc.c
> > >   create mode 100644 drivers/memory/tegra/tegra210-emc.h
> > >=20
> > > diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kcon=
fig
> > > index 4680124ddcab..9d051bcdbee3 100644
> > > --- a/drivers/memory/tegra/Kconfig
> > > +++ b/drivers/memory/tegra/Kconfig
> > > @@ -26,3 +26,13 @@ config TEGRA124_EMC
> > >   	  Tegra124 chips. The EMC controls the external DRAM on the board.
> > >   	  This driver is required to change memory timings / clock rate for
> > >   	  external memory.
> > > +
> > > +config TEGRA210_EMC
> > > +	bool "NVIDIA Tegra210 External Memory Controller driver"
> > > +	default y
> >=20
> > This is not enough since you're leaving possibility to disable
> > compilation of the driver, but the compilation will fail because of the
> > unresolved symbol (tegra210_clk_register_emc).
> >=20
> > > +	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
> > > +	help
> > > +	  This driver is for the External Memory Controller (EMC) found on
> > > +	  Tegra210 chips. The EMC controls the external DRAM on the board.
> > > +	  This driver is required to change memory timings / clock rate for
> > > +	  external memory.
> >=20
> > Either TEGRA210_EMC Kconfig option shall be always force-selected for
> > T210 or you should move all the clk-related code into drivers/clk/tegra=
/.
> >=20
> > Could you please give a rationale for having EMC clock code within the
> > EMC driver?
>=20
> I didn't have a specific reason for that initially, just wanted the clock
> code and EMC driver together for easier maintenance.
>=20
> But considering the fix in v4, that makes it backward compatible with the
> case if the kernel uses the older DT without EMC node, I think it's better
> to move the clock code into the clk folder now.

I looked into this a bit and I don't think this is actually worth it.
The problem is that, as opposed to Tegra124 and earlier, the sequence
for changing the EMC frequency is much more entangled. The bulk of the
programming will be on the EMC side, with the code occasionally calling
into CAR code to set the parent clock and some other flags.

So there's going to be some interdependencies regardless of where the
clock code actually lives. I can try to split this apart, but I don't
have very high hopes that the end result will be any cleaner than the
version here.

Thierry

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5Wo4YACgkQ3SOs138+
s6FCXA//bWBXN7bSyzNc46zqWag8Is1uVhZgTR0H59XJTfsxw4K+6eDOpVcVCmLa
0cSrwEsh+4ggJuXovFA7ISWgbgRMM9eL+tv8gxtWheXtuPco2OzUfLGSe+rE7fCn
/boebHLd+04IRklVz0BkjmwtLVmzbTAMGV1SRc75Wz0eg9AqEoVNMBYEHnyZ3Z+n
po6Spd1ITGZdAZ1H3UA4UhGusFmDGDOLEbQPTSOs2iSRYFr08PJngqv28fsLTNnn
eXm8f97NJedT5LhgQNxA2jZE9Frg6YBO8bgikL0UpCP3hMW8F3lXA0F4Rf8Nt+ZM
sX3H0WXs3iwFcr7KzK2QGWntXKWhUpjNiZtrjgo+wXuzeMxOSgcfgC/DskEuSFHk
IQvKAxM2W2iyh6QfiZhUpDzF1rHY3RggAEWsLpXGqzTizfiXUu1yb1SEQuC7wxmg
lawIhYSMykcVb6+m/TUuN+FxbFSeofft9xA4hMa33OoQ9M3NlljppxsgR1YRijGy
/YdClu/Jibzt+qKmRHtkjWYMe9VvAeLhMpr1W7aadFp5+vSGACVHn+DB9c6SGQoZ
oU9FMiSEnfgwV6rbTO7NegUHWNbnqHDzFk4dl21ZGOYIbgvTA4sUq/R0HxqdNoks
ejGKyBWQ/H7hFdR3IQ6EvvnqWuvQymbHp/Sua9oIDb9s3vTWn3Q=
=BuGo
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
