From: Mike Rapoport <mike.rapoport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: remove copy-and-pasted i2c platform data
 in boards
Date: Tue, 12 Jul 2011 22:28:12 +0300
Message-ID: <CABpLfohW0iavFgKcBXnSWzkKYHvqL+=4vXK2Zf5oJGHkDTHdSw@mail.gmail.com>
References: <1310336374-31727-1-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1310336374-31727-1-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Konstantin Sinyuk <kostyas-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Colin,
Sorry for the delay, I don't have the hardware at the moment, so I
asked Konstantin to do the testing.

On Mon, Jul 11, 2011 at 1:19 AM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:
> Every board file includes the same platform data definition
> for the i2c-tegra driver's bus speed. =A0Move the platform data
> into devices.c, and remove it from all the board files.
>
> Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>

=46or the TrimSlice part:

Tested-by: Konstantin Sinyuk <kostyas-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>

> ---
> =A0arch/arm/mach-tegra/board-harmony.c =A0 | =A0 22 -----------------=
-----
> =A0arch/arm/mach-tegra/board-paz00.c =A0 =A0 | =A0 17 ---------------=
--
> =A0arch/arm/mach-tegra/board-seaboard.c =A0| =A0 22 -----------------=
-----
> =A0arch/arm/mach-tegra/board-trimslice.c | =A0 17 -----------------
> =A0arch/arm/mach-tegra/devices.c =A0 =A0 =A0 =A0 | =A0 25 +++++++++++=
++++++++++----
> =A05 files changed, 21 insertions(+), 82 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegr=
a/board-harmony.c
> index 30e18bc..846cd7d 100644
> --- a/arch/arm/mach-tegra/board-harmony.c
> +++ b/arch/arm/mach-tegra/board-harmony.c
> @@ -25,7 +25,6 @@
> =A0#include <linux/io.h>
> =A0#include <linux/gpio.h>
> =A0#include <linux/i2c.h>
> -#include <linux/i2c-tegra.h>
>
> =A0#include <sound/wm8903.h>
>
> @@ -83,22 +82,6 @@ static struct platform_device harmony_audio_device=
 =3D {
> =A0 =A0 =A0 =A0},
> =A0};
>
> -static struct tegra_i2c_platform_data harmony_i2c1_platform_data =3D=
 {
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> -};
> -
> -static struct tegra_i2c_platform_data harmony_i2c2_platform_data =3D=
 {
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> -};
> -
> -static struct tegra_i2c_platform_data harmony_i2c3_platform_data =3D=
 {
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> -};
> -
> -static struct tegra_i2c_platform_data harmony_dvc_platform_data =3D =
{
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> -};
> -
> =A0static struct wm8903_platform_data harmony_wm8903_pdata =3D {
> =A0 =A0 =A0 =A0.irq_active_low =3D 0,
> =A0 =A0 =A0 =A0.micdet_cfg =3D 0,
> @@ -121,11 +104,6 @@ static struct i2c_board_info __initdata wm8903_b=
oard_info =3D {
>
> =A0static void __init harmony_i2c_init(void)
> =A0{
> - =A0 =A0 =A0 tegra_i2c_device1.dev.platform_data =3D &harmony_i2c1_p=
latform_data;
> - =A0 =A0 =A0 tegra_i2c_device2.dev.platform_data =3D &harmony_i2c2_p=
latform_data;
> - =A0 =A0 =A0 tegra_i2c_device3.dev.platform_data =3D &harmony_i2c3_p=
latform_data;
> - =A0 =A0 =A0 tegra_i2c_device4.dev.platform_data =3D &harmony_dvc_pl=
atform_data;
> -
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device1);
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device2);
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device3);
> diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/=
board-paz00.c
> index 1b076f6..465768e 100644
> --- a/arch/arm/mach-tegra/board-paz00.c
> +++ b/arch/arm/mach-tegra/board-paz00.c
> @@ -26,7 +26,6 @@
> =A0#include <linux/pda_power.h>
> =A0#include <linux/io.h>
> =A0#include <linux/i2c.h>
> -#include <linux/i2c-tegra.h>
> =A0#include <linux/platform_data/tegra_usb.h>
>
> =A0#include <asm/mach-types.h>
> @@ -74,24 +73,8 @@ static struct platform_device *paz00_devices[] __i=
nitdata =3D {
> =A0 =A0 =A0 =A0&tegra_sdhci_device4,
> =A0};
>
> -static struct tegra_i2c_platform_data paz00_i2c1_platform_data =3D {
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> -};
> -
> -static struct tegra_i2c_platform_data paz00_i2c2_platform_data =3D {
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> -};
> -
> -static struct tegra_i2c_platform_data paz00_dvc_platform_data =3D {
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> -};
> -
> =A0static void paz00_i2c_init(void)
> =A0{
> - =A0 =A0 =A0 tegra_i2c_device1.dev.platform_data =3D &paz00_i2c1_pla=
tform_data;
> - =A0 =A0 =A0 tegra_i2c_device2.dev.platform_data =3D &paz00_i2c2_pla=
tform_data;
> - =A0 =A0 =A0 tegra_i2c_device4.dev.platform_data =3D &paz00_dvc_plat=
form_data;
> -
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device1);
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device2);
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device4);
> diff --git a/arch/arm/mach-tegra/board-seaboard.c b/arch/arm/mach-teg=
ra/board-seaboard.c
> index 783de17..46d5df9 100644
> --- a/arch/arm/mach-tegra/board-seaboard.c
> +++ b/arch/arm/mach-tegra/board-seaboard.c
> @@ -19,7 +19,6 @@
> =A0#include <linux/platform_device.h>
> =A0#include <linux/serial_8250.h>
> =A0#include <linux/i2c.h>
> -#include <linux/i2c-tegra.h>
> =A0#include <linux/delay.h>
> =A0#include <linux/input.h>
> =A0#include <linux/io.h>
> @@ -66,22 +65,6 @@ static __initdata struct tegra_clk_init_table seab=
oard_clk_init_table[] =3D {
> =A0 =A0 =A0 =A0{ NULL, =A0 =A0 =A0 =A0 NULL, =A0 =A0 =A0 =A0 =A0 0, =A0=
 =A0 =A0 =A0 =A0 =A0 =A00},
> =A0};
>
> -static struct tegra_i2c_platform_data seaboard_i2c1_platform_data =3D=
 {
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000.
> -};
> -
> -static struct tegra_i2c_platform_data seaboard_i2c2_platform_data =3D=
 {
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> -};
> -
> -static struct tegra_i2c_platform_data seaboard_i2c3_platform_data =3D=
 {
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> -};
> -
> -static struct tegra_i2c_platform_data seaboard_dvc_platform_data =3D=
 {
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> -};
> -
> =A0static struct gpio_keys_button seaboard_gpio_keys_buttons[] =3D {
> =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.code =A0 =A0 =A0 =A0 =A0 =3D SW_LID,
> @@ -161,11 +144,6 @@ static void __init seaboard_i2c_init(void)
>
> =A0 =A0 =A0 =A0i2c_register_board_info(4, &adt7461_device, 1);
>
> - =A0 =A0 =A0 tegra_i2c_device1.dev.platform_data =3D &seaboard_i2c1_=
platform_data;
> - =A0 =A0 =A0 tegra_i2c_device2.dev.platform_data =3D &seaboard_i2c2_=
platform_data;
> - =A0 =A0 =A0 tegra_i2c_device3.dev.platform_data =3D &seaboard_i2c3_=
platform_data;
> - =A0 =A0 =A0 tegra_i2c_device4.dev.platform_data =3D &seaboard_dvc_p=
latform_data;
> -
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device1);
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device2);
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device3);
> diff --git a/arch/arm/mach-tegra/board-trimslice.c b/arch/arm/mach-te=
gra/board-trimslice.c
> index a8fff42..e1d7e67 100644
> --- a/arch/arm/mach-tegra/board-trimslice.c
> +++ b/arch/arm/mach-tegra/board-trimslice.c
> @@ -24,7 +24,6 @@
> =A0#include <linux/serial_8250.h>
> =A0#include <linux/io.h>
> =A0#include <linux/i2c.h>
> -#include <linux/i2c-tegra.h>
> =A0#include <linux/platform_data/tegra_usb.h>
> =A0#include <linux/gpio.h>
>
> @@ -92,18 +91,6 @@ static struct platform_device *trimslice_devices[]=
 __initdata =3D {
> =A0 =A0 =A0 =A0&trimslice_audio_device,
> =A0};
>
> -static struct tegra_i2c_platform_data trimslice_i2c1_platform_data =3D=
 {
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> -};
> -
> -static struct tegra_i2c_platform_data trimslice_i2c2_platform_data =3D=
 {
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> -};
> -
> -static struct tegra_i2c_platform_data trimslice_i2c3_platform_data =3D=
 {
> - =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> -};
> -
> =A0static struct i2c_board_info trimslice_i2c3_board_info[] =3D {
> =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0I2C_BOARD_INFO("tlv320aic23", 0x1a),
> @@ -115,10 +102,6 @@ static struct i2c_board_info trimslice_i2c3_boar=
d_info[] =3D {
>
> =A0static void trimslice_i2c_init(void)
> =A0{
> - =A0 =A0 =A0 tegra_i2c_device1.dev.platform_data =3D &trimslice_i2c1=
_platform_data;
> - =A0 =A0 =A0 tegra_i2c_device2.dev.platform_data =3D &trimslice_i2c2=
_platform_data;
> - =A0 =A0 =A0 tegra_i2c_device3.dev.platform_data =3D &trimslice_i2c3=
_platform_data;
> -
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device1);
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device2);
> =A0 =A0 =A0 =A0platform_device_register(&tegra_i2c_device3);
> diff --git a/arch/arm/mach-tegra/devices.c b/arch/arm/mach-tegra/devi=
ces.c
> index 1528f9d..066eaf9 100644
> --- a/arch/arm/mach-tegra/devices.c
> +++ b/arch/arm/mach-tegra/devices.c
> @@ -22,6 +22,7 @@
> =A0#include <linux/dma-mapping.h>
> =A0#include <linux/fsl_devices.h>
> =A0#include <linux/serial_8250.h>
> +#include <linux/i2c-tegra.h>
> =A0#include <asm/pmu.h>
> =A0#include <mach/irqs.h>
> =A0#include <mach/iomap.h>
> @@ -79,13 +80,29 @@ static struct resource i2c_resource4[] =3D {
> =A0 =A0 =A0 =A0},
> =A0};
>
> +static struct tegra_i2c_platform_data tegra_i2c1_platform_data =3D {
> + =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> +};
> +
> +static struct tegra_i2c_platform_data tegra_i2c2_platform_data =3D {
> + =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> +};
> +
> +static struct tegra_i2c_platform_data tegra_i2c3_platform_data =3D {
> + =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> +};
> +
> +static struct tegra_i2c_platform_data tegra_dvc_platform_data =3D {
> + =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> +};
> +
> =A0struct platform_device tegra_i2c_device1 =3D {
> =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "tegra-i2c",
> =A0 =A0 =A0 =A0.id =A0 =A0 =A0 =A0 =A0 =A0 =3D 0,
> =A0 =A0 =A0 =A0.resource =A0 =A0 =A0 =3D i2c_resource1,
> =A0 =A0 =A0 =A0.num_resources =A0=3D ARRAY_SIZE(i2c_resource1),
> =A0 =A0 =A0 =A0.dev =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =3D &tegra_i2c1_platform=
_data,
> =A0 =A0 =A0 =A0},
> =A0};
>
> @@ -95,7 +112,7 @@ struct platform_device tegra_i2c_device2 =3D {
> =A0 =A0 =A0 =A0.resource =A0 =A0 =A0 =3D i2c_resource2,
> =A0 =A0 =A0 =A0.num_resources =A0=3D ARRAY_SIZE(i2c_resource2),
> =A0 =A0 =A0 =A0.dev =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =3D &tegra_i2c2_platform=
_data,
> =A0 =A0 =A0 =A0},
> =A0};
>
> @@ -105,7 +122,7 @@ struct platform_device tegra_i2c_device3 =3D {
> =A0 =A0 =A0 =A0.resource =A0 =A0 =A0 =3D i2c_resource3,
> =A0 =A0 =A0 =A0.num_resources =A0=3D ARRAY_SIZE(i2c_resource3),
> =A0 =A0 =A0 =A0.dev =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =3D &tegra_i2c3_platform=
_data,
> =A0 =A0 =A0 =A0},
> =A0};
>
> @@ -115,7 +132,7 @@ struct platform_device tegra_i2c_device4 =3D {
> =A0 =A0 =A0 =A0.resource =A0 =A0 =A0 =3D i2c_resource4,
> =A0 =A0 =A0 =A0.num_resources =A0=3D ARRAY_SIZE(i2c_resource4),
> =A0 =A0 =A0 =A0.dev =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =3D &tegra_dvc_platform_=
data,
> =A0 =A0 =A0 =A0},
> =A0};
>
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
