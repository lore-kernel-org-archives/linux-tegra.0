From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 1/2] PCI: tegra: Fix CLKREQ dependency programming
Date: Fri, 18 Oct 2019 10:01:27 +0100
Message-ID: <20191018090127.GA25918@e121166-lin.cambridge.arm.com>
References: <20191005164212.3646-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20191005164212.3646-1-vidyas@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: devicetree@vger.kernel.org, mmaddireddy@nvidia.com, kthota@nvidia.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com, bhelgaas@google.com, andrew.murray@arm.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Sat, Oct 05, 2019 at 10:12:11PM +0530, Vidya Sagar wrote:
> Corrects the programming to provide REFCLK to the downstream device
> when there is no CLKREQ sideband signal routing present from root port
> to the endpont.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  drivers/pci/controller/dwc/pcie-tegra194.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied to pci/tegra, thanks.

Lorenzo

> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index f89f5acee72d..cbe95f0ea0ca 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -40,8 +40,6 @@
>  #define APPL_PINMUX_CLKREQ_OVERRIDE		BIT(3)
>  #define APPL_PINMUX_CLK_OUTPUT_IN_OVERRIDE_EN	BIT(4)
>  #define APPL_PINMUX_CLK_OUTPUT_IN_OVERRIDE	BIT(5)
> -#define APPL_PINMUX_CLKREQ_OUT_OVRD_EN		BIT(9)
> -#define APPL_PINMUX_CLKREQ_OUT_OVRD		BIT(10)
>  
>  #define APPL_CTRL				0x4
>  #define APPL_CTRL_SYS_PRE_DET_STATE		BIT(6)
> @@ -1193,8 +1191,8 @@ static int tegra_pcie_config_controller(struct tegra_pcie_dw *pcie,
>  
>  	if (!pcie->supports_clkreq) {
>  		val = appl_readl(pcie, APPL_PINMUX);
> -		val |= APPL_PINMUX_CLKREQ_OUT_OVRD_EN;
> -		val |= APPL_PINMUX_CLKREQ_OUT_OVRD;
> +		val |= APPL_PINMUX_CLKREQ_OVERRIDE_EN;
> +		val &= ~APPL_PINMUX_CLKREQ_OVERRIDE;
>  		appl_writel(pcie, val, APPL_PINMUX);
>  	}
>  
> -- 
> 2.17.1
> 
