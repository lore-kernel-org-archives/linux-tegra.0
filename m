From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: Tegra: Enable Harmony audio support
Date: Wed, 23 Feb 2011 13:08:01 -0800
Message-ID: <AANLkTi=Nxh8YKBSDhVVAW4Sqzd6yKj=D6X=R+9KT+UBK@mail.gmail.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
	<1298487532-5000-6-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298487532-5000-6-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 10:58 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> * Set up platform data required by I2C, and ASoC machine & codec driv=
ers.
> * Enable required GPIO pins as GPIOs.
> * Initialize audio-related clocks.
> * Correctly configure pinmux for audio-related GPIOs.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> NOTE: This patch will not apply until Olof's recently posted
> boards-for-next branch is merged.
>
> NOTE: This patch will not apply until the following two commits are
> present in Tegra for-next:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound-2.6.git
> 7cfe56172ac14d2031f1896ecb629033f71caafa
> ASoC: wm8903: Expose GPIOs through gpiolib
> Mark said he'd be OK with this being cherry-picked into the Tegra tre=
e.
>
> git://git.fluff.org/bjdooks/linux.git
> db811ca0f48578f9940f49f284ac81e336b264ad
> i2c: tegra: Add i2c support
> Ben hasn't been asked whether a cherry-pick is OK. We could ask, or s=
imply
> wait for the merge window to be open, Linus' tree to pick this change=
 up,
> Tegra for-next to be rebased on Linus' tree, and then apply the patch=
 below.
