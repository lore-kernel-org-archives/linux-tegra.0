From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC PATCH 06/10] usb: xhci: Add Tegra XHCI host-controller driver
Date: Thu, 15 May 2014 13:18:22 -0700
Message-ID: <CAL1qeaHm7U2NVDeVZS-Tiz5ntkk4c13RR_1ws9MTYGGoGCOB5A@mail.gmail.com>
References: <1400113986-339-1-git-send-email-abrestic@chromium.org>
	<1400113986-339-7-git-send-email-abrestic@chromium.org>
	<15599140.PsD4j7x3tZ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <15599140.PsD4j7x3tZ@wuerfel>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Arnd,

On Thu, May 15, 2014 at 1:17 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 14 May 2014 17:33:02 Andrew Bresticker wrote:
>> +
>> +int tegra_xhci_register_mbox_notifier(struct notifier_block *nb)
>> +{
>> +     int ret;
>> +
>> +     mutex_lock(&tegra_xhci_mbox_lock);
>> +     ret = raw_notifier_chain_register(&tegra_xhci_mbox_notifiers, nb);
>> +     mutex_unlock(&tegra_xhci_mbox_lock);
>> +
>> +     return ret;
>> +}
>> +EXPORT_SYMBOL(tegra_xhci_register_mbox_notifier);
>> +
>> +void tegra_xhci_unregister_mbox_notifier(struct notifier_block *nb)
>> +{
>> +     mutex_lock(&tegra_xhci_mbox_lock);
>> +     raw_notifier_chain_unregister(&tegra_xhci_mbox_notifiers, nb);
>> +     mutex_unlock(&tegra_xhci_mbox_lock);
>> +}
>> +EXPORT_SYMBOL(tegra_xhci_unregister_mbox_notifier);
>
> What driver would use these?

It's used by just this driver (the host) and the PHY driver (next
patch in series).

> My feeling is that if you have a mailbox that is used by multiple
> drivers, you should use a proper mailbox driver to operate them,
> and have the drivers register with that API instead of a custom one.

Ok, will do.

>> +     /* Create child xhci-plat device */
>> +     memset(xhci_resources, 0, sizeof(xhci_resources));
>> +     res = platform_get_resource(to_platform_device(dev), IORESOURCE_IRQ, 0);
>> +     if (!res) {
>> +             dev_err(dev, "Missing XHCI IRQ\n");
>> +             ret = -ENODEV;
>> +             goto out;
>> +     }
>> +     xhci_resources[0].start = res->start;
>> +     xhci_resources[0].end = res->end;
>> +     xhci_resources[0].flags = res->flags;
>> +     xhci_resources[0].name = res->name;
>> +     res = platform_get_resource(to_platform_device(dev), IORESOURCE_MEM, 0);
>> +     if (!res) {
>> +             dev_err(dev, "Missing XHCI registers\n");
>> +             ret = -ENODEV;
>> +             goto out;
>> +     }
>> +     xhci_resources[1].start = res->start;
>> +     xhci_resources[1].end = res->end;
>> +     xhci_resources[1].flags = res->flags;
>> +     xhci_resources[1].name = res->name;
>> +
>> +     xhci = platform_device_alloc("xhci-hcd", PLATFORM_DEVID_AUTO);
>> +     if (!xhci) {
>> +             dev_err(dev, "Failed to allocate XHCI host\n");
>> +             ret = -ENOMEM;
>> +             goto out;
>> +     }
>
> This does not feel appropriate at all: Rather than creating a child device,
> you should have a specific driver that hooks into functions exported
> by the xhci core. See Documentation/driver-model/design-patterns.txt

This is how DWC3, currently the only in-tree non-PCI XHCI host driver,
is structured - see drivers/usb/dwc3/host.c.  The recently proposed
Armada XHCI driver [1] just adds clock support and a hook in
xhci-plat's probe() to do the platform-specific initialization.
Tegra's XHCI driver initialization is quite a bit more complicated,
mainly due to the need for external firmware and specific ordering
(e.g. firmware messages should only be enabled after the HCD is
created).  I could do away with the xhci-plat sub-device and just
create a Tegra hc_driver, but it seems silly to have three XHCI
platform drivers structured in three different ways.  USB folks, do
you have an opinion on how this should be done?

[1] https://lkml.org/lkml/2014/5/15/208

Thanks,
Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
