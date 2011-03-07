From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/2] Add initial support for the Toshiba AC100/Dynabook AZ netbook
Date: Mon, 7 Mar 2011 00:37:26 -0800
Message-ID: <AANLkTinncQdKy-POUN2QQJYhc20Kg6z-grUBqehu7k8x@mail.gmail.com>
References: <1299421906-7366-1-git-send-email-marvin24@gmx.de>
	<1299421906-7366-2-git-send-email-marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1299421906-7366-2-git-send-email-marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Sun, Mar 6, 2011 at 6:31 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

As Colin said, a short patch description would be appreciated.

> diff --git a/arch/arm/mach-tegra/board-paz00-pinmux.c b/arch/arm/mach=
-tegra/board-paz00-pinmux.c
> new file mode 100644
> index 0000000..347a919
> --- /dev/null
> +++ b/arch/arm/mach-tegra/board-paz00-pinmux.c
[...]
> +static struct tegra_gpio_table gpio_table[] =3D {
> + =A0 =A0 =A0 { .gpio =3D TEGRA_GPIO_PV5, =A0 =A0 =A0 .enable =3D tru=
e =A0}, /* mmc2 cd =A0 */
> + =A0 =A0 =A0 { .gpio =3D TEGRA_GPIO_PH1, =A0 =A0 =A0 .enable =3D tru=
e =A0}, /* mmc2 wp =A0 */
> + =A0 =A0 =A0 { .gpio =3D TEGRA_GPIO_PT3, =A0 =A0 =A0 .enable =3D tru=
e =A0}, /* mmc2 pwr =A0*/
> + =A0 =A0 =A0 { .gpio =3D TEGRA_GPIO_PH2, =A0 =A0 =A0 .enable =3D tru=
e =A0}, /* mmc4 cd =A0 */
> + =A0 =A0 =A0 { .gpio =3D TEGRA_GPIO_PH3, =A0 =A0 =A0 .enable =3D tru=
e =A0}, /* mmc4 wp =A0 */
> + =A0 =A0 =A0 { .gpio =3D TEGRA_GPIO_PI6, =A0 =A0 =A0 .enable =3D tru=
e =A0}, /* mmc4 pwr =A0*/
> +};

Stephen Warren cleaned up Harmony and Seaboard and moved the GPIO
definitions to board-<board>.h and gave them symbolic names. Would you
mind doing that for these as well, please?

> diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/=
board-paz00.c
> new file mode 100644
> index 0000000..a33ce98
> --- /dev/null
> +++ b/arch/arm/mach-tegra/board-paz00.c
[...]
> +static struct tegra_sdhci_platform_data sdhci_pdata1 =3D {
> + =A0 =A0 =A0 .cd_gpio =A0 =A0 =A0 =A0=3D -1,
> + =A0 =A0 =A0 .wp_gpio =A0 =A0 =A0 =A0=3D -1,
> + =A0 =A0 =A0 .power_gpio =A0 =A0 =3D -1,
> +};
> +
> +static struct tegra_sdhci_platform_data sdhci_pdata2 =3D {
> + =A0 =A0 =A0 .cd_gpio =A0 =A0 =A0 =A0=3D TEGRA_GPIO_PV5,
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

Weird, the internal eMMC has CD and WP gpios?!


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
