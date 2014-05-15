From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH 06/10] usb: xhci: Add Tegra XHCI host-controller driver
Date: Thu, 15 May 2014 10:17:10 +0200
Message-ID: <15599140.PsD4j7x3tZ@wuerfel>
References: <1400113986-339-1-git-send-email-abrestic@chromium.org> <1400113986-339-7-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400113986-339-7-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 14 May 2014 17:33:02 Andrew Bresticker wrote:
> +
> +int tegra_xhci_register_mbox_notifier(struct notifier_block *nb)
> +{
> +	int ret;
> +
> +	mutex_lock(&tegra_xhci_mbox_lock);
> +	ret = raw_notifier_chain_register(&tegra_xhci_mbox_notifiers, nb);
> +	mutex_unlock(&tegra_xhci_mbox_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(tegra_xhci_register_mbox_notifier);
> +
> +void tegra_xhci_unregister_mbox_notifier(struct notifier_block *nb)
> +{
> +	mutex_lock(&tegra_xhci_mbox_lock);
> +	raw_notifier_chain_unregister(&tegra_xhci_mbox_notifiers, nb);
> +	mutex_unlock(&tegra_xhci_mbox_lock);
> +}
> +EXPORT_SYMBOL(tegra_xhci_unregister_mbox_notifier);

What driver would use these?

My feeling is that if you have a mailbox that is used by multiple
drivers, you should use a proper mailbox driver to operate them,
and have the drivers register with that API instead of a custom one.

> +	/* Create child xhci-plat device */
> +	memset(xhci_resources, 0, sizeof(xhci_resources));
> +	res = platform_get_resource(to_platform_device(dev), IORESOURCE_IRQ, 0);
> +	if (!res) {
> +		dev_err(dev, "Missing XHCI IRQ\n");
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +	xhci_resources[0].start = res->start;
> +	xhci_resources[0].end = res->end;
> +	xhci_resources[0].flags = res->flags;
> +	xhci_resources[0].name = res->name;
> +	res = platform_get_resource(to_platform_device(dev), IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(dev, "Missing XHCI registers\n");
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +	xhci_resources[1].start = res->start;
> +	xhci_resources[1].end = res->end;
> +	xhci_resources[1].flags = res->flags;
> +	xhci_resources[1].name = res->name;
> +
> +	xhci = platform_device_alloc("xhci-hcd", PLATFORM_DEVID_AUTO);
> +	if (!xhci) {
> +		dev_err(dev, "Failed to allocate XHCI host\n");
> +		ret = -ENOMEM;
> +		goto out;
> +	}

This does not feel appropriate at all: Rather than creating a child device,
you should have a specific driver that hooks into functions exported
by the xhci core. See Documentation/driver-model/design-patterns.txt

	Arnd