>
> Note: I manually tested cherry-picking both those changes into Tegra =
for-next,
> merging Olof's branch, and applying this patch series. The build succ=
eeded,
> and Harmony booted to a shell prompt.
>
> =A0arch/arm/mach-tegra/board-harmony-pinmux.c | =A0 16 +++++---
> =A0arch/arm/mach-tegra/board-harmony.c =A0 =A0 =A0 =A0| =A0 58 ++++++=
++++++++++++++++++++++
> =A0arch/arm/mach-tegra/board-harmony.h =A0 =A0 =A0 =A0| =A0 =A07 +++
> =A03 files changed, 75 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/board-harmony-pinmux.c b/arch/arm/ma=
ch-tegra/board-harmony-pinmux.c
> index 3ada474..4d63e2e 100644
> --- a/arch/arm/mach-tegra/board-harmony-pinmux.c
> +++ b/arch/arm/mach-tegra/board-harmony-pinmux.c
> @@ -27,11 +27,11 @@ static struct tegra_pingroup_config harmony_pinmu=
x[] =3D {
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_ATC, =A0 TEGRA_MUX_NAND, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_NORMAL},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_ATD, =A0 TEGRA_MUX_GMI, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_NORMAL},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_ATE, =A0 TEGRA_MUX_GMI, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_NORMAL},
> - =A0 =A0 =A0 {TEGRA_PINGROUP_CDEV1, TEGRA_MUX_OSC, =A0 =A0 =A0 =A0 =A0=
 TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_CDEV1, TEGRA_MUX_PLLA_OUT, =A0 =A0 =A0T=
EGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_NORMAL},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_CDEV2, TEGRA_MUX_PLLP_OUT4, =A0 =A0 TE=
GRA_PUPD_PULL_DOWN, TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_CRTP, =A0TEGRA_MUX_CRT, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_CSUS, =A0TEGRA_MUX_VI_SENSOR_CLK, TEGR=
A_PUPD_PULL_DOWN, TEGRA_TRI_TRISTATE},
> - =A0 =A0 =A0 {TEGRA_PINGROUP_DAP1, =A0TEGRA_MUX_DAP1, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DAP1, =A0TEGRA_MUX_DAP1, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_NORMAL},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DAP2, =A0TEGRA_MUX_DAP2, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DAP3, =A0TEGRA_MUX_DAP3, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DAP4, =A0TEGRA_MUX_DAP4, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> @@ -114,13 +114,13 @@ static struct tegra_pingroup_config harmony_pin=
mux[] =3D {
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_SLXK, =A0TEGRA_MUX_PCIE, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_SPDI, =A0TEGRA_MUX_RSVD2, =A0 =A0 =A0 =
=A0 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_SPDO, =A0TEGRA_MUX_RSVD2, =A0 =A0 =A0 =
=A0 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> - =A0 =A0 =A0 {TEGRA_PINGROUP_SPIA, =A0TEGRA_MUX_GMI, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_TRISTATE},
> - =A0 =A0 =A0 {TEGRA_PINGROUP_SPIB, =A0TEGRA_MUX_GMI, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_TRISTATE},
> - =A0 =A0 =A0 {TEGRA_PINGROUP_SPIC, =A0TEGRA_MUX_GMI, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_PULL_UP, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPIA, =A0TEGRA_MUX_GMI, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPIB, =A0TEGRA_MUX_GMI, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPIC, =A0TEGRA_MUX_GMI, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_PULL_UP, =A0 TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_SPID, =A0TEGRA_MUX_SPI1, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_SPIE, =A0TEGRA_MUX_SPI1, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_UP, =A0 TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_SPIF, =A0TEGRA_MUX_SPI1, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_TRISTATE},
> - =A0 =A0 =A0 {TEGRA_PINGROUP_SPIG, =A0TEGRA_MUX_SPI2_ALT, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPIG, =A0TEGRA_MUX_SPI2_ALT, =A0 =A0 =A0=
TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_SPIH, =A0TEGRA_MUX_SPI2_ALT, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_UAA, =A0 TEGRA_MUX_ULPI, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_UP, =A0 TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_UAB, =A0 TEGRA_MUX_ULPI, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_UP, =A0 TEGRA_TRI_TRISTATE},
> @@ -147,6 +147,10 @@ static struct tegra_gpio_table gpio_table[] =3D =
{
> =A0 =A0 =A0 =A0{ .gpio =3D TEGRA_GPIO_SD4_CD, =A0 =A0 =A0 =A0 =A0 =A0=
=2Eenable =3D true =A0},
> =A0 =A0 =A0 =A0{ .gpio =3D TEGRA_GPIO_SD4_WP, =A0 =A0 =A0 =A0 =A0 =A0=
=2Eenable =3D true =A0},
> =A0 =A0 =A0 =A0{ .gpio =3D TEGRA_GPIO_SD4_POWER, =A0 =A0 =A0 =A0 .ena=
ble =3D true =A0},
> + =A0 =A0 =A0 { .gpio =3D TEGRA_GPIO_CDC_IRQ, =A0 =A0 =A0 =A0 =A0 .en=
able =3D true =A0},
> + =A0 =A0 =A0 { .gpio =3D TEGRA_GPIO_HP_DET, =A0 =A0 =A0 =A0 =A0 =A0.=
enable =3D true =A0},
> + =A0 =A0 =A0 { .gpio =3D TEGRA_GPIO_INT_MIC_EN, =A0 =A0 =A0 =A0.enab=
le =3D true =A0},
> + =A0 =A0 =A0 { .gpio =3D TEGRA_GPIO_EXT_MIC_EN, =A0 =A0 =A0 =A0.enab=
le =3D true =A0},
> =A0};
>
> =A0void harmony_pinmux_init(void)
> diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegr=
a/board-harmony.c
> index 2c4a234..afa4b5e 100644
> --- a/arch/arm/mach-tegra/board-harmony.c
> +++ b/arch/arm/mach-tegra/board-harmony.c
> @@ -2,6 +2,7 @@
> =A0* arch/arm/mach-tegra/board-harmony.c
> =A0*
> =A0* Copyright (C) 2010 Google, Inc.
> + * Copyright (C) 2011 NVIDIA, Inc.
> =A0*
> =A0* This software is licensed under the terms of the GNU General Pub=
lic
> =A0* License version 2, as published by the Free Software Foundation,=
 and
> @@ -21,13 +22,19 @@
> =A0#include <linux/clk.h>
> =A0#include <linux/dma-mapping.h>
> =A0#include <linux/pda_power.h>
> +#include <linux/i2c.h>
> +#include <linux/i2c-tegra.h>
> =A0#include <linux/io.h>
>
> +#include <sound/wm8903.h>
> +
> =A0#include <asm/mach-types.h>
> =A0#include <asm/mach/arch.h>
> =A0#include <asm/mach/time.h>
> =A0#include <asm/setup.h>
>
> +#include <mach/gpio.h>
> +#include <mach/harmony_audio.h>
> =A0#include <mach/iomap.h>
> =A0#include <mach/irqs.h>
> =A0#include <mach/sdhci.h>
> @@ -60,11 +67,31 @@ static struct platform_device debug_uart =3D {
> =A0 =A0 =A0 =A0},
> =A0};
>
> +static struct harmony_audio_platform_data harmony_audio_pdata =3D {
> + =A0 =A0 =A0 .gpio_spkr_en =A0 =A0 =A0 =A0 =A0 =3D TEGRA_GPIO_SPKR_E=
N,
> + =A0 =A0 =A0 .gpio_hp_det =A0 =A0 =A0 =A0 =A0 =A0=3D TEGRA_GPIO_HP_D=
ET,
> + =A0 =A0 =A0 .gpio_int_mic_en =A0 =A0 =A0 =A0=3D TEGRA_GPIO_INT_MIC_=
EN,
> + =A0 =A0 =A0 .gpio_ext_mic_en =A0 =A0 =A0 =A0=3D TEGRA_GPIO_EXT_MIC_=
EN,
> +};
> +
> +static struct platform_device harmony_audio_device =3D {
> + =A0 =A0 =A0 .name =A0 =3D "tegra-snd-harmony",
> + =A0 =A0 =A0 .id =A0 =A0 =3D 0,
> + =A0 =A0 =A0 .dev =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =A0=3D &harmony_audio_pd=
ata,
> + =A0 =A0 =A0 },
> +};
> +
> =A0static struct platform_device *harmony_devices[] __initdata =3D {
> =A0 =A0 =A0 =A0&debug_uart,
> =A0 =A0 =A0 =A0&tegra_sdhci_device1,
> =A0 =A0 =A0 =A0&tegra_sdhci_device2,
> =A0 =A0 =A0 =A0&tegra_sdhci_device4,
> + =A0 =A0 =A0 &tegra_i2c_device1,
> + =A0 =A0 =A0 &tegra_i2s_device1,
> + =A0 =A0 =A0 &tegra_das_device,
> + =A0 =A0 =A0 &tegra_pcm_device,
> + =A0 =A0 =A0 &harmony_audio_device,
> =A0};
>
> =A0static void __init tegra_harmony_fixup(struct machine_desc *desc,
> @@ -80,6 +107,10 @@ static void __init tegra_harmony_fixup(struct mac=
hine_desc *desc,
> =A0static __initdata struct tegra_clk_init_table harmony_clk_init_tab=
le[] =3D {
> =A0 =A0 =A0 =A0/* name =A0 =A0 =A0 =A0 parent =A0 =A0 =A0 =A0 =A0rate=
 =A0 =A0 =A0 =A0 =A0 =A0enabled */
> =A0 =A0 =A0 =A0{ "uartd", =A0 =A0 =A0"pll_p", =A0 =A0 =A0 =A021600000=
0, =A0 =A0 =A0true },
> + =A0 =A0 =A0 { "pll_a", =A0 =A0 =A0"pll_p_out1", =A0 56448000, =A0 =A0=
 =A0 true },
> + =A0 =A0 =A0 { "pll_a_out0", "pll_a", =A0 =A0 =A0 =A011289600, =A0 =A0=
 =A0 true },
> + =A0 =A0 =A0 { "cdev1", =A0 =A0 =A0NULL, =A0 =A0 =A0 =A0 =A0 0, =A0 =
=A0 =A0 =A0 =A0 =A0 =A0true },
> + =A0 =A0 =A0 { "i2s1", =A0 =A0 =A0 "pll_a_out0", =A0 11289600, =A0 =A0=
 =A0 false},
> =A0 =A0 =A0 =A0{ NULL, =A0 =A0 =A0 =A0 NULL, =A0 =A0 =A0 =A0 =A0 0, =A0=
 =A0 =A0 =A0 =A0 =A0 =A00},
> =A0};
>
> @@ -103,6 +134,30 @@ static struct tegra_sdhci_platform_data sdhci_pd=
ata4 =3D {
> =A0 =A0 =A0 =A0.is_8bit =A0 =A0 =A0 =A0=3D 1,
> =A0};
>
> +static struct tegra_i2c_platform_data i2c_pdata1 =3D {
> + =A0 =A0 =A0 .bus_clk_rate =3D 400000,
> +};
> +
> +static struct wm8903_platform_data harmony_wm8903_pdata =3D {
> + =A0 =A0 =A0 .irq_active_low =3D 0,
> + =A0 =A0 =A0 .micdet_cfg =3D 0,
> + =A0 =A0 =A0 .micdet_delay =3D 100,
> + =A0 =A0 =A0 .gpio_base =3D GPIO_WM8903(0),
> + =A0 =A0 =A0 .gpio_cfg =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 WM8903_GPIO_NO_CONFIG,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 WM8903_GPIO_NO_CONFIG,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 WM8903_GPIO_NO_CONFIG,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 WM8903_GPIO_NO_CONFIG,
> + =A0 =A0 =A0 },
> +};
> +
> +static struct i2c_board_info __initdata wm8903_board_info =3D {
> + =A0 =A0 =A0 I2C_BOARD_INFO("wm8903", 0x1a),
> + =A0 =A0 =A0 .platform_data =3D &harmony_wm8903_pdata,
> + =A0 =A0 =A0 .irq =3D TEGRA_GPIO_TO_IRQ(TEGRA_GPIO_CDC_IRQ),
> +};
> +
> =A0static void __init tegra_harmony_init(void)
> =A0{
> =A0 =A0 =A0 =A0tegra_clk_init_from_table(harmony_clk_init_table);
> @@ -112,8 +167,11 @@ static void __init tegra_harmony_init(void)
> =A0 =A0 =A0 =A0tegra_sdhci_device1.dev.platform_data =3D &sdhci_pdata=
1;
> =A0 =A0 =A0 =A0tegra_sdhci_device2.dev.platform_data =3D &sdhci_pdata=
2;
> =A0 =A0 =A0 =A0tegra_sdhci_device4.dev.platform_data =3D &sdhci_pdata=
4;
> + =A0 =A0 =A0 tegra_i2c_device1.dev.platform_data =3D &i2c_pdata1;
>
> =A0 =A0 =A0 =A0platform_add_devices(harmony_devices, ARRAY_SIZE(harmo=
ny_devices));
> +
> + =A0 =A0 =A0 i2c_register_board_info(0, &wm8903_board_info, 1);
> =A0}
>
> =A0MACHINE_START(HARMONY, "harmony")
> diff --git a/arch/arm/mach-tegra/board-harmony.h b/arch/arm/mach-tegr=
a/board-harmony.h
> index 4fe33b8..fbf2304 100644
> --- a/arch/arm/mach-tegra/board-harmony.h
> +++ b/arch/arm/mach-tegra/board-harmony.h
> @@ -17,12 +17,19 @@
> =A0#ifndef _MACH_TEGRA_BOARD_HARMONY_H
> =A0#define _MACH_TEGRA_BOARD_HARMONY_H
>
> +#define GPIO_WM8903(_x_) =A0 =A0 =A0 =A0 =A0 =A0 =A0 (TEGRA_NR_GPIOS=
 + (_x_))
