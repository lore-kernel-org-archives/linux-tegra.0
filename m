From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: RE: [PATCH V3 08/16] PCI: dwc: Add support to enable CDM register
 check
Date: Wed, 17 Apr 2019 09:39:10 +0000
Message-ID: <305100E33629484CBB767107E4246BBB0A22C0EC@de02wembxa.internal.synopsys.com>
References: <20190416192730.15681-1-vidyas@nvidia.com>
 <20190416192730.15681-9-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190416192730.15681-9-vidyas@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vidya Sagar <vidyas@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "kishon@ti.com" <kishon@ti.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <Gustavo.Pimentel@synopsys.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mmaddireddy@nvidia.com" <mmaddireddy@nvidia.com>, "kthota@nvidia.com" <kthota@nvidia.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mperttunen@nvidia.com" <mperttunen@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "sagar.tv@gmail.com" <sagar.tv@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 16, 2019 at 20:27:22, Vidya Sagar <vidyas@nvidia.com> wrote:

> Add support to enable CDM (Configuration Dependent Module) register check
> for any data corruption based on the device-tree flag 'enable-cdm-check'.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v2]:
> * Changed code and commit description to reflect change in flag from
>   'cdm-check' to 'enable-cdm-check'
> 
> Changes since [v1]:
> * This is a new patch in v2 series
> 
>  drivers/pci/controller/dwc/pcie-designware.c | 7 +++++++
>  drivers/pci/controller/dwc/pcie-designware.h | 9 +++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 44c0ba078452..5b416f483426 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -503,4 +503,11 @@ void dw_pcie_setup(struct dw_pcie *pci)
>  		break;
>  	}
>  	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
> +
> +	if (of_property_read_bool(np, "enable-cdm-check")) {
> +		val = dw_pcie_readl_dbi(pci, PCIE_PL_CHK_REG_CONTROL_STATUS);
> +		val |= PCIE_PL_CHK_REG_CHK_REG_CONTINUOUS |
> +		       PCIE_PL_CHK_REG_CHK_REG_START;
> +		dw_pcie_writel_dbi(pci, PCIE_PL_CHK_REG_CONTROL_STATUS, val);
> +	}
>  }
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index fa41d675c48f..7f57fe019fbf 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -83,6 +83,15 @@
>  #define PCIE_MISC_CONTROL_1_OFF		0x8BC
>  #define PCIE_DBI_RO_WR_EN		BIT(0)
>  
> +#define PCIE_PL_CHK_REG_CONTROL_STATUS			0xB20
> +#define PCIE_PL_CHK_REG_CHK_REG_START			BIT(0)
> +#define PCIE_PL_CHK_REG_CHK_REG_CONTINUOUS		BIT(1)
> +#define PCIE_PL_CHK_REG_CHK_REG_COMPARISON_ERROR	BIT(16)
> +#define PCIE_PL_CHK_REG_CHK_REG_LOGIC_ERROR		BIT(17)
> +#define PCIE_PL_CHK_REG_CHK_REG_COMPLETE		BIT(18)
> +
> +#define PCIE_PL_CHK_REG_ERR_ADDR			0xB28
> +
>  /*
>   * iATU Unroll-specific register definitions
>   * From 4.80 core version the address translation will be made by unroll
> -- 
> 2.17.1

Nice.

Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>

Thanks,
Gustavo
