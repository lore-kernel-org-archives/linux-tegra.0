From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: tegra: harmony: register sdhci devices
Date: Tue, 22 Feb 2011 11:40:38 -0800
Message-ID: <AANLkTi=hnshmy3h1AFs5HJSjuB+jJcaia93fxF8JUU9a@mail.gmail.com>
References: <1298354117-19097-1-git-send-email-olof@lixom.net>
	<1298354117-19097-5-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298354117-19097-5-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 9:55 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Add the 3 sdhci devices that are available on Harmony as
> platform devices. Two go to slots (one 4-lane, one 8-lane),
> and one goes to onboard wifi.
>
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/board-harmony.c | =A0 30 +++++++++++++++++++++=
+++++++++
> =A01 files changed, 30 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegr=
a/board-harmony.c
> index f6ad58b..7010774 100644
> --- a/arch/arm/mach-tegra/board-harmony.c
> +++ b/arch/arm/mach-tegra/board-harmony.c
> @@ -30,10 +30,13 @@
>
> =A0#include <mach/iomap.h>
> =A0#include <mach/irqs.h>
> +#include <mach/sdhci.h>
>
> =A0#include "board.h"
> =A0#include "board-harmony.h"
> =A0#include "clock.h"
> +#include "devices.h"
> +#include "gpio-names.h"
>
> =A0static struct plat_serial8250_port debug_uart_platform_data[] =3D =
{
> =A0 =A0 =A0 =A0{
> @@ -59,6 +62,9 @@ static struct platform_device debug_uart =3D {
>
> =A0static struct platform_device *harmony_devices[] __initdata =3D {
> =A0 =A0 =A0 =A0&debug_uart,
> + =A0 =A0 =A0 &tegra_sdhci_device1,
> + =A0 =A0 =A0 &tegra_sdhci_device2,
> + =A0 =A0 =A0 &tegra_sdhci_device4,
> =A0};
>
> =A0static void __init tegra_harmony_fixup(struct machine_desc *desc,
> @@ -77,6 +83,26 @@ static __initdata struct tegra_clk_init_table harm=
ony_clk_init_table[] =3D {
> =A0 =A0 =A0 =A0{ NULL, =A0 =A0 =A0 =A0 NULL, =A0 =A0 =A0 =A0 =A0 0, =A0=
 =A0 =A0 =A0 =A0 =A0 =A00},
> =A0};
>
> +
> +static struct tegra_sdhci_platform_data sdhci_pdata1 =3D {
> + =A0 =A0 =A0 .cd_gpio =A0 =A0 =A0 =A0=3D -1,
> + =A0 =A0 =A0 .wp_gpio =A0 =A0 =A0 =A0=3D -1,
> + =A0 =A0 =A0 .power_gpio =A0 =A0 =3D -1,
> +};
> +
> +static struct tegra_sdhci_platform_data sdhci_pdata2 =3D {
> + =A0 =A0 =A0 .cd_gpio =A0 =A0 =A0 =A0=3D TEGRA_GPIO_PI5,
> + =A0 =A0 =A0 .wp_gpio =A0 =A0 =A0 =A0=3D TEGRA_GPIO_PH1,
> + =A0 =A0 =A0 .power_gpio =A0 =A0 =3D TEGRA_GPIO_PT3,
> +};
> +
> +static struct tegra_sdhci_platform_data sdhci_pdata4 =3D {
> + =A0 =A0 =A0 .cd_gpio =A0 =A0 =A0 =A0=3D TEGRA_GPIO_PH2,
> + =A0 =A0 =A0 .wp_gpio =A0 =A0 =A0 =A0=3D TEGRA_GPIO_PH3,
> + =A0 =A0 =A0 .power_gpio =A0 =A0 =3D TEGRA_GPIO_PI6,
> + =A0 =A0 =A0 .is_8bit =A0 =A0 =A0 =A0=3D 1,
> +};
> +
> =A0static void __init tegra_harmony_init(void)
> =A0{
> =A0 =A0 =A0 =A0tegra_common_init();
> @@ -85,6 +111,10 @@ static void __init tegra_harmony_init(void)
>
> =A0 =A0 =A0 =A0harmony_pinmux_init();
>
> + =A0 =A0 =A0 tegra_sdhci_device1.dev.platform_data =3D &sdhci_pdata1=
;
> + =A0 =A0 =A0 tegra_sdhci_device2.dev.platform_data =3D &sdhci_pdata2=
;
> + =A0 =A0 =A0 tegra_sdhci_device4.dev.platform_data =3D &sdhci_pdata4=
;
> +
> =A0 =A0 =A0 =A0platform_add_devices(harmony_devices, ARRAY_SIZE(harmo=
ny_devices));
> =A0}
>
> --
> 1.7.0.4
>
>

Acked-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
