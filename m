From: Mike Rapoport <mike.rapoport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: remove copy-and-pasted usb platform data
 from boards
Date: Tue, 12 Jul 2011 22:28:04 +0300
Message-ID: <CABpLfoi5z3wiWGf2bKBdx7xncYxij2wvFVuw2sPNac6Fi7qpbw@mail.gmail.com>
References: <1310336374-31727-1-git-send-email-ccross@android.com>
	<1310336374-31727-2-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1310336374-31727-2-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Konstantin Sinyuk <kostyas-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Colin,
Sorry for the delay, I don't have the hardware at the moment, so I
asked Konstantin to do the testing.

On Mon, Jul 11, 2011 at 1:19 AM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:
> trimslice and paz00 both have functionally identical platform
> data for the tegra-ehci driver. =A0Move the platform data into
> devices.c, and remove it from all the board files.
>
> Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>

=46or the TrimSlice part:

Tested-by: Konstantin Sinyuk <kostyas-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>

> ---
> =A0arch/arm/mach-tegra/board-paz00.c =A0 =A0 | =A0 26 ---------------=
-----------
> =A0arch/arm/mach-tegra/board-trimslice.c | =A0 19 -------------------
> =A0arch/arm/mach-tegra/devices.c =A0 =A0 =A0 =A0 | =A0 28 +++++++++++=
+++++++++++++++++
> =A03 files changed, 28 insertions(+), 45 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/=
board-paz00.c
> index 465768e..ea2f79c 100644
> --- a/arch/arm/mach-tegra/board-paz00.c
> +++ b/arch/arm/mach-tegra/board-paz00.c
> @@ -26,7 +26,6 @@
> =A0#include <linux/pda_power.h>
> =A0#include <linux/io.h>
> =A0#include <linux/i2c.h>
> -#include <linux/platform_data/tegra_usb.h>
>
> =A0#include <asm/mach-types.h>
> =A0#include <asm/mach/arch.h>
> @@ -36,7 +35,6 @@
> =A0#include <mach/iomap.h>
> =A0#include <mach/irqs.h>
> =A0#include <mach/sdhci.h>
> -#include <mach/usb_phy.h>
> =A0#include <mach/gpio.h>
>
> =A0#include "board.h"
> @@ -80,32 +78,8 @@ static void paz00_i2c_init(void)
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device4);
> =A0}
>
> -static struct tegra_ulpi_config ulpi_phy_config =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reset_gpio =3D TEGRA_ULPI_RST,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .clk =3D "cdev2",
> -};
> -
> -static struct tegra_ehci_platform_data tegra_ehci_pdata[] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [0] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .operating_mode =3D TEG=
RA_USB_OTG,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .power_down_on_bus_susp=
end =3D 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [1] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .phy_config =3D &ulpi_p=
hy_config,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .operating_mode =3D TEG=
RA_USB_HOST,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .power_down_on_bus_susp=
end =3D 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 [2] =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .operating_mode =3D TEG=
RA_USB_HOST,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .power_down_on_bus_susp=
end =3D 1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> -};
> -
> =A0static void paz00_usb_init(void)
> =A0{
> - =A0 =A0 =A0 tegra_ehci2_device.dev.platform_data =3D &tegra_ehci_pd=
ata[1];
> - =A0 =A0 =A0 tegra_ehci3_device.dev.platform_data =3D &tegra_ehci_pd=
ata[2];
> -
> =A0 =A0 =A0 =A0platform_device_register(&tegra_ehci2_device);
> =A0 =A0 =A0 =A0platform_device_register(&tegra_ehci3_device);
> =A0}
> diff --git a/arch/arm/mach-tegra/board-trimslice.c b/arch/arm/mach-te=
gra/board-trimslice.c
> index e1d7e67..89a6d2a 100644
> --- a/arch/arm/mach-tegra/board-trimslice.c
> +++ b/arch/arm/mach-tegra/board-trimslice.c
> @@ -24,7 +24,6 @@
> =A0#include <linux/serial_8250.h>
> =A0#include <linux/io.h>
> =A0#include <linux/i2c.h>
> -#include <linux/platform_data/tegra_usb.h>
> =A0#include <linux/gpio.h>
>
> =A0#include <asm/mach-types.h>
> @@ -33,7 +32,6 @@
>
> =A0#include <mach/iomap.h>
> =A0#include <mach/sdhci.h>
> -#include <mach/usb_phy.h>
> =A0#include <mach/gpio.h>
>
> =A0#include "board.h"
> @@ -110,28 +108,12 @@ static void trimslice_i2c_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARRAY_=
SIZE(trimslice_i2c3_board_info));
> =A0}
>
> -struct tegra_ulpi_config ehci2_phy_config =3D {
> - =A0 =A0 =A0 .reset_gpio =3D TRIMSLICE_GPIO_USB2_RST,
> - =A0 =A0 =A0 .clk =3D "cdev2",
> -};
> -
> -static struct tegra_ehci_platform_data ehci_ulpi_data =3D {
> - =A0 =A0 =A0 .operating_mode =3D TEGRA_USB_HOST,
> - =A0 =A0 =A0 .phy_config =3D &ehci2_phy_config,
> -};
> -
> -static struct tegra_ehci_platform_data ehci_utmi_data =3D {
> - =A0 =A0 =A0 .operating_mode =3D TEGRA_USB_HOST,
> -};
> -
> =A0static void trimslice_usb_init(void)
> =A0{
> =A0 =A0 =A0 =A0int err;
>
> - =A0 =A0 =A0 tegra_ehci3_device.dev.platform_data =3D &ehci_utmi_dat=
a;
> =A0 =A0 =A0 =A0platform_device_register(&tegra_ehci3_device);
>
> - =A0 =A0 =A0 tegra_ehci2_device.dev.platform_data =3D &ehci_ulpi_dat=
a;
> =A0 =A0 =A0 =A0platform_device_register(&tegra_ehci2_device);
>
> =A0 =A0 =A0 =A0err =3D gpio_request_one(TRIMSLICE_GPIO_USB1_MODE, GPI=
OF_OUT_INIT_HIGH,
> @@ -141,7 +123,6 @@ static void trimslice_usb_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 tegra_ehci1_device.dev.platform_data =3D &ehci_utmi_dat=
a;
> =A0 =A0 =A0 =A0platform_device_register(&tegra_ehci1_device);
> =A0}
>
> diff --git a/arch/arm/mach-tegra/devices.c b/arch/arm/mach-tegra/devi=
ces.c
> index 066eaf9..57e35d2 100644
> --- a/arch/arm/mach-tegra/devices.c
> +++ b/arch/arm/mach-tegra/devices.c
> @@ -23,10 +23,13 @@
> =A0#include <linux/fsl_devices.h>
> =A0#include <linux/serial_8250.h>
> =A0#include <linux/i2c-tegra.h>
> +#include <linux/platform_data/tegra_usb.h>
> =A0#include <asm/pmu.h>
> =A0#include <mach/irqs.h>
> =A0#include <mach/iomap.h>
> =A0#include <mach/dma.h>
> +#include <mach/usb_phy.h>
> +#include "gpio-names.h"
>
> =A0static struct resource i2c_resource1[] =3D {
> =A0 =A0 =A0 =A0[0] =3D {
> @@ -351,6 +354,28 @@ static struct resource tegra_usb3_resources[] =3D=
 {
> =A0 =A0 =A0 =A0},
> =A0};
>
> +static struct tegra_ulpi_config tegra_ehci2_ulpi_phy_config =3D {
> + =A0 =A0 =A0 /* All existing boards use GPIO PV0 for phy reset */
> + =A0 =A0 =A0 .reset_gpio =3D TEGRA_GPIO_PV0,
> + =A0 =A0 =A0 .clk =3D "cdev2",
> +};
> +
> +static struct tegra_ehci_platform_data tegra_ehci1_pdata =3D {
> + =A0 =A0 =A0 .operating_mode =3D TEGRA_USB_OTG,
> + =A0 =A0 =A0 .power_down_on_bus_suspend =3D 1,
> +};
> +
> +static struct tegra_ehci_platform_data tegra_ehci2_pdata =3D {
> + =A0 =A0 =A0 .phy_config =3D &tegra_ehci2_ulpi_phy_config,
> + =A0 =A0 =A0 .operating_mode =3D TEGRA_USB_HOST,
> + =A0 =A0 =A0 .power_down_on_bus_suspend =3D 1,
> +};
> +
> +static struct tegra_ehci_platform_data tegra_ehci3_pdata =3D {
> + =A0 =A0 =A0 .operating_mode =3D TEGRA_USB_HOST,
> + =A0 =A0 =A0 .power_down_on_bus_suspend =3D 1,
> +};
> +
> =A0static u64 tegra_ehci_dmamask =3D DMA_BIT_MASK(32);
>
> =A0struct platform_device tegra_ehci1_device =3D {
> @@ -359,6 +384,7 @@ struct platform_device tegra_ehci1_device =3D {
> =A0 =A0 =A0 =A0.dev =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma_mask =A0 =A0 =A0 =3D &tegra_ehci_=
dmamask,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.coherent_dma_mask =3D DMA_BIT_MASK(32=
),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =3D &tegra_ehci1_pdata,
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0.resource =3D tegra_usb1_resources,
> =A0 =A0 =A0 =A0.num_resources =3D ARRAY_SIZE(tegra_usb1_resources),
> @@ -370,6 +396,7 @@ struct platform_device tegra_ehci2_device =3D {
> =A0 =A0 =A0 =A0.dev =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma_mask =A0 =A0 =A0 =3D &tegra_ehci_=
dmamask,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.coherent_dma_mask =3D DMA_BIT_MASK(32=
),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =3D &tegra_ehci2_pdata,
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0.resource =3D tegra_usb2_resources,
> =A0 =A0 =A0 =A0.num_resources =3D ARRAY_SIZE(tegra_usb2_resources),
> @@ -381,6 +408,7 @@ struct platform_device tegra_ehci3_device =3D {
> =A0 =A0 =A0 =A0.dev =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma_mask =A0 =A0 =A0 =3D &tegra_ehci_=
dmamask,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.coherent_dma_mask =3D DMA_BIT_MASK(32=
),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =3D &tegra_ehci3_pdata,
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0.resource =3D tegra_usb3_resources,
> =A0 =A0 =A0 =A0.num_resources =3D ARRAY_SIZE(tegra_usb3_resources),
> --
> 1.7.4.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Sincerely Yours,
Mike.
