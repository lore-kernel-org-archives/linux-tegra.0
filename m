From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 06/10] ARM: tegra: pcie: Add MSI support
Date: Mon, 11 Jun 2012 15:19:53 -0600
Message-ID: <4FD660F9.7030807@wwwdotorg.org>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de> <1339427118-32263-7-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1339427118-32263-7-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/11/2012 09:05 AM, Thierry Reding wrote:
> This commit adds support for message signaled interrupts to the Tegra
> PCIe controller. Based on code by Krishna Kishore <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.

> diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c

> +static irqreturn_t tegra_pcie_msi_irq(int irq, void *data)
...
> +			irq = irq_find_mapping(pcie->msi->domain, index);
> +			if (irq) {
> +				if (test_bit(index, pcie->msi->used))
> +					generic_handle_irq(irq);

This invokes the handler first ...

...
> +			/* clear the interrupt */
> +			afi_writel(pcie, 1 << offset, AFI_MSI_VEC0 + i * 4);
> +			/* see if there's any more pending in this vector */
> +			reg = afi_readl(pcie, AFI_MSI_VEC0 + i * 4);

... then clears the interrupt status in the PCIe controller. Won't that
lose interrupts if one is raised between when the handler clears the
root-cause, and when this code clears the received interrupt status?

> +static int tegra_pcie_disable_msi(struct platform_device *pdev)

Should this free pcie->msi->pages?

Why allocate pcie->msi separately; why not include the fields directly
into struct tegra_pcie_info *pcie?
