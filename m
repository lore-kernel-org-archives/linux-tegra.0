From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1 09/12] soc/tegra: pmc: add pmc wake support for
 tegra210
Date: Wed, 22 May 2019 15:01:55 +0200
Message-ID: <20190522130155.GJ30938@ulmo>
References: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
 <1558481483-22254-10-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2fjX3cMESU3XgGmZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558481483-22254-10-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, jckuo@nvidia.com, talho@nvidia.com, josephl@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--2fjX3cMESU3XgGmZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 04:31:20PM -0700, Sowjanya Komatineni wrote:
> This patch implements PMC wakeup sequence for Tegra210 and defines
> common used wake events of RTC alarm and power key.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 120 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 120 insertions(+)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index f77ce4b827e3..5e68e1de1780 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -57,6 +57,7 @@
>  #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
>  #include <dt-bindings/gpio/tegra186-gpio.h>
>  #include <dt-bindings/gpio/tegra194-gpio.h>
> +#include <dt-bindings/gpio/tegra-gpio.h>
> =20
>  #define PMC_CNTRL			0x0
>  #define  PMC_CNTRL_INTR_POLARITY	BIT(17) /* inverts INTR polarity */
> @@ -66,6 +67,12 @@
>  #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>  #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
>  #define  PMC_CNTRL_MAIN_RST		BIT(4)
> +#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
> +
> +#define PMC_WAKE_MASK			0x0c
> +#define PMC_WAKE_LEVEL			0x10
> +#define PMC_WAKE_STATUS			0x14
> +#define PMC_SW_WAKE_STATUS		0x18
> =20
>  #define DPD_SAMPLE			0x020
>  #define  DPD_SAMPLE_ENABLE		BIT(0)
> @@ -96,6 +103,11 @@
> =20
>  #define PMC_SCRATCH41			0x140
> =20
> +#define PMC_WAKE2_MASK			0x160
> +#define PMC_WAKE2_LEVEL			0x164
> +#define PMC_WAKE2_STATUS		0x168
> +#define PMC_SW_WAKE2_STATUS		0x16c
> +
>  #define PMC_SENSOR_CTRL			0x1b0
>  #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>  #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
> @@ -1917,6 +1929,65 @@ static const struct irq_domain_ops tegra_pmc_irq_d=
omain_ops =3D {
>  	.alloc =3D tegra_pmc_irq_alloc,
>  };
> =20
> +static inline void clear_pmc_sw_wake_status(void)
> +{
> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
> +	if (tegra_get_chip_id() !=3D TEGRA20)

Please don't use tegra_get_chip_id(). We already have pmc->soc, so it
should be easy enough to add a flag to identify Tegra generations that
have this register. Another alternative would be to fill in all the wake
events that the generation supports and then iterate over that to find
out what the maximum wake event ID is and use that to determine which
registers are valid. I'm assuming Tegra20 supports less than 32 wake
events, hence why it doesn't need PMC_SW_WAKE_STATUS.

> +		tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
> +}
> +
> +static inline void clear_pmc_wake_status(void)
> +{
> +	u32 reg;

u32 value for consistency with the rest of the driver.

> +
> +	reg =3D tegra_pmc_readl(pmc, PMC_WAKE_STATUS);
> +	if (reg)
> +		tegra_pmc_writel(pmc, reg, PMC_WAKE_STATUS);

Is there any harm in writing 0 to these registers? Not that it matters
much, but the code here looks a little odd.

> +	if (tegra_get_chip_id() !=3D TEGRA20) {
> +		reg =3D tegra_pmc_readl(pmc, PMC_WAKE2_STATUS);
> +		if (reg)
> +			tegra_pmc_writel(pmc, reg, PMC_WAKE2_STATUS);
> +	}
> +}
> +
> +static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int=
 on)
> +{
> +	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
> +	unsigned int offset, bit;
> +	u32 pmc_wake_mask_reg;
> +	u32 value;
> +
> +	if (data->hwirq < 0)
> +		return 0;

Again, is this really necessary?

> +
> +	offset =3D data->hwirq / 32;
> +	bit =3D data->hwirq % 32;
> +
> +	clear_pmc_sw_wake_status();
> +
> +	/* enable PMC wake */
> +	value =3D tegra_pmc_readl(pmc, PMC_CNTRL);
> +	value |=3D PMC_CNTRL_LATCH_WAKEUPS;
> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
> +	usleep_range(110, 120);
> +
> +	value &=3D ~PMC_CNTRL_LATCH_WAKEUPS;
> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
> +	usleep_range(110, 120);
> +
> +	clear_pmc_wake_status();

Could you add a couple more comments describing what this does. Maybe
also inline the clear_pmc_{sw_,}wake_status() functions into this since
they are only used here.

> +
> +	pmc_wake_mask_reg =3D (offset) ? PMC_WAKE2_MASK : PMC_WAKE_MASK;

I think it'd be clearer to write this as:

	if (data->hwirq > 32)
		offset =3D PMC_WAKE2_MASK;
	else
		offset =3D PMC_WAKE_MASK;

> +	value =3D tegra_pmc_readl(pmc, pmc_wake_mask_reg);
> +	if (on)
> +		value |=3D 1 << bit;
> +	else
> +		value &=3D ~(1 << bit);
> +	tegra_pmc_writel(pmc, value, pmc_wake_mask_reg);
> +
> +	return 0;
> +}
> +
>  static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int=
 on)
