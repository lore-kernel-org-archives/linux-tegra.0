From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V8 14/15] PCI: tegra: Add Tegra194 PCIe support
Date: Thu, 6 Jun 2019 19:35:47 +0300
Message-ID: <f30e7fc6-3f64-d321-c32c-5e273115a869@gmail.com>
References: <20190526043751.12729-1-vidyas@nvidia.com>
 <20190526043751.12729-15-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190526043751.12729-15-vidyas@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>, lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com
Cc: mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

26.05.2019 7:37, Vidya Sagar пишет:
> Add support for Synopsys DesignWare core IP based PCIe host controller
> present in Tegra194 SoC.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v7]:
> * Addressed review comments from Thierry
> 
> Changes since [v6]:
> * Removed code around "nvidia,disable-aspm-states" DT property
> * Refactored code to remove code duplication
> 
> Changes since [v5]:
> * Addressed review comments from Thierry
> 
> Changes since [v4]:
> * None
> 
> Changes since [v3]:
> * None
> 
> Changes since [v2]:
> * Changed 'nvidia,init-speed' to 'nvidia,init-link-speed'
> * Changed 'nvidia,pex-wake' to 'nvidia,wake-gpios'
> * Removed .runtime_suspend() & .runtime_resume() implementations
> 
> Changes since [v1]:
> * Made CONFIG_PCIE_TEGRA194 as 'm' by default from its previous 'y' state
> * Modified code as per changes made to DT documentation
> * Refactored code to address Bjorn & Thierry's review comments
> * Added goto to avoid recursion in tegra_pcie_dw_host_init() API
> * Merged .scan_bus() of dw_pcie_host_ops implementation to tegra_pcie_dw_host_init() API
> 
>  drivers/pci/controller/dwc/Kconfig         |   10 +
>  drivers/pci/controller/dwc/Makefile        |    1 +
>  drivers/pci/controller/dwc/pcie-tegra194.c | 1621 ++++++++++++++++++++
>  3 files changed, 1632 insertions(+)
>  create mode 100644 drivers/pci/controller/dwc/pcie-tegra194.c
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index a6ce1ee51b4c..884112afc11b 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -220,6 +220,16 @@ config PCI_MESON
>  	  and therefore the driver re-uses the DesignWare core functions to
>  	  implement the driver.
>  
> +config PCIE_TEGRA194
> +	tristate "NVIDIA Tegra194 (and later) PCIe controller"
> +	depends on (TEGRA_BPMP && ARCH_TEGRA) || COMPILE_TEST

TEGRA_BPMP will be enough here as it depends on other relevant options.

Hence I mean:

	depends on TEGRA_BPMP || COMPILE_TEST


> +	depends on PCI_MSI_IRQ_DOMAIN

You probably want to s/depends on/select/ PCI_MSI_IRQ_DOMAIN, don't you?

-- 
Dmitry
