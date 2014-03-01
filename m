From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH 0/7] PCI irq mapping fixes and cleanups
Date: Fri, 28 Feb 2014 16:53:33 -0800
Message-ID: <CAJ+vNU2VN5haOU2GN5o7UUg9vgYh06pAhvDaoGw6EzTBEbD0mg@mail.gmail.com>
References: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393608523-17509-1-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Richard Zhu <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 28, 2014 at 9:28 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> This series cleans up the PCI irq mapping for all
> the ARM PCI host drivers, so they handle it in the
> way defined in the common PCI bindings.
>
> Testing appreciated.
>
> Lucas Stach (7):
>   ARM: dts: tegra: add PCIe interrupt mapping properties
>   PCI: tegra: use new OF interrupt mapping when possible
>   PCI: rcar: use new OF interrupt mapping when possible
>   ARM: dts: exynos5440: fix PCIe interrupt mapping
>   ARM: dts: imx6: add PCIe interrupt mapping properties
>   PCI: designware: use new OF interrupt mapping when possible
>   PCI: designware: split samsung and fsl bindings
>
>  .../devicetree/bindings/pci/designware-pcie.txt    | 69 +--------------------
>  .../devicetree/bindings/pci/fsl,imx6q-pcie.txt     | 48 +++++++++++++++
>  .../bindings/pci/nvidia,tegra20-pcie.txt           |  8 +++
>  .../bindings/pci/samsung,exynos5440-pcie.txt       | 70 ++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5440.dtsi                  |  4 +-
>  arch/arm/boot/dts/imx6qdl.dtsi                     | 11 ++++
>  arch/arm/boot/dts/tegra20.dtsi                     |  4 ++
>  arch/arm/boot/dts/tegra30.dtsi                     |  4 ++
>  drivers/pci/host/pci-rcar-gen2.c                   |  8 ++-
>  drivers/pci/host/pci-tegra.c                       |  7 ++-
>  drivers/pci/host/pcie-designware.c                 |  8 ++-
>  11 files changed, 168 insertions(+), 73 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
>  create mode 100644 Documentation/devicetree/bindings/pci/samsung,exynos5440-pcie.txt
>
> --
> 1.8.5.3
>

Lucas,

In testing this on IMX6 I'm finding that 'of_irq_parse_and_map_pci()'
always returns -EINVAL because it can't find a dt node for the host
bridge: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/of/of_pci_irq.c#n60.

So it seems there is still something missing in the imx6 devicetree
regarding a 'host bridge'?  Is this solution expecting the
range/interrupt data from the PCI host controller to be encapsulated
in a host-bridge node such as
http://lxr.missinglinkelectronics.com/linux/Documentation/devicetree/bindings/pci/ralink,rt3883-pci.txt#L124?
 If so, thats not how the imx6 host controller node is currently
defined.

In my particular test case I have a baseboard with a socket on it and
a PLX PEX860x PCIe switch on an add-in card.  So I don't think it
makes sense to me to describe the add-in card in the baseboard DT -
that wouldn't be very plug-n-play.   By the way, I'm not referring to
the add-in card with the TI-XIO2001 PCIe-to-PCI bridge with the
mismapped IRQ's - I'm aware that I would need to deal with that
somehow in devicetree (still trying to understand how).

Thanks,

Tim
