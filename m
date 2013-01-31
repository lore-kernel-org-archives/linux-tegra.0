From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RFC 1/2] Implementation of pci_fixup_irqs for descendants
 of a specified bus
Date: Wed, 30 Jan 2013 17:24:14 -0700
Message-ID: <CAErSpo7Oyx41Qy80YcZNpSe7CatzLZ4Lai0--YRGJ0NZ1zQTRA@mail.gmail.com>
References: <20130118113742.GA9006@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130118113742.GA9006-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Murray <Andrew.Murray-5wv7dgnIgG8@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 18, 2013 at 4:37 AM, Andrew Murray <Andrew.Murray-5wv7dgnIgG8@public.gmane.org> wrote:
> Continuing from discussion with Thierry (lkml.org/lkml/2013/1/18/107) perhaps
> this will be useful to fold into your patchset.
> ---
> This patch provides pci_bus_fixup_irqs which performs the same
> function as pci_fixup_irqs but only to descendants of the specified
> bus.

I think pci_fixup_irqs() is a broken design to begin with because it
is only called once at boot-time and it iterates over all the devices
we've found so far.  Any hot-added devices never get the fixups.

Adding pci_bus_fixup_irqs() addresses part of that, by adding a way to
fixup a subset of devices, e.g., maybe it could be done for hot-added
things.

But I think it would be better to do a more extensive refactoring and
do the IRQ fixups directly somewhere in the pci_device_add() path.
That way we can do it a device at a time, for every device (present at
boot and hot-added later), and before any drivers claim the device.

> This can reduce unnecessary fixing up of device irqs when new buses
> are added.
>
> Signed-off-by: Andrew Murray <Andrew.Murray-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> ---
>  drivers/pci/setup-irq.c |   15 +++++++++++++++
>  include/linux/pci.h     |    3 +++
>  2 files changed, 18 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/pci/setup-irq.c b/drivers/pci/setup-irq.c
> index eb219a1..ea91874 100644
> --- a/drivers/pci/setup-irq.c
> +++ b/drivers/pci/setup-irq.c
> @@ -62,3 +62,18 @@ pci_fixup_irqs(u8 (*swizzle)(struct pci_dev *, u8 *),
>         for_each_pci_dev(dev)
>                 pdev_fixup_irq(dev, swizzle, map_irq);
>  }
> +
> +void __init
> +pci_bus_fixup_irqs(struct pci_bus *bus,
> +               u8 (*swizzle)(struct pci_dev *, u8 *),
> +               int (*map_irq)(const struct pci_dev *, u8, u8))
> +{
> +       struct pci_dev *dev;
> +
> +       list_for_each_entry(dev, &bus->devices, bus_list) {
> +               pdev_fixup_irq(dev, swizzle, map_irq);
> +
> +               if (dev->subordinate)
> +                       pci_bus_fixup_irqs(dev->subordinate, swizzle, map_irq);
> +       }
> +}
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 5faa831..1b3c2eb 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -953,6 +953,9 @@ void pdev_enable_device(struct pci_dev *);
>  int pci_enable_resources(struct pci_dev *, int mask);
>  void pci_fixup_irqs(u8 (*)(struct pci_dev *, u8 *),
>                     int (*)(const struct pci_dev *, u8, u8));
> +void pci_bus_fixup_irqs(struct pci_bus *bus,
> +               u8 (*swizzle)(struct pci_dev *, u8 *),
> +               int (*map_irq)(const struct pci_dev *, u8, u8));
>  #define HAVE_PCI_REQ_REGIONS   2
>  int __must_check pci_request_regions(struct pci_dev *, const char *);
>  int __must_check pci_request_regions_exclusive(struct pci_dev *, const char *);
> --
> 1.7.0.4
>
>
