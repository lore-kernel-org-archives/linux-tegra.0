From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: ehci-tegra: add probing through device tree
Date: Fri, 4 Nov 2011 15:23:33 -0400
Message-ID: <CACxGe6tjVvNFfGGgJX5qn9NL_8MX73hhoEbAWgUupfdXikSDRA@mail.gmail.com>
References: <1320433960-18173-1-git-send-email-olof@lixom.net> <1320433960-18173-2-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1320433960-18173-2-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 4, 2011 at 3:12 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Rely on platform_data being passed through auxdata for now; more elab=
orate
> bindings for phy config and tunings to be added.
>
> v2: moved vbus-gpio check to the helper function, added check for !of=
_node,
> =A0 =A0added usb2 clock to board-dt table.
>
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> ---
> =A0arch/arm/mach-tegra/board-dt.c | =A0 =A09 +++++
> =A0drivers/usb/host/ehci-tegra.c =A0| =A0 71 ++++++++++++++++++++++++=
++++++++++++++++
> =A02 files changed, 80 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/boa=
rd-dt.c
> index 74743ad..7f287a8 100644
> --- a/arch/arm/mach-tegra/board-dt.c
> +++ b/arch/arm/mach-tegra/board-dt.c
> @@ -61,12 +61,21 @@ struct of_dev_auxdata tegra20_auxdata_lookup[] __=
initdata =3D {
> =A0 =A0 =A0 =A0OF_DEV_AUXDATA("nvidia,tegra20-i2s", TEGRA_I2S1_BASE, =
"tegra-i2s.0", NULL),
> =A0 =A0 =A0 =A0OF_DEV_AUXDATA("nvidia,tegra20-i2s", TEGRA_I2S1_BASE, =
"tegra-i2s.1", NULL),
> =A0 =A0 =A0 =A0OF_DEV_AUXDATA("nvidia,tegra20-das", TEGRA_APB_MISC_DA=
S_BASE, "tegra-das", NULL),
> + =A0 =A0 =A0 OF_DEV_AUXDATA("nvidia,tegra20-ehci", TEGRA_USB_BASE, "=
tegra-ehci.0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&tegra_ehci1_device.dev.=
platform_data),
> + =A0 =A0 =A0 OF_DEV_AUXDATA("nvidia,tegra20-ehci", TEGRA_USB2_BASE, =
"tegra-ehci.1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&tegra_ehci2_device.dev.=
platform_data),
> + =A0 =A0 =A0 OF_DEV_AUXDATA("nvidia,tegra20-ehci", TEGRA_USB3_BASE, =
"tegra-ehci.2",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&tegra_ehci3_device.dev.=
platform_data),
> =A0 =A0 =A0 =A0{}
> =A0};
>
> =A0static __initdata struct tegra_clk_init_table tegra_dt_clk_init_ta=
ble[] =3D {
> =A0 =A0 =A0 =A0/* name =A0 =A0 =A0 =A0 parent =A0 =A0 =A0 =A0 =A0rate=
 =A0 =A0 =A0 =A0 =A0 =A0enabled */
> =A0 =A0 =A0 =A0{ "uartd", =A0 =A0 =A0"pll_p", =A0 =A0 =A0 =A021600000=
0, =A0 =A0 =A0true },
> + =A0 =A0 =A0 { "usbd", =A0 =A0 =A0 "clk_m", =A0 =A0 =A0 =A012000000,=
 =A0 =A0 =A0 false },
> + =A0 =A0 =A0 { "usb2", =A0 =A0 =A0 "clk_m", =A0 =A0 =A0 =A012000000,=
 =A0 =A0 =A0 false },
> + =A0 =A0 =A0 { "usb3", =A0 =A0 =A0 "clk_m", =A0 =A0 =A0 =A012000000,=
 =A0 =A0 =A0 false },
> =A0 =A0 =A0 =A0{ NULL, =A0 =A0 =A0 =A0 NULL, =A0 =A0 =A0 =A0 =A0 0, =A0=
 =A0 =A0 =A0 =A0 =A0 =A00},
> =A0};
>
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-te=
gra.c
> index db9d1b4..dbc7fe8 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -21,7 +21,12 @@
> =A0#include <linux/platform_data/tegra_usb.h>
> =A0#include <linux/irq.h>
> =A0#include <linux/usb/otg.h>
> +#include <linux/gpio.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
> +
> =A0#include <mach/usb_phy.h>
> +#include <mach/iomap.h>
>
> =A0#define TEGRA_USB_DMA_ALIGN 32
>
> @@ -574,6 +579,35 @@ static const struct hc_driver tegra_ehci_hc_driv=
er =3D {
> =A0 =A0 =A0 =A0.port_handed_over =A0 =A0 =A0 =3D ehci_port_handed_ove=
r,
> =A0};
>
> +static int setup_vbus_gpio(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 int err =3D 0;
> + =A0 =A0 =A0 int gpio;
> +
> + =A0 =A0 =A0 if (!pdev->dev.of_node)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 gpio =3D of_get_named_gpio(pdev->dev.of_node, "nvidia,v=
bus-gpio", 0);
> + =A0 =A0 =A0 if (!gpio_is_valid(gpio))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 err =3D gpio_request(gpio, "vbus_gpio");
> + =A0 =A0 =A0 if (err) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "can't request vbus=
 gpio %d", gpio);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return err;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 err =3D gpio_direction_output(gpio, 1);
> + =A0 =A0 =A0 if (err) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "can't enable vbus\=
n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return err;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 gpio_set_value(gpio, 1);
> +
> + =A0 =A0 =A0 return err;
> +}
> +
> +static u64 tegra_ehci_dma_mask =3D DMA_BIT_MASK(32);
> +
> =A0static int tegra_ehci_probe(struct platform_device *pdev)
> =A0{
> =A0 =A0 =A0 =A0struct resource *res;
> @@ -590,6 +624,15 @@ static int tegra_ehci_probe(struct platform_devi=
ce *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 /* Right now device-tree probed devices don't get dma_m=
ask set.
> + =A0 =A0 =A0 =A0* Since shared usb code relies on it, set it here fo=
r now.
> + =A0 =A0 =A0 =A0* Once we have dma capability bindings this can go a=
way.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (!pdev->dev.dma_mask)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdev->dev.dma_mask =3D &tegra_ehci_dma_=
mask;
> +
> + =A0 =A0 =A0 setup_vbus_gpio(pdev);
> +
> =A0 =A0 =A0 =A0tegra =3D kzalloc(sizeof(struct tegra_ehci_hcd), GFP_K=
ERNEL);
> =A0 =A0 =A0 =A0if (!tegra)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> @@ -640,6 +683,28 @@ static int tegra_ehci_probe(struct platform_devi=
ce *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto fail_io;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 /* This is pretty ugly and needs to be fixed when we do=
 only
> + =A0 =A0 =A0 =A0* device-tree probing. Old code relies on the platfo=
rm_device
> + =A0 =A0 =A0 =A0* numbering that we lack for device-tree-instantiate=
d devices.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (instance < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (res->start) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case TEGRA_USB_BASE:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 instance =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case TEGRA_USB2_BASE:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 instance =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case TEGRA_USB3_BASE:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 instance =3D 2;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D -ENODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "un=
known usb instance\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_phy;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0tegra->phy =3D tegra_usb_phy_open(instance, hcd->regs,=
 pdata->phy_config,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_USB_PHY_MODE_HOST);
> =A0 =A0 =A0 =A0if (IS_ERR(tegra->phy)) {
> @@ -773,6 +838,11 @@ static void tegra_ehci_hcd_shutdown(struct platf=
orm_device *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hcd->driver->shutdown(hcd);
> =A0}
>
> +static struct of_device_id tegra_ehci_of_match[] __devinitdata =3D {
> + =A0 =A0 =A0 { .compatible =3D "nvidia,tegra20-ehci", },
> + =A0 =A0 =A0 { },
> +};
> +
> =A0static struct platform_driver tegra_ehci_driver =3D {
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D tegra_ehci_probe,
> =A0 =A0 =A0 =A0.remove =A0 =A0 =A0 =A0 =3D tegra_ehci_remove,
> @@ -783,5 +853,6 @@ static struct platform_driver tegra_ehci_driver =3D=
 {
> =A0 =A0 =A0 =A0.shutdown =A0 =A0 =A0 =3D tegra_ehci_hcd_shutdown,
> =A0 =A0 =A0 =A0.driver =A0 =A0 =A0 =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "tegra-ehci",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D tegra_ehci_of_match=
,
> =A0 =A0 =A0 =A0}
> =A0};
> --
> 1.7.4.1
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
