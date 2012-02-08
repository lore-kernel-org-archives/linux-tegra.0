From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: Add support for USB2 port on Seaboard
Date: Wed, 8 Feb 2012 11:29:56 -0800
Message-ID: <CAOesGMhPj2mikibbuJ-HbB5TbwM7b7kjWF_s1fAMkq8oMnEdOw@mail.gmail.com>
References: <1328700298-14408-1-git-send-email-jilin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328700298-14408-1-git-send-email-jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wed, Feb 8, 2012 at 3:24 AM, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> 1. ULPI_RESET* is routed to GPIO_PV1, based on schematic file.
> 2. Reference clock to ULPI PHY is 24MHz. It comes from PLL_P_OUT4.
> 3. Because PLL_P_OUT4 is assigned to provide clock to ULPI PHY. We us=
e
> PLL_C_OUT1 as clock source to SCLK (also update its children like HCL=
K
> and PCLK).

This is something that is more or less true for all tegra2 platforms
(that could be using ULPI), correct? If so, these table changes should
be made in the common.c table instead.

> 4. Also modify the clock rate of SCLK from 108MHz to 120MHz (copied f=
rom
> ChromeOs kernel code).

Unrelated to this change so should be a separate patch. Also, the need
for the change needs to be motivated.

> diff --git a/arch/arm/mach-tegra/board-seaboard.c b/arch/arm/mach-teg=
ra/board-seaboard.c
> index bf13ea3..462ba1d 100644
> --- a/arch/arm/mach-tegra/board-seaboard.c
> +++ b/arch/arm/mach-tegra/board-seaboard.c
> @@ -64,6 +64,11 @@ static struct platform_device debug_uart =3D {
>
> =A0static __initdata struct tegra_clk_init_table seaboard_clk_init_ta=
ble[] =3D {
> =A0 =A0 =A0 =A0/* name =A0 =A0 =A0 =A0 parent =A0 =A0 =A0 =A0 =A0rate=
 =A0 =A0 =A0 =A0 =A0 =A0enabled */
> + =A0 =A0 =A0 { "pll_p_out4", "pll_p", =A0 =A0 =A0 =A024000000, =A0 =A0=
 =A0 true },
> + =A0 =A0 =A0 { "pll_c_out1", "pll_c", =A0 =A0 =A0 =A0120000000, =A0 =
=A0 =A0true },
> + =A0 =A0 =A0 { "sclk", =A0 =A0 =A0 "pll_c_out1", =A0 120000000, =A0 =
=A0 =A0true },
> + =A0 =A0 =A0 { "hclk", =A0 =A0 =A0 "sclk", =A0 =A0 =A0 =A0 120000000=
, =A0 =A0 =A0true },
> + =A0 =A0 =A0 { "pclk", =A0 =A0 =A0 "hclk", =A0 =A0 =A0 =A0 60000000,=
 =A0 =A0 =A0 true },
> =A0 =A0 =A0 =A0{ "uartb", =A0 =A0 =A0"pll_p", =A0 =A0 =A0 =A021600000=
0, =A0 =A0 =A0true},
> =A0 =A0 =A0 =A0{ "uartd", =A0 =A0 =A0"pll_p", =A0 =A0 =A0 =A021600000=
0, =A0 =A0 =A0true},
> =A0 =A0 =A0 =A0{ "pll_a", =A0 =A0 =A0"pll_p_out1", =A0 56448000, =A0 =
=A0 =A0 true },
> @@ -203,6 +208,7 @@ static int seaboard_ehci_init(void)
> =A0 =A0 =A0 =A0gpio_set_value(TEGRA_GPIO_USB1, 1);
>
> =A0 =A0 =A0 =A0platform_device_register(&tegra_ehci1_device);
> + =A0 =A0 =A0 platform_device_register(&tegra_ehci2_device);
> =A0 =A0 =A0 =A0platform_device_register(&tegra_ehci3_device);
>
> =A0 =A0 =A0 =A0return 0;
> diff --git a/arch/arm/mach-tegra/devices.c b/arch/arm/mach-tegra/devi=
ces.c
> index 7a2a02d..977716e 100644
> --- a/arch/arm/mach-tegra/devices.c
> +++ b/arch/arm/mach-tegra/devices.c
> @@ -441,8 +441,13 @@ static struct resource tegra_usb3_resources[] =3D=
 {
> =A0};
>
> =A0static struct tegra_ulpi_config tegra_ehci2_ulpi_phy_config =3D {
> +#ifdef CONFIG_MACH_SEABOARD
> + =A0 =A0 =A0 /* Use GPIO PV1 for phy reset */
> + =A0 =A0 =A0 .reset_gpio =3D TEGRA_GPIO_PV1,
> +#else
> =A0 =A0 =A0 =A0/* All existing boards use GPIO PV0 for phy reset */
> =A0 =A0 =A0 =A0.reset_gpio =3D TEGRA_GPIO_PV0,
> +#endif

No ifdef in C files please. You should consider moving this to device
tree instead.


-Olof
