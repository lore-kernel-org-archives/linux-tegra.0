From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 09/10] PCI: tegra: Add Tegra194 PCIe support
Date: Wed, 27 Mar 2019 10:07:59 +0000
Message-ID: <96674380-a171-9c68-2030-564f15b88474@nvidia.com>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
 <1553613207-3988-10-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553613207-3988-10-git-send-email-vidyas@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, tiwai@suse.de, spujar@nvidia.com, skomatineni@nvidia.com, liviu.dudau@arm.com, krzk@kernel.org, heiko@sntech.de, horms+renesas@verge.net.au, olof@lixom.net, maxime.ripard@bootlin.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, ezequiel@collabora.com, stefan.wahren@i2se.com, marc.w.gonzalez@free.fr, l.stach@pengutronix.de, tpiepho@impinj.com, hayashi.kunihiko@socionext.co
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com
List-Id: linux-tegra@vger.kernel.org


On 26/03/2019 15:13, Vidya Sagar wrote:
> Add support for Synopsys DesignWare core IP based PCIe host controller
> present in Tegra194 SoC.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  drivers/pci/controller/dwc/Kconfig         |   10 +
>  drivers/pci/controller/dwc/Makefile        |    1 +
>  drivers/pci/controller/dwc/pcie-tegra194.c | 1862 ++++++++++++++++++++++++++++
>  3 files changed, 1873 insertions(+)
>  create mode 100644 drivers/pci/controller/dwc/pcie-tegra194.c
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 6ea74b1c0d94..d80f2d77892a 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -213,4 +213,14 @@ config PCIE_UNIPHIER
>  	  Say Y here if you want PCIe controller support on UniPhier SoCs.
>  	  This driver supports LD20 and PXs3 SoCs.
>  
> +config PCIE_TEGRA194
> +	bool "NVIDIA Tegra (T194) PCIe controller"
> +	depends on TEGRA_BPMP && (ARCH_TEGRA || COMPILE_TEST)
> +	depends on PCI_MSI_IRQ_DOMAIN
> +	select PCIE_DW_HOST
> +	select PHY_TEGRA194_PCIE_P2U
> +	help
> +	  Say Y here if you want support for DesignWare core based PCIe host
> +	  controller found in NVIDIA Tegra T194 SoC.
> +

Don't we want tristate here? You have a removal function.

Cheers
Jon

-- 
nvpublic
