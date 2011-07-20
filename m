From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/3 v2] usb: tegra20-ehci: Add devicetree support.
Date: Wed, 20 Jul 2011 14:02:11 -0600
Message-ID: <CACxGe6uDVdemjbjY_i-_M_-VT8HuLdtXP-R9V8kB+pSSin4dEw@mail.gmail.com>
References: <1311190690-18334-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1311190690-18334-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mogantyv-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 20, 2011 at 1:38 PM,  <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Add code to try to get platform data information (register base, irq,
> modes, various tuning parameters) from device tree, if not present in=
 board
> files.
>
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0.../devicetree/bindings/usb/tegra20-ehci.txt =A0 =A0 =A0 | =A0 28 =
+++
> =A0drivers/usb/host/ehci-tegra.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0221 ++++++++++++++++++++
> =A02 files changed, 249 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/usb/tegra20-e=
hci.txt
>
> diff --git a/Documentation/devicetree/bindings/usb/tegra20-ehci.txt b=
/Documentation/devicetree/bindings/usb/tegra20-ehci.txt
> new file mode 100644
> index 0000000..5a73a96
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/tegra20-ehci.txt
> @@ -0,0 +1,28 @@
> +NVIDIA Tegra20 SOC USB controllers
> +
> +The device node for a USB controller that is part of a Tegra20
> +SOC is as described in the document "Open Firmware Recommended
> +Practice: Universal Serial Bus" with the following modifications
> +and additions:
> +
> +Required properties:
> + - compatible: Should be "nvidia,tegra20-ehci".
> + - mode: Should be one of "device", "host", or "otg".
> + - power_down_on_bus_suspend: For host mode only, should be <1> if y=
ou
> + =A0 want the USB phy to power down when the host is suspended. =A0E=
lse, it
> + =A0 should be <0>.

We use '-' in property names, not '_'

Boolean values like this should be based on whether or not the
property is present.  ie. default to not powering down the phy unless
an empty "power-down-on-suspend" property is present.

> + - type: Should be one of "utmi" or "ulpi".

phy-type perhaps?

> +
> +Required properties for type =3D "utmi". =A0These values are derived=
 from
> +characterization by system engineering.
> + - hssync_start_delay
> + - idle_wait_delay
> + - elastic_limit
> + - term_range_adj
> + - xcvr_setup
> + - xcvr_lsfslew
> + - xcvr_lsrslew

All of these custom properties should be prefixed with "nvidia," to
avoid namespace collisions.

> +
> +Required properties for type =3D "ulpi":
> + - reset_gpio: The GPIO used to drive reset
> + - clk
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-te=
gra.c
> index 02b2bfd..89144d5 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -21,10 +21,20 @@
> =A0#include <linux/platform_data/tegra_usb.h>
> =A0#include <linux/irq.h>
> =A0#include <linux/usb/otg.h>
> +
> +#if defined(CONFIG_OF)
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#endif
> +

linux/of* headers are always safe to include.  Don't separate them
from the rest of the #includes.

