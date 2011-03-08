From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: harmony: initialize the TPS65862 PMIC
Date: Tue, 8 Mar 2011 23:12:06 +0100
Message-ID: <201103082312.06911.marvin24@gmx.de>
References: <cover.1299588456.git.mike@compulab.co.il> <4ade6d195fff78271085eafb0a99de3be8beb426.1299588456.git.mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4ade6d195fff78271085eafb0a99de3be8beb426.1299588456.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Mike,

Am Dienstag 08 M=C3=A4rz 2011, um 13:58:58 schrieb Mike Rapoport:
> Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> ---
>  arch/arm/mach-tegra/Makefile              |    1 +
>  arch/arm/mach-tegra/board-harmony-power.c |  161 +++++++++++++++++++=
++++++++++
>  arch/arm/mach-tegra/board-harmony.c       |    1 +
>  arch/arm/mach-tegra/board-harmony.h       |    1 +
>  4 files changed, 164 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-tegra/board-harmony-power.c

=2E..
>=20
> diff --git a/arch/arm/mach-tegra/board-harmony-power.c b/arch/arm/mac=
h-tegra/board-harmony-power.c
> new file mode 100644
> index 0000000..ca43d7a
> --- /dev/null
> +++ b/arch/arm/mach-tegra/board-harmony-power.c
=2E..
> +static struct i2c_board_info __initdata harmony_regulators[] =3D {
> +	{
> +		I2C_BOARD_INFO("tps6586x", 0x34),
> +		.irq		=3D INT_EXTERNAL_PMU,
> +		.platform_data	=3D &tps_platform,
> +	},
> +};
> +
> +int __init harmony_regulator_init(void)
> +{
> +	i2c_register_board_info(3, harmony_regulators, 1);

I don't know harmony well, but are you sure this is 3, not 4, as on all=
 other boards?

Marc
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
