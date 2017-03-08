From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 11/11] arm64: tegra: Add GPIO expanders on P2771
Date: Wed, 8 Mar 2017 12:11:46 +0000
Message-ID: <915fd5f3-503e-0844-9058-46e1995c50b0@nvidia.com>
References: <20170223173053.19701-1-thierry.reding@gmail.com>
 <20170223173053.19701-11-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170223173053.19701-11-thierry.reding@gmail.com>
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
> The P2771 development board expands the number of GPIOs via two I2C
> chips.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> index 9485841e3351..eac75764bf3c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> @@ -18,6 +18,28 @@
>  			compatible = "ti,ina3221";
>  			reg = <0x43>;
>  		};
> +
> +		exp1: gpio@74 {
> +			compatible = "ti,tca9539";
> +			reg = <0x74>;
> +
> +			interrupt-parent = <&gpio>;
> +			interrupts = <TEGRA_MAIN_GPIO(Y, 0) GPIO_ACTIVE_LOW>;
> +
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +		};
> +
> +		exp2: gpio@77 {
> +			compatible = "ti,tca9539";
> +			reg = <0x77>;
> +
> +			interrupt-parent = <&gpio>;
> +			interrupts = <TEGRA_MAIN_GPIO(Y, 6) GPIO_ACTIVE_LOW>;
> +
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +		};
>  	};
>  
>  	gpio-keys {
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
