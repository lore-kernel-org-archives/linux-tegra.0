From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH resend] PCI: tegra: use __pgprot() around static pgprot_t
 initializer
Date: Mon, 14 Sep 2015 11:47:56 -0500
Message-ID: <20150914164756.GM829@google.com>
References: <1440578974-26527-1-git-send-email-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440578974-26527-1-git-send-email-ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 26, 2015 at 10:49:34AM +0200, Ard Biesheuvel wrote:
> In order to comply with the rules that apply when STRICT_MM_TYPECHECKS
> is defined, wrap the initializer for a pgprot_t in __pgprot().
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied with Thierry's ack to pci/host-tegra for v4.4, thanks!

> ---
>  drivers/pci/host/pci-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 10c05718dbfd..0d3e6cb0c459 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -382,8 +382,8 @@ static unsigned long tegra_pcie_conf_offset(unsigned int devfn, int where)
>  static struct tegra_pcie_bus *tegra_pcie_bus_alloc(struct tegra_pcie *pcie,
>  						   unsigned int busnr)
>  {
> -	pgprot_t prot = L_PTE_PRESENT | L_PTE_YOUNG | L_PTE_DIRTY | L_PTE_XN |
> -			L_PTE_MT_DEV_SHARED | L_PTE_SHARED;
> +	pgprot_t prot = __pgprot(L_PTE_PRESENT | L_PTE_YOUNG | L_PTE_DIRTY |
> +				 L_PTE_XN | L_PTE_MT_DEV_SHARED | L_PTE_SHARED);
>  	phys_addr_t cs = pcie->cs->start;
>  	struct tegra_pcie_bus *bus;
>  	unsigned int i;
> -- 
> 1.9.1


commit 512ee2fd9ca1c0b447a144c6c49a53a010f8d6fa
Author: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date:   Wed Aug 26 10:49:34 2015 +0200

    PCI: tegra: Wrap static pgprot_t initializer with __pgprot()
    
    Wrap pgprot_t initializer with __pgprot() to comply with the
    STRICT_MM_TYPECHECKS rules.
    
    [bhelgaas: changelog]
    Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
    Signed-off-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
    Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 81df0c1..3018ae5 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -382,8 +382,8 @@ static unsigned long tegra_pcie_conf_offset(unsigned int devfn, int where)
 static struct tegra_pcie_bus *tegra_pcie_bus_alloc(struct tegra_pcie *pcie,
 						   unsigned int busnr)
 {
-	pgprot_t prot = L_PTE_PRESENT | L_PTE_YOUNG | L_PTE_DIRTY | L_PTE_XN |
-			L_PTE_MT_DEV_SHARED | L_PTE_SHARED;
+	pgprot_t prot = __pgprot(L_PTE_PRESENT | L_PTE_YOUNG | L_PTE_DIRTY |
+				 L_PTE_XN | L_PTE_MT_DEV_SHARED | L_PTE_SHARED);
 	phys_addr_t cs = pcie->cs->start;
 	struct tegra_pcie_bus *bus;
 	unsigned int i;
