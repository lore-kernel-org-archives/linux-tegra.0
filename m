From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 11/19] PCI: Move setting pci_host_bridge.busnr out of host drivers
Date: Thu, 23 Jul 2020 09:26:01 -0600
Message-ID: <CAL_Jsq+sPaubVERLHaRzjvThk3zDO6zAnRQjGuAMKaVA87Y4HQ@mail.gmail.com>
References: <20200722022514.1283916-1-robh@kernel.org> <20200722022514.1283916-12-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200722022514.1283916-12-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gustavo Pimentel <gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karthikeyan Mitran <m.karthikeyan-DTHOJn6Rh8lhmhkoCovsdw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Richard Zhu <hongxing.zhu-3arQi8VN3Tc@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 21, 2020 at 8:25 PM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> Most host drivers only parse the DT bus range to set the root bus number
> in pci_host_bridge.busnr. The ones that don't set busnr are buggy in
> that they ignore what's in DT. Let's set busnr in pci_scan_root_bus_bridge()
> where we already check for the bus resource and remove setting it in
> host drivers.
>
> Cc: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Gustavo Pimentel <gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Cc: Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> Cc: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Cc: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 4 ----
>  drivers/pci/controller/dwc/pcie-designware.h      | 1 -
>  drivers/pci/controller/pci-aardvark.c             | 5 ++---
>  drivers/pci/controller/pci-host-common.c          | 1 -
>  drivers/pci/controller/pci-tegra.c                | 4 +---
>  drivers/pci/controller/pci-v3-semi.c              | 2 --
>  drivers/pci/controller/pcie-mediatek.c            | 8 +-------
>  drivers/pci/controller/pcie-rcar-host.c           | 1 -
>  drivers/pci/probe.c                               | 1 +
>  9 files changed, 5 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 9e8a9cfc6d3a..fa922cb876a3 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -374,9 +374,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
>                         pp->cfg0_base = pp->cfg->start;
>                         pp->cfg1_base = pp->cfg->start + pp->cfg0_size;
>                         break;
> -               case IORESOURCE_BUS:
> -                       pp->busn = win->res;
> -                       break;
>                 }
>         }
>

> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index fd2146298b58..9fb44290ed43 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -188,7 +188,6 @@ struct pcie_port {
>         struct resource         *cfg;
>         struct resource         *io;
>         struct resource         *mem;
> -       struct resource         *busn;
>         int                     irq;
>         const struct dw_pcie_host_ops *ops;
>         int                     msi_irq;

These 2 hunks should be dropped as they are breaking the Amazon driver.

Lorenzo, do you want to fixup or I can send a fix?

Rob
