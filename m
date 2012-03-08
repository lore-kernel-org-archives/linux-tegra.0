From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 06/11] PCI: Keep pci_fixup_irqs() around after init
Date: Thu, 8 Mar 2012 10:27:07 -0700
Message-ID: <CAErSpo6hbWjteESST1+O2WzbtmZq6hC-pnUB4o3MAXWG-EgU+g@mail.gmail.com>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de>
 <1331218291-16119-7-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331218291-16119-7-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 8, 2012 at 7:51 AM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
> =A0drivers/pci/setup-irq.c | =A0 =A04 ++--
> =A01 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/setup-irq.c b/drivers/pci/setup-irq.c
> index eb219a1..270ae7b 100644
> --- a/drivers/pci/setup-irq.c
> +++ b/drivers/pci/setup-irq.c
> @@ -18,7 +18,7 @@
> =A0#include <linux/cache.h>
>
>
> -static void __init
> +static void
> =A0pdev_fixup_irq(struct pci_dev *dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 u8 (*swizzle)(struct pci_dev *, u8 *),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 int (*map_irq)(const struct pci_dev *, u8=
, u8))
> @@ -54,7 +54,7 @@ pdev_fixup_irq(struct pci_dev *dev,
> =A0 =A0 =A0 =A0pcibios_update_irq(dev, irq);
> =A0}
>
> -void __init
> +void
> =A0pci_fixup_irqs(u8 (*swizzle)(struct pci_dev *, u8 *),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 int (*map_irq)(const struct pci_dev *, u8=
, u8))
> =A0{


        struct pci_dev *dev =3D NULL;
        for_each_pci_dev(dev)
                pdev_fixup_irq(dev, swizzle, map_irq);
}

Hmm, your patch looks OK as far as it goes, but the implementation of
pci_fixup_irqs() as a call-once-at-boot-time thing with a loop through
all the PCI devices we've found so far looks completely broken with
regard to hotplug.

Who does the swizzle for devices hot-added after boot?

Bjorn
