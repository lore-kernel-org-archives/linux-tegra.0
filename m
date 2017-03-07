From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 05/11] arm64: tegra: Enable ethernet on P3310
Date: Tue, 7 Mar 2017 21:04:00 +0000
Message-ID: <9974a9ad-d4ce-88c7-e448-911f306ef961@nvidia.com>
References: <20170223173053.19701-1-thierry.reding@gmail.com>
 <20170223173053.19701-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170223173053.19701-5-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 23/02/17 17:30, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The P3310 processor module provides networking via the ethernet
> controller found on NVIDIA Tegra186 SoCs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> index 762f4756346c..ffbb4be5122e 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> @@ -26,6 +26,26 @@
>  		reg = <0x0 0x80000000 0x2 0x00000000>;
>  	};
>  
> +	ethernet@2490000 {
> +		status = "okay";
> +
> +		phy-reset-gpios = <&gpio TEGRA_MAIN_GPIO(M, 4) GPIO_ACTIVE_LOW>;
> +		phy-handle = <&phy>;
> +		phy-mode = "rgmii";
> +
> +		mdio {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			phy: phy@0 {
> +				compatible = "ethernet-phy-ieee802.3-c22";
> +				reg = <0x0>;
> +				interrupt-parent = <&gpio>;
> +				interrupts = <TEGRA_MAIN_GPIO(M, 5) IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +	};
> +
>  	serial@3100000 {
>  		status = "okay";
>  	};

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
