From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 5/7] ARM: dts: imx6: add PCIe interrupt mapping properties
Date: Wed, 5 Mar 2014 13:43:35 +0800
Message-ID: <20140305054333.GF8784@S2101-09.ap.freescale.net>
References: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de>
 <1393608523-17509-6-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1393608523-17509-6-git-send-email-l.stach@pengutronix.de>
Sender: linux-sh-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-sh@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Simon Horman <horms@verge.net.au>, Kukjin Kim <kgene.kim@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Jingoo Han <jg1.han@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Tim Harvey <tharvey@gateworks.com>, Richard Zhu <r65037@freescale.com>, Arnd Bergmann <arnd@arndb.de>, kernel@pengutronix.de
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 28, 2014 at 06:28:41PM +0100, Lucas Stach wrote:
> As defined by the common PCI bindings.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx6qdl.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
> index fb28b2ecb1db..db3339e7d3a2 100644
> --- a/arch/arm/boot/dts/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> @@ -10,6 +10,8 @@
>   * http://www.gnu.org/copyleft/gpl.html
>   */
>  
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>  #include "skeleton.dtsi"
>  
>  / {
> @@ -126,7 +128,16 @@
>  				  0x81000000 0 0          0x01f80000 0 0x00010000 /* downstream I/O */
>  				  0x82000000 0 0x01000000 0x01000000 0 0x00f00000>; /* non-prefetchable memory */
>  			num-lanes = <1>;
> +

Please drop these blank lines between properties.

Shawn

>  			interrupts = <0 123 0x04>;
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> +			                <0 0 0 2 &intc GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +			                <0 0 0 3 &intc GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +			                <0 0 0 4 &intc GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +
>  			clocks = <&clks 189>, <&clks 187>, <&clks 206>, <&clks 144>;
>  			clock-names = "pcie_ref_125m", "sata_ref_100m", "lvds_gate", "pcie_axi";
>  			status = "disabled";
> -- 
> 1.8.5.3
> 

