From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/3 v3] usb: tegra20-ehci: Add devicetree support.
Date: Wed, 20 Jul 2011 20:41:05 -0700
Message-ID: <CAOesGMizAxjcNUBPCeeVgYEbLZB4P+0znua7TjhbqUNn91hgGw@mail.gmail.com>
References: <1311218619-11174-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1311218619-11174-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mogantyv-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wed, Jul 20, 2011 at 8:23 PM,  <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-te=
gra.c
> index 02b2bfd..67c16e5 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -21,10 +21,32 @@
> =A0#include <linux/platform_data/tegra_usb.h>
> =A0#include <linux/irq.h>
> =A0#include <linux/usb/otg.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +
> =A0#include <mach/usb_phy.h>
>
> =A0#define TEGRA_USB_DMA_ALIGN 32
>
> +static u64 tegra_ehci_dmamask =3D DMA_BIT_MASK(TEGRA_USB_DMA_ALIGN);
> +
> +static struct tegra_utmip_config utmi_default =3D {

__initdata, no need to keep this around after setup.

You're also going to get a warning if you build without CONFIG_OF due
to a local static variable that is not referenced, I think.

> + =A0 =A0 =A0 .hssync_start_delay =3D 9,
> + =A0 =A0 =A0 .idle_wait_delay =3D 17,
> + =A0 =A0 =A0 .elastic_limit =3D 16,
> + =A0 =A0 =A0 .term_range_adj =3D 6,
> + =A0 =A0 =A0 .xcvr_setup =3D 9,
> + =A0 =A0 =A0 .xcvr_lsfslew =3D 2,
> + =A0 =A0 =A0 .xcvr_lsrslew =3D 2,
> +};
> +
> +static struct tegra_ulpi_config ulpi_default =3D {

Same here.

> + =A0 =A0 =A0 .reset_gpio =3D 169,
> + =A0 =A0 =A0 .clk =3D "cdev2",
> +};
> +
> =A0struct tegra_ehci_hcd {
> =A0 =A0 =A0 =A0struct ehci_hcd *ehci;
> =A0 =A0 =A0 =A0struct tegra_usb_phy *phy;
> @@ -574,9 +596,155 @@ static const struct hc_driver tegra_ehci_hc_dri=
ver =3D {
> =A0 =A0 =A0 =A0.port_handed_over =A0 =A0 =A0 =3D ehci_port_handed_ove=
r,
> =A0};
>
> +#if defined(CONFIG_OF)
> +static int tegra_ehci_parse_dt_node_utmi(struct device_node *dn,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0struct platform_device *pdev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0struct tegra_ehci_platform_data *pdata)
> +{
> + =A0 =A0 =A0 struct device *dev =3D &pdev->dev;
> + =A0 =A0 =A0 struct tegra_utmip_config *phy_config;
> + =A0 =A0 =A0 u32 val;
> +
> + =A0 =A0 =A0 phy_config =3D devm_kzalloc(dev, sizeof(struct tegra_ut=
mip_config),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GFP=
_KERNEL);
> + =A0 =A0 =A0 if (!phy_config)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> +
> + =A0 =A0 =A0 /* Copy default values. */
> + =A0 =A0 =A0 memcpy(phy_config, &utmi_default, sizeof(struct tegra_u=
tmip_config));

Nit: Doing *phy_config =3D utmi_default;   here would do type checking
for you. But it's not a big deal.



-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