>  {
>  	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
> @@ -1948,6 +2019,46 @@ static int tegra186_pmc_irq_set_wake(struct irq_da=
ta *data, unsigned int on)
>  	return 0;
>  }
> =20
> +static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int=
 type)
> +{
> +	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
> +	unsigned int offset, bit;
> +	u32 pmc_wake_lvl_reg;
> +	u32 value;
> +
> +	if (data->hwirq < 0)
> +		return 0;
> +
> +	offset =3D data->hwirq / 32;
> +	bit =3D data->hwirq % 32;
> +
> +	pmc_wake_lvl_reg =3D (offset) ? PMC_WAKE2_LEVEL : PMC_WAKE_LEVEL;

Same comment as for the PMC_WAKE*_MASK registers.

Thierry

> +	value =3D tegra_pmc_readl(pmc, pmc_wake_lvl_reg);
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		value |=3D 1 << bit;
> +		break;
> +
> +	case IRQ_TYPE_EDGE_FALLING:
> +	case IRQ_TYPE_LEVEL_LOW:
> +		value &=3D ~(1 << bit);
> +		break;
> +
> +	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
> +		value ^=3D 1 << bit;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	tegra_pmc_writel(pmc, value, pmc_wake_lvl_reg);
> +
> +	return 0;
> +}
> +
>  static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int=
 type)
>  {
>  	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
> @@ -2535,6 +2646,11 @@ static const struct pinctrl_pin_desc tegra210_pin_=
descs[] =3D {
>  	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
>  };
> =20
> +static const struct tegra_wake_event tegra210_wake_events[] =3D {
> +	TEGRA_WAKE_GPIO("power", 24, 0, 189), /*TEGRA_GPIO(X, 5)*/
> +	TEGRA_WAKE_IRQ("rtc", 16, 2),
> +};
> +
>  static const struct tegra_pmc_soc tegra210_pmc_soc =3D {
>  	.num_powergates =3D ARRAY_SIZE(tegra210_powergates),
>  	.powergates =3D tegra210_powergates,
> @@ -2552,10 +2668,14 @@ static const struct tegra_pmc_soc tegra210_pmc_so=
c =3D {
>  	.regs =3D &tegra20_pmc_regs,
>  	.init =3D tegra20_pmc_init,
>  	.setup_irq_polarity =3D tegra20_pmc_setup_irq_polarity,
> +	.pmc_irq_set_wake =3D tegra210_pmc_irq_set_wake,
> +	.pmc_irq_set_type =3D tegra210_pmc_irq_set_type,
>  	.reset_sources =3D tegra210_reset_sources,
>  	.num_reset_sources =3D ARRAY_SIZE(tegra210_reset_sources),
>  	.reset_levels =3D NULL,
>  	.num_reset_levels =3D 0,
> +	.num_wake_events =3D ARRAY_SIZE(tegra210_wake_events),
> +	.wake_events =3D tegra210_wake_events,
>  };
> =20
>  #define TEGRA186_IO_PAD_TABLE(_pad)					     \
> --=20
> 2.7.4
>=20

--2fjX3cMESU3XgGmZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzlSEEACgkQ3SOs138+
s6Hm4w/+NvbhQ40c0le7ni46eF1U5JHPFcmtR+4iq9mbVXEfqqzuBUJDUyUj11n0
973o8ur4c2WOi77FG2qZk/32iqST9qVaTseJvspqKPf9k1Z+C2+C/ffaTwFNdqQp
ofx5xWOOpcm6sH9SmmhcJDLnWVTRozD7t1oJzgOD7tkNAOKdOhnCqmkqI3Rnzz1D
0gKLDiE7XFbYLoDNEXmo10aprwpZMFQ5mH/Gp7eLJWg6LMWnF+ouZ/GjeApkRYDY
58pDBqpbBgqcihR3X7LjgA/dxvCXeDtDsD4qUvEENGY0401MqHgIRBkFzcyNoopO
4Glfb8M2hXyECXGazRAC3N/EqPBTiCWxWFK7sh/1I9ma+FsmUafNxA7SFz5TGUtM
At1PKQ+F852gO+X9eqldrXaGzfMJLP3Lj2Qtim77UuftUeU6yIThBsQFNI0N6T3I
MstXyEAweBE1PGvMr+pCoWPFRzFkkDQjjVmE4cPe9dbL/LcBXsXYS6ed5Z848I9E
Bh4bS95N59Se2BtsO9GRctPwBjDqlrui/bO01dsBGLKeFDdhxD2A1YC6T1YnEr02
0Lm6F3QH10inw6NVxQBKEhzzkdOXdD6hzyRCA0jQ7Ac7svo0CjkdzVI5HzIFgjwL
dvxA3kM+H5IhTSjEr9I1o0nvDcgwJgd+wt3qxh+PQ/Th976zaos=
=pLh5
-----END PGP SIGNATURE-----

--2fjX3cMESU3XgGmZ--
