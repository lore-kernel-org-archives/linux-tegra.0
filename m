From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 2/2] PCI: tegra: Support per-lane PHYs
Date: Wed, 16 Mar 2016 11:01:19 -0600
Message-ID: <56E9915F.9040608@wwwdotorg.org>
References: <1457452094-5409-1-git-send-email-thierry.reding@gmail.com>
 <1457452094-5409-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457452094-5409-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/08/2016 08:48 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The current XUSB pad controller bindings are insufficient to describe
> PHY devices attached to USB controllers. New bindings have been created
> to overcome these restrictions. As a side-effect each root port now is
> assigned a set of PHY devices, one for each lane associated with the
> root port. This has the benefit of allowing fine-grained control of the
> power management for each lane.

> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c

> +static int tegra_pcie_port_phy_power_on(struct tegra_pcie_port *port)
> +{
> +	struct device *dev = port->pcie->dev;
> +	unsigned int i;
> +	int err;
> +
> +	for (i = 0; i < port->lanes; i++) {
> +		err = phy_power_on(port->phys[i]);

This assume the number of array entries is precisely the number of 
lanes. That seems to contradict the binding update which said the number 
might not match. Perhaps there's an expectation that phy_power_on() is a 
no-op for some "invalid" values like NULL or an error-pointer value? But...

> +static struct phy *devm_of_phy_optional_get_index(struct device *dev,
> +						  struct device_node *np,
> +						  const char *consumer,
> +						  unsigned int index)
> +{
> +	struct phy *phy;
> +	char *name;
> +
> +	name = kasprintf(GFP_KERNEL, "%s-%u", consumer, index);
> +	if (!name)
> +		return ERR_PTR(-ENOMEM);
> +
> +	phy = devm_of_phy_get(dev, np, name);
> +	kfree(name);
> +
> +	if (IS_ERR(phy) && PTR_ERR(phy) == -ENODEV)
> +		phy = NULL;
> +
> +	return phy;
> +}

The error-handling there looks wrong. The function generally returns 
either a valid PHY or an error pointer. However, in the case of -ENODEV, 
NULL is returned. Subsystems are supposed to encode their handles as, 
and functions are supposed to return, either NULL or an error pointer 
for error cases, not both/either. Is the PHY API broken in this regard? 
If so, then this code is fine, but if not it might need a fix.

Aside from that, this patch looks fine.
