From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
Date: Tue, 10 Mar 2020 18:10:25 +0100
Message-ID: <20200310171025.GD3079591@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
 <88d18719-b6dd-98d0-e147-f89eed2f3f0c@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <88d18719-b6dd-98d0-e147-f89eed2f3f0c@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:26:28PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 18:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Joseph Lo <josephl@nvidia.com>
> >=20
> > The EMC clock needs to carefully coordinate with the EMC controller
> > programming to make sure external memory can be properly clocked. Do so
> > by hooking up the EMC clock with an EMC provider that will specify which
> > rates are supported by the EMC and provide a callback to use for setting
> > the clock rate at the EMC.
> >=20
> > Based on work by Peter De Schrijver <pdeschrijver@nvidia.com>.
> >=20
> > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v5:
> > - major rework and cleanup
>=20
> ...
>=20
> > +u32 emc_readl(struct tegra_emc *emc, unsigned long offset)
> > +{
> > +	return readl_relaxed(emc->emc_base[REG_EMC] + offset);
> > +}
>=20
> static u32 emc_readl()
>=20
> > +u32 emc_readl_per_ch(struct tegra_emc *emc, int type,
> > +			    unsigned long offset)
>=20
> static u32 emc_readl_per_ch()

I think something went wrong here during a rebase. These are actually
supposed to be part of the EMC driver patch and are no longer needed in
the clock driver.

Thierry

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nygEACgkQ3SOs138+
s6Go7BAAtIjGuj40OUzzPquQVnTWUkzR2TnhGUCRZwzN625caWOJH8hMCv7Djey8
1wKJoORtan933YKqVNLCtn6GsV8hnfyM9cZ3rQKnYvUbaNQPritrOlE1oq2lH+6B
9LKudhswinPgNaToOqVsxhQPGGsZBpAuN4+zTFmGniDHswCyGuV76CVDrUkyqSu4
CiF7BfCWitZPEJMLCgDrmhWPQxejAjmAsO/ce+VC+plvlDdCChlqoqT3yz+KjEPr
32YyEFZ9MWnrbqLh+UHm+JE5rs4eq++kDbgf86OZ8JaVmYSo1mz/Sl4kEEoLh6OV
39qfF+QHsqy7jLSVww8EF6pWmiKpEIryhb3Qil9FMwFhu+i9tpL2WZYaFZ6qOstX
HKZm9I/ABVIQzixvwlHoJhOroxno0nWpyP6HJzOdW8q7FAF9yvH9ZyEPwT1y2T1e
T/m8IztVMS1kjkDNIEgnIeeXRfiEBNj4lJAXR4W6maAmmQ+HS7ioLXvOEYsm43M1
076vcA8ZgtKM1sOgvbT4Nl3wgYsZcJ5iIkOUB0yUfqpid6EbN4JR1Fz8FjI2l2Ry
NjAftd3fA0CBWjMBY4JwdJmNilWiK7y84K6MH92+j6gh+YnuC8uHLxKqrOUBCoJQ
sYndXufYEVVgSa/Ci7hMw53zRxEaZ8bGooBkIsiFnw0hpF7sLpo=
=rt6T
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--
