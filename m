From: JC Kuo <jckuo@nvidia.com>
Subject: Re: [Patch V2 03/18] phy: tegra: xusb: Add usb-role-switch support
Date: Thu, 26 Dec 2019 14:42:33 +0800
Message-ID: <3f02b1c8-0d2e-700c-d1f5-80f9655f62e0@nvidia.com>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
 <1576660591-10383-4-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1576660591-10383-4-git-send-email-nkristam@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>, balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/18/19 5:16 PM, Nagarjuna Kristam wrote:
> If usb-role-switch property is present in USB 2 port, register
> usb-role-switch to receive usb role changes.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V2:
>  - Removed dev_set_drvdata for port->dev.
>  - Added of_platform_depopulate during error handling and driver removal.
> ---
>  drivers/phy/tegra/Kconfig |  1 +
>  drivers/phy/tegra/xusb.c  | 42 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.h  |  3 +++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
> index f9817c3..df07c4d 100644
> --- a/drivers/phy/tegra/Kconfig
> +++ b/drivers/phy/tegra/Kconfig
> @@ -2,6 +2,7 @@
>  config PHY_TEGRA_XUSB
>  	tristate "NVIDIA Tegra XUSB pad controller driver"
>  	depends on ARCH_TEGRA
> +	select USB_CONN_GPIO
>  	help
>  	  Choose this option if you have an NVIDIA Tegra SoC.
>  
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index f98ec39..dc00b42 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -523,6 +523,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_port *port,
>  	port->dev.type = &tegra_xusb_port_type;
>  	port->dev.of_node = of_node_get(np);
>  	port->dev.parent = padctl->dev;
> +	port->dev.driver = padctl->dev->driver;
>  
>  	err = dev_set_name(&port->dev, "%s-%u", name, index);
>  	if (err < 0)
> @@ -541,6 +542,10 @@ static int tegra_xusb_port_init(struct tegra_xusb_port *port,
>  
>  static void tegra_xusb_port_unregister(struct tegra_xusb_port *port)
>  {
> +	if (!IS_ERR_OR_NULL(port->usb_role_sw)) {
> +		of_platform_depopulate(&port->dev);
> +		usb_role_switch_unregister(port->usb_role_sw);
> +	}
>  	device_unregister(&port->dev);
>  }
>  
> @@ -551,11 +556,42 @@ static const char *const modes[] = {
>  	[USB_DR_MODE_OTG] = "otg",
>  };
>  
> +static int tegra_xusb_role_sw_set(struct device *dev, enum usb_role role)
> +{
> +	dev_dbg(dev, "%s calling notifier for role is %d\n", __func__, role);
> +
> +	return 0;
> +}
> +
> +static int tegra_xusb_setup_usb_role_switch(struct tegra_xusb_port *port)
> +{
> +	int err = 0;
> +	struct usb_role_switch_desc role_sx_desc = {
> +					.set = tegra_xusb_role_sw_set,
> +					.fwnode = dev_fwnode(&port->dev),
> +						   };
> +
> +	port->usb_role_sw = usb_role_switch_register(&port->dev,
> +						&role_sx_desc);
> +	if (IS_ERR(port->usb_role_sw)) {
> +		err = PTR_ERR(port->usb_role_sw);
> +		if (err != EPROBE_DEFER)
> +			dev_err(&port->dev, "Failed to register USB role SW: %d",
> +				err);
> +	}
> +
> +	/* populate connector entry */
> +	of_platform_populate(port->dev.of_node, NULL, NULL, &port->dev);
> +
> +	return err;
> +}
> +
>  static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
>  {
>  	struct tegra_xusb_port *port = &usb2->base;
>  	struct device_node *np = port->dev.of_node;
>  	const char *mode;
> +	int err;
>  
>  	usb2->internal = of_property_read_bool(np, "nvidia,internal");
>  
> @@ -572,6 +608,12 @@ static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
>  		usb2->mode = USB_DR_MODE_HOST;
>  	}
>  
"usb-role-switch" is not required for host mode port. If a otg or a peripheral
port doesn't have "usb-role-switch" property, .probe() should abort.

Thanks,
JC

> +	if (of_property_read_bool(np, "usb-role-switch")) {
> +		err = tegra_xusb_setup_usb_role_switch(port);
> +		if (err < 0)
> +			return err;
> +	}
> +
>  	usb2->supply = devm_regulator_get(&port->dev, "vbus");
>  	return PTR_ERR_OR_ZERO(usb2->supply);
>  }
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index da94fcc..9f27899 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -12,6 +12,7 @@
>  #include <linux/workqueue.h>
>  
>  #include <linux/usb/otg.h>
> +#include <linux/usb/role.h>
>  
>  /* legacy entry points for backwards-compatibility */
>  int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev);
> @@ -266,6 +267,8 @@ struct tegra_xusb_port {
>  	struct list_head list;
>  	struct device dev;
>  
> +	struct usb_role_switch *usb_role_sw;
> +
>  	const struct tegra_xusb_port_ops *ops;
>  };
>  
> 
