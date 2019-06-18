From: Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH V10 03/15] PCI: dwc: Perform dbi regs write lock towards
 the end
Date: Tue, 18 Jun 2019 06:34:12 +0000
Message-ID: <PSXP216MB066293334CA5E29E14C41B9FAAEA0@PSXP216MB0662.KORP216.PROD.OUTLOOK.COM>
References: <20190612095339.20118-1-vidyas@nvidia.com>
 <20190612095339.20118-4-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190612095339.20118-4-vidyas@nvidia.com>
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
To: Vidya Sagar <vidyas@nvidia.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "kishon@ti.com" <kishon@ti.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mmaddireddy@nvidia.com" <mmaddireddy@nvidia.com>, "kthota@nvidia.com" <kthota@nvidia.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mperttunen@nvidia.com" <mperttunen@nvidia.com>, Han Jingoo <jingoohan1@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "digetx@gmail.com" <digetx@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "sagar.tv@gmail.com" <sagar.tv@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On 6/12/19, 6:54 PM, Vidya Sagar wrote:
>
> Remove multiple write enable and disable sequences of dbi registers as
> Tegra194 implements writes to BAR-0 register (offset: 0x10) controlled by
> DBI write-lock enable bit thereby not allowing any further writes to BAR-0
> register in config space to take place. Hence enabling write permission at
> the start of function and disabling the same only towards the end.
>
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Reviewed-by: Thierry Reding <treding@nvidia.com>

Acked-by: Jingoo Han  <jingoohan1@gmail.com>

Sorry for being late. I read the previous threads. I don't think that this patch
has any harmful effects. This patch looks good to me.
Thank you.

Best regards,
Jingoo Han

> ---
> Changes since [v9]:
> * None
>
> Changes since [v8]:
> * None
>
> Changes since [v7]:
> * None
>
> Changes since [v6]:
> * None
>
> Changes since [v5]:
> * Moved write enable to the beginning of the API and write disable to the end
>
> Changes since [v4]:
> * None
>
> Changes since [v3]:
> * None
>
> Changes since [v2]:
> * None
>
> Changes since [v1]:
> * None
>
>  drivers/pci/controller/dwc/pcie-designware-host.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index f93252d0da5b..d3156446ff27 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -628,6 +628,12 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
>  	u32 val, ctrl, num_ctrls;
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>  
> +	/*
> +	 * Enable DBI read-only registers for writing/updating configuration.
> +	 * Write permission gets disabled towards the end of this function.
> +	 */
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
>  	dw_pcie_setup(pci);
>  
>  	if (!pp->ops->msi_host_init) {
> @@ -650,12 +656,10 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
>  	dw_pcie_writel_dbi(pci, PCI_BASE_ADDRESS_1, 0x00000000);
>  
>  	/* Setup interrupt pins */
> -	dw_pcie_dbi_ro_wr_en(pci);
>  	val = dw_pcie_readl_dbi(pci, PCI_INTERRUPT_LINE);
>  	val &= 0xffff00ff;
>  	val |= 0x00000100;
>  	dw_pcie_writel_dbi(pci, PCI_INTERRUPT_LINE, val);
> -	dw_pcie_dbi_ro_wr_dis(pci);
>  
>  	/* Setup bus numbers */
>  	val = dw_pcie_readl_dbi(pci, PCI_PRIMARY_BUS);
> @@ -687,15 +691,13 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
>  
>  	dw_pcie_wr_own_conf(pp, PCI_BASE_ADDRESS_0, 4, 0);
>  
> -	/* Enable write permission for the DBI read-only register */
> -	dw_pcie_dbi_ro_wr_en(pci);
>  	/* Program correct class for RC */
>  	dw_pcie_wr_own_conf(pp, PCI_CLASS_DEVICE, 2, PCI_CLASS_BRIDGE_PCI);
> -	/* Better disable write permission right after the update */
> -	dw_pcie_dbi_ro_wr_dis(pci);
>  
>  	dw_pcie_rd_own_conf(pp, PCIE_LINK_WIDTH_SPEED_CONTROL, 4, &val);
>  	val |= PORT_LOGIC_SPEED_CHANGE;
>  	dw_pcie_wr_own_conf(pp, PCIE_LINK_WIDTH_SPEED_CONTROL, 4, val);
> +
> +	dw_pcie_dbi_ro_wr_dis(pci);
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_setup_rc);
> -- 
> 2.17.1