Can you name this HARMONY_GPIO_WM8903?

> +
> =A0#define TEGRA_GPIO_SD2_CD =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_PI=
5
> =A0#define TEGRA_GPIO_SD2_WP =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_PH=
1
> =A0#define TEGRA_GPIO_SD2_POWER =A0 =A0 =A0 =A0 =A0 TEGRA_GPIO_PT3
> =A0#define TEGRA_GPIO_SD4_CD =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_PH=
2
> =A0#define TEGRA_GPIO_SD4_WP =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_PH=
3
> =A0#define TEGRA_GPIO_SD4_POWER =A0 =A0 =A0 =A0 =A0 TEGRA_GPIO_PI6
> +#define TEGRA_GPIO_CDC_IRQ =A0 =A0 =A0 =A0 =A0 =A0 TEGRA_GPIO_PX3
> +#define TEGRA_GPIO_SPKR_EN =A0 =A0 =A0 =A0 =A0 =A0 GPIO_WM8903(2)
> +#define TEGRA_GPIO_HP_DET =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_PW2
> +#define TEGRA_GPIO_INT_MIC_EN =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_PX0
> +#define TEGRA_GPIO_EXT_MIC_EN =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_PX1
>
> =A0void harmony_pinmux_init(void);
>
> --
> 1.7.1
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
