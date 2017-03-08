From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 10/11] arm64: tegra: Add power monitors on P2771
Date: Wed, 8 Mar 2017 12:06:31 +0000
Message-ID: <cf553179-11e8-680a-cff0-b52c3a598d56@nvidia.com>
References: <20170223173053.19701-1-thierry.reding@gmail.com>
 <20170223173053.19701-10-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170223173053.19701-10-thierry.reding@gmail.com>
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
> The P2771 development board comes with two power monitors that can be
> used to determine power consumption in different parts of the board.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> index 1c195d71806d..9485841e3351 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> @@ -8,6 +8,18 @@
>  	model = "NVIDIA Tegra186 P2771-0000 Development Board";
>  	compatible = "nvidia,p2771-0000", "nvidia,tegra186";
>  
> +	i2c@3160000 {
> +		power-monitor@42 {
> +			compatible = "ti,ina3221";
> +			reg = <0x42>;
> +		};
> +
> +		power-monitor@43 {
> +			compatible = "ti,ina3221";
> +			reg = <0x43>;
> +		};
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
