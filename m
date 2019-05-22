From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1 08/12] soc/tegra: pmc: allow support for more tegra
 wake models
Date: Wed, 22 May 2019 14:49:44 +0200
Message-ID: <20190522124944.GI30938@ulmo>
References: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
 <1558481483-22254-9-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7IgncvKP0CVPV/ZZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558481483-22254-9-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, jckuo@nvidia.com, talho@nvidia.com, josephl@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--7IgncvKP0CVPV/ZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 04:31:19PM -0700, Sowjanya Komatineni wrote:
> This patch allows to create separate irq_set_wake and irq_set_type
> implementations for different tegra designs PMC that has different
> wake models which require difference wake registers and different
> programming sequence.
>=20
> AOWAKE model support is available for Tegra186 and Tegra194 only
> and it resides within PMC and supports tiered wake architecture.
>=20
> Tegra210 and prior tegra designs uses PMC directly to receive wake
> events and coordinate the wake sequence.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 5648e5c09ef5..f77ce4b827e3 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -235,6 +235,8 @@ struct tegra_pmc_soc {
>  	void (*setup_irq_polarity)(struct tegra_pmc *pmc,
>  				   struct device_node *np,
>  				   bool invert);
> +	int (*pmc_irq_set_wake)(struct irq_data *data, unsigned int on);
> +	int (*pmc_irq_set_type)(struct irq_data *data, unsigned int type);
> =20
>  	const char * const *reset_sources;
>  	unsigned int num_reset_sources;
> @@ -1915,12 +1917,15 @@ static const struct irq_domain_ops tegra_pmc_irq_=
domain_ops =3D {
>  	.alloc =3D tegra_pmc_irq_alloc,
>  };
> =20
> -static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
> +static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int=
 on)
>  {
>  	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
>  	unsigned int offset, bit;
>  	u32 value;
> =20
> +	if (data->hwirq < 0)
> +		return 0;
> +

This isn't going to work: data->hwirq is unsigned long so it will never
be < 0. Also, why is this necessary? I see that it's there in
tegra_pmc_irq_set_wake(), but I fail to remember why that's there. When
is this ever invalid?

Thierry

>  	offset =3D data->hwirq / 32;
>  	bit =3D data->hwirq % 32;
> =20
> @@ -1943,12 +1948,12 @@ static int tegra_pmc_irq_set_wake(struct irq_data=
 *data, unsigned int on)
>  	return 0;
>  }
> =20
> -static int tegra_pmc_irq_set_type(struct irq_data *data, unsigned int ty=
pe)
> +static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int=
 type)
>  {
>  	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
>  	u32 value;
> =20
> -	if (data->hwirq =3D=3D ULONG_MAX)
> +	if (data->hwirq < 0)
>  		return 0;
> =20
>  	value =3D readl(pmc->wake + WAKE_AOWAKE_CNTRL(data->hwirq));
> @@ -1996,8 +2001,10 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pm=
c)
>  	pmc->irq.irq_unmask =3D irq_chip_unmask_parent;
>  	pmc->irq.irq_eoi =3D irq_chip_eoi_parent;
>  	pmc->irq.irq_set_affinity =3D irq_chip_set_affinity_parent;
> -	pmc->irq.irq_set_type =3D tegra_pmc_irq_set_type;
> -	pmc->irq.irq_set_wake =3D tegra_pmc_irq_set_wake;
> +	if (pmc->soc->pmc_irq_set_type)
> +		pmc->irq.irq_set_type =3D pmc->soc->pmc_irq_set_type;
> +	if (pmc->soc->pmc_irq_set_wake)
> +		pmc->irq.irq_set_wake =3D pmc->soc->pmc_irq_set_wake;
> =20
>  	pmc->domain =3D irq_domain_add_hierarchy(parent, 0, 96, pmc->dev->of_no=
de,
>  					       &tegra_pmc_irq_domain_ops, pmc);
> @@ -2670,6 +2677,8 @@ static const struct tegra_pmc_soc tegra186_pmc_soc =
=3D {
>  	.regs =3D &tegra186_pmc_regs,
>  	.init =3D NULL,
>  	.setup_irq_polarity =3D tegra186_pmc_setup_irq_polarity,
> +	.pmc_irq_set_wake =3D tegra186_pmc_irq_set_wake,
> +	.pmc_irq_set_type =3D tegra186_pmc_irq_set_type,
>  	.reset_sources =3D tegra186_reset_sources,
>  	.num_reset_sources =3D ARRAY_SIZE(tegra186_reset_sources),
>  	.reset_levels =3D tegra186_reset_levels,
> @@ -2748,6 +2757,8 @@ static const struct tegra_pmc_soc tegra194_pmc_soc =
=3D {
>  	.regs =3D &tegra186_pmc_regs,
>  	.init =3D NULL,
>  	.setup_irq_polarity =3D tegra186_pmc_setup_irq_polarity,
> +	.pmc_irq_set_wake =3D tegra186_pmc_irq_set_wake,
> +	.pmc_irq_set_type =3D tegra186_pmc_irq_set_type,
>  	.num_wake_events =3D ARRAY_SIZE(tegra194_wake_events),
>  	.wake_events =3D tegra194_wake_events,
>  };
> --=20
> 2.7.4
>=20

--7IgncvKP0CVPV/ZZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzlRWYACgkQ3SOs138+
s6HkiBAAhdT95aojoGVVofzPjlKWofpbrp+5rqG5LnDZ7iadgclc101WMwJcSzrm
2A/5z0nN1QJFY4G0rN7+nOxYw1Cc/B5nGOzZjYDi5Z6bUj0l7dnjU8nizuEY0RuW
HLzQsncWD2HzQAbwXD3DNNcT7tn324PHZB5KMXPsy7F484X3Hq44IU5gDMJYEIXD
Ejn7CgXEd7bMmHS0Hkh5dxFk5jfeIKqjJtyS8fX39/m9it8mva/ctkQNgYi5RJSX
EcSc05JG78ft0d87IhPblahDRV5tjq/2x99LORMpHrmhwtm6X458mAi89ZpyRz+q
0KuK2LtvnRwNYtfFkX2SQ3FXIl6CgoY8LTkT8FUlL52lt/aRCGJqImulyjGmRY46
5Hkso6UtEihTchD/27JaIEFid5nSoycE/ib0HK1V26cloGn/eICNnCnqHrhEszaq
VNIeZ+SkRgCie7emmmhd/YXMj+gwOnNIuSshBkrw2P/84fSy3FCQjg+Fc5VjZT2j
XR1w5SOxnXxmE72EItt7oJsaaluxe1R77edh1LWUuLj24XjYG3lT27FWh2X7E+Hg
zqFIQ89btCRHtozs4ngEsSyXU4+FlZNRIT17bww1sAbFECWst9nagh7nTsz/rFuF
nV0lGoapFYY8Frtt/7pP3vy9wnQ/f4xYzpMFIC6LbSJvk4oQWIU=
=ZN1C
-----END PGP SIGNATURE-----

--7IgncvKP0CVPV/ZZ--