> =A0#include <mach/usb_phy.h>
>
> =A0#define TEGRA_USB_DMA_ALIGN 32
>
> +static u64 tegra_ehci_dmamask =3D DMA_BIT_MASK(TEGRA_USB_DMA_ALIGN);
> +
> =A0struct tegra_ehci_hcd {
> =A0 =A0 =A0 =A0struct ehci_hcd *ehci;
> =A0 =A0 =A0 =A0struct tegra_usb_phy *phy;
> @@ -574,9 +584,181 @@ static const struct hc_driver tegra_ehci_hc_dri=
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
> + =A0 =A0 =A0 int retval;
> +
> + =A0 =A0 =A0 phy_config =3D devm_kzalloc(dev, sizeof(struct tegra_ut=
mip_config),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GFP=
_KERNEL);
> + =A0 =A0 =A0 if (!phy_config)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> +
> + =A0 =A0 =A0 retval =3D of_property_read_u32(dn, "hssync_start_delay=
",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (u32 *)&phy_config->hssync_start_delay);

Gah!  Don't cast pointers that way.  It will break badly if the sizes
don't match.  The variable *must* be a u32.

> + =A0 =A0 =A0 if (retval) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Missing dt property \"hss=
ync_start_delay\"\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return retval;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 retval =3D of_property_read_u32(dn, "elastic_limit",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (u32 *)&phy_config->elastic_limit);
> + =A0 =A0 =A0 if (retval) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Missing dt property \"ela=
stic_limit\"\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return retval;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 retval =3D of_property_read_u32(dn, "idle_wait_delay",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (u32 *)&phy_config->idle_wait_delay);
> + =A0 =A0 =A0 if (retval) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Missing dt property \"idl=
e_wait_delay\"\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return retval;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 retval =3D of_property_read_u32(dn, "term_range_adj",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (u32 *)&phy_config->term_range_adj);
> + =A0 =A0 =A0 if (retval) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Missing dt property \"ter=
m_range_adj\"\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return retval;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 retval =3D of_property_read_u32(dn, "xcvr_setup",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (u32 *)&phy_config->xcvr_setup);
> + =A0 =A0 =A0 if (retval) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Missing dt property \"xcv=
r_setup\"\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return retval;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 retval =3D of_property_read_u32(dn, "xcvr_lsfslew",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (u32 *)&phy_config->xcvr_lsfslew);
> + =A0 =A0 =A0 if (retval) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Missing dt property \"xcv=
r_lsfslew\"\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return retval;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 retval =3D of_property_read_u32(dn, "xcvr_lsrslew",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (u32 *)&phy_config->xcvr_lsrslew);
> + =A0 =A0 =A0 if (retval) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Missing dt property \"xcv=
r_lsrslew\"\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return retval;
> + =A0 =A0 =A0 }

Can the driver use sane defaults for any of these values?  This patch
will be a lot smaller if there isn't the need to check all the return
values each time.

> +
> + =A0 =A0 =A0 pdata->phy_config =3D phy_config;
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int tegra_ehci_parse_dt_node_ulpi(struct device_node *dn,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0struct platform_device *pdev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0struct tegra_ehci_platform_data *pdata)
> +{
> + =A0 =A0 =A0 struct device *dev =3D &pdev->dev;
> + =A0 =A0 =A0 struct tegra_ulpi_config *phy_config;
> + =A0 =A0 =A0 int retval;
> +
> + =A0 =A0 =A0 phy_config =3D devm_kzalloc(dev, sizeof(struct tegra_ul=
pi_config),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GFP=
_KERNEL);
> + =A0 =A0 =A0 if (!phy_config)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> +
> + =A0 =A0 =A0 retval =3D of_property_read_u32(dn, "reset_gpio",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 &phy_config->reset_gpio);
> + =A0 =A0 =A0 if (retval) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Missing dt property \"res=
et_gpio\"\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return retval;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 retval =3D of_property_read_string(dn, "clk",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0(char **)&phy_config->clk);
> + =A0 =A0 =A0 if (retval) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Missing dt property \"clk=
\"\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return retval;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 pdata->phy_config =3D phy_config;
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static struct tegra_ehci_platform_data *
> +tegra_ehci_parse_dt_node(struct device_node *dn,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct platform_devi=
ce *pdev)

Nit: to be friendly for grepping, function name should remain on same
line as return value and annotation.  Keep line breaks in the
parameter list.

> +{
> + =A0 =A0 =A0 struct device *dev =3D &pdev->dev;
> + =A0 =A0 =A0 struct tegra_ehci_platform_data *pdata;
> + =A0 =A0 =A0 char *mode;
> + =A0 =A0 =A0 char *type;
> + =A0 =A0 =A0 int retval;
> +
> + =A0 =A0 =A0 pdata =3D devm_kzalloc(dev, sizeof(struct tegra_ehci_pl=
atform_data),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0GFP_KERNEL);
> + =A0 =A0 =A0 if (!pdata)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> +
> + =A0 =A0 =A0 retval =3D of_property_read_string(dn, "mode", &mode);
> + =A0 =A0 =A0 if (retval) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Missing dt property \"mod=
e\"\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (strcmp(mode, "device") =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->operating_mode =3D TEGRA_USB_DEV=
ICE;
> + =A0 =A0 =A0 else if (strcmp(mode, "host") =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->operating_mode =3D TEGRA_USB_HOS=
T;
> + =A0 =A0 =A0 else if (strcmp(mode, "otg") =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->operating_mode =3D TEGRA_USB_OTG=
;
> + =A0 =A0 =A0 else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Invalid dt property \"mod=
e\" value %s\n", mode);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 retval =3D of_property_read_u32(dn, "power_down_on_bus_=
suspend",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 &pdata->power_down_on_bus_suspend);
> + =A0 =A0 =A0 if (retval) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Missing dt property "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"\"power_dow=
n_on_bus_suspend\"\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 retval =3D of_property_read_string(dn, "type", &type);
> + =A0 =A0 =A0 if (retval) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Missing dt property \"typ=
e\"\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (strcmp(type, "utmi") =3D=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D tegra_ehci_parse_dt_node_utm=
i(dn, pdev, pdata);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (retval)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> + =A0 =A0 =A0 } else if (strcmp(type, "ulpi") =3D=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D tegra_ehci_parse_dt_node_ulp=
i(dn, pdev, pdata);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (retval)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "Invalid dt property \"typ=
e\" value %s\n", type);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return pdata;
> +
> +fail:
> + =A0 =A0 =A0 devm_kfree(dev, pdata);
> +
> + =A0 =A0 =A0 return NULL;
> +}
> +#endif
> +
> =A0static int tegra_ehci_probe(struct platform_device *pdev)
> =A0{
> =A0 =A0 =A0 =A0struct resource *res;
> +#if defined(CONFIG_OF)
> + =A0 =A0 =A0 struct device_node *dn =3D pdev->dev.of_node;
> + =A0 =A0 =A0 struct resource of_res;
> +#endif
> =A0 =A0 =A0 =A0struct usb_hcd *hcd;
> =A0 =A0 =A0 =A0struct tegra_ehci_hcd *tegra;
> =A0 =A0 =A0 =A0struct tegra_ehci_platform_data *pdata;
> @@ -584,7 +766,20 @@ static int tegra_ehci_probe(struct platform_devi=
ce *pdev)
> =A0 =A0 =A0 =A0int irq;
> =A0 =A0 =A0 =A0int instance =3D pdev->id;
>
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* See if there's any platform data passed via board =
files.
> + =A0 =A0 =A0 =A0* If there isn't, then allocate one and fill it by p=
arsing
> + =A0 =A0 =A0 =A0* device tree node.
> + =A0 =A0 =A0 =A0*/
> =A0 =A0 =A0 =A0pdata =3D pdev->dev.platform_data;
> +#if defined(CONFIG_OF)
> + =A0 =A0 =A0 if (!pdata) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata =3D tegra_ehci_parse_dt_node(dn, =
pdev);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdev->dev.dma_mask =3D &tegra_ehci_dmam=
ask;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdev->dev.coherent_dma_mask =3D tegra_e=
hci_dmamask;
> + =A0 =A0 =A0 }
> +#endif

Drop the #if/#endif protection, and create an empty version of
tegra_ehci_parse_dt_node() when CONFIG_OF is not selected.  It will
make the code cleaner.

> =A0 =A0 =A0 =A0if (!pdata) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&pdev->dev, "Platform data mis=
sing\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> @@ -625,7 +820,15 @@ static int tegra_ehci_probe(struct platform_devi=
ce *pdev)
> =A0 =A0 =A0 =A0clk_enable(tegra->emc_clk);
> =A0 =A0 =A0 =A0clk_set_rate(tegra->emc_clk, 400000000);
>
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* If there isn't an IORESOURCE_MEM defined in the bo=
ard file,
> + =A0 =A0 =A0 =A0* then try to get that information from the device t=
ree node.
> + =A0 =A0 =A0 =A0*/
> =A0 =A0 =A0 =A0res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0)=
;
> +#if defined(CONFIG_OF)
> + =A0 =A0 =A0 if (!res && (of_address_to_resource(dn, 0, &of_res) =3D=
=3D 0))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 res =3D &of_res;
> +#endif

Unnecessary.  The register ranges are populated into the resource
table by default.

> =A0 =A0 =A0 =A0if (!res) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&pdev->dev, "Failed to get I/O=
 memory\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D -ENXIO;
> @@ -658,7 +861,15 @@ static int tegra_ehci_probe(struct platform_devi=
ce *pdev)
> =A0 =A0 =A0 =A0tegra->power_down_on_bus_suspend =3D pdata->power_down=
_on_bus_suspend;
> =A0 =A0 =A0 =A0tegra->ehci =3D hcd_to_ehci(hcd);
>
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* If there isn't an irq defined in the board file, t=
hen try to get
> + =A0 =A0 =A0 =A0* that information from the device tree node.
> + =A0 =A0 =A0 =A0*/
> =A0 =A0 =A0 =A0irq =3D platform_get_irq(pdev, 0);
> +#if defined(CONFIG_OF)
> + =A0 =A0 =A0 if (!irq)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq =3D irq_of_parse_and_map(dn, 0);
> +#endif

Same here; unnecessary.

> =A0 =A0 =A0 =A0if (!irq) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&pdev->dev, "Failed to get IRQ=
\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D -ENODEV;
> @@ -773,6 +984,14 @@ static void tegra_ehci_hcd_shutdown(struct platf=
orm_device *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hcd->driver->shutdown(hcd);
> =A0}
>
> +static const struct of_device_id tegra_ehci_of_match[] =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "nvidia,tegra20-ehci",
> + =A0 =A0 =A0 },

The following form is more concise and preferred for match tables:

        { .compatible =3D "nvidia,tegra20-ehci", },
        {},

> +};
> +MODULE_DEVICE_TABLE(of, tegra_ehci_of_match);
> +
> =A0static struct platform_driver tegra_ehci_driver =3D {
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D tegra_ehci_probe,
> =A0 =A0 =A0 =A0.remove =A0 =A0 =A0 =A0 =3D tegra_ehci_remove,
> @@ -783,5 +1002,7 @@ static struct platform_driver tegra_ehci_driver =
=3D {
> =A0 =A0 =A0 =A0.shutdown =A0 =A0 =A0 =3D tegra_ehci_hcd_shutdown,
> =A0 =A0 =A0 =A0.driver =A0 =A0 =A0 =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "tegra-ehci",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D tegra_ehci_of_match=
,
> =A0 =A0 =A0 =A0}
> =A0};
> --
> 1.7.6
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
