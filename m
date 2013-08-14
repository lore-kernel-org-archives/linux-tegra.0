From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 3/3] PCI: tegra: Support driver unbinding
Date: Wed, 14 Aug 2013 15:43:40 -0600
Message-ID: <520BFA0C.5070001@wwwdotorg.org>
References: <1376392346-14127-1-git-send-email-treding@nvidia.com> <1376392346-14127-4-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376392346-14127-4-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/13/2013 05:12 AM, Thierry Reding wrote:
> Implement the platform driver's .remove() callback to free all resources
> allocated during driver setup and call pci_common_exit() to cleanup ARM
> specific datastructures. Unmap the fixed PCI I/O mapping by calling the
> new pci_iounmap_io() function in the new .teardown() callback.
> 
> Finally, no longer set the .suppress_bind_attrs field to true to allow
> the driver to unbind from a device.

> +static int tegra_pcie_remove(struct platform_device *pdev)
> +{
> +	struct tegra_pcie *pcie = platform_get_drvdata(pdev);
> +	struct tegra_pcie_bus *bus, *tmp;
> +	int err;
> +
> +	pci_common_exit(&pcie->sys);
> +
> +	list_for_each_entry_safe(bus, tmp, &pcie->busses, list) {
> +		vunmap(bus->area->addr);
> +		kfree(bus);
> +	}
> +
> +	if (IS_ENABLED(CONFIG_PCI_MSI)) {
> +		err = tegra_pcie_disable_msi(pcie);
> +		if (err < 0)
> +			return err;
> +	}

Wouldn't it make sense to do that as early as possible in the function,
to make sure that no MSI accidentally fires after some of the cleanup
has already happened?

> +
> +	err = tegra_pcie_put_resources(pcie);
> +	if (err < 0)
> +		return err;
> +
> +	return 0;
> +}
