From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 13/19] arm64: dts: tegra210: add DFLL clock
Date: Fri, 7 Dec 2018 14:54:13 +0000
Message-ID: <9ea7b938-32a7-5afe-b740-68a6da8ad442@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-14-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204092548.3038-14-josephl@nvidia.com>
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
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> Add essential DFLL clock properties for Tegra210.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index 2205d66b0443..a6db62157442 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -4,6 +4,7 @@
>  #include <dt-bindings/memory/tegra210-mc.h>
>  #include <dt-bindings/pinctrl/pinctrl-tegra.h>
>  #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
> +#include <dt-bindings/reset/tegra210-car.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/thermal/tegra124-soctherm.h>
>  
> @@ -1131,6 +1132,24 @@
>  		#nvidia,mipi-calibrate-cells = <1>;
>  	};
>  
> +	dfll: clock@70110000 {
> +		compatible = "nvidia,tegra210-dfll";
> +		reg = <0 0x70110000 0 0x100>, /* DFLL control */
> +		      <0 0x70110000 0 0x100>, /* I2C output control */
> +		      <0 0x70110100 0 0x100>, /* Integrated I2C controller */
> +		      <0 0x70110200 0 0x100>; /* Look-up table RAM */
> +		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&tegra_car TEGRA210_CLK_DFLL_SOC>,
> +			 <&tegra_car TEGRA210_CLK_DFLL_REF>,
> +			 <&tegra_car TEGRA210_CLK_I2C5>;
> +		clock-names = "soc", "ref", "i2c";
> +		resets = <&tegra_car TEGRA210_RST_DFLL_DVCO>;
> +		reset-names = "dvco";
> +		#clock-cells = <0>;
> +		clock-output-names = "dfllCPU_out";
> +		status = "disabled";
> +	};
> +
>  	aconnect@702c0000 {
>  		compatible = "nvidia,tegra210-aconnect";
>  		clocks = <&tegra_car TEGRA210_CLK_APE>,
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
