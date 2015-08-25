From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: use __pgprot() around static pgprot_t initializer
Date: Tue, 25 Aug 2015 17:05:56 +0200
Message-ID: <CAKv+Gu82vaxgjkURo_0-Ho6i8pDXM0EuPRxRZobkf4re+DFgKQ@mail.gmail.com>
References: <1435681818-14155-1-git-send-email-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435681818-14155-1-git-send-email-ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 30 June 2015 at 18:30, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> In order to comply with the rules that apply when STRICT_MM_TYPECHECKS
> is defined, wrap the initializer for a pgprot_t in __pgprot().
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/pci/host/pci-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 00e92720d7f7..f8a70b64b55c 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -382,8 +382,8 @@ static unsigned long tegra_pcie_conf_offset(unsigned int devfn, int where)
>  static struct tegra_pcie_bus *tegra_pcie_bus_alloc(struct tegra_pcie *pcie,
>                                                    unsigned int busnr)
>  {
> -       pgprot_t prot = L_PTE_PRESENT | L_PTE_YOUNG | L_PTE_DIRTY | L_PTE_XN |
> -                       L_PTE_MT_DEV_SHARED | L_PTE_SHARED;
> +       pgprot_t prot = __pgprot(L_PTE_PRESENT | L_PTE_YOUNG | L_PTE_DIRTY |
> +                                L_PTE_XN | L_PTE_MT_DEV_SHARED | L_PTE_SHARED);
>         phys_addr_t cs = pcie->cs->start;
>         struct tegra_pcie_bus *bus;
>         unsigned int i;

Ping?
