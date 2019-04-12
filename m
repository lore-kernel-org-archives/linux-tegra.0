From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v1 3/3] ARM: dts: tegra30: Add External Memory Controller
 node
Date: Fri, 12 Apr 2019 11:01:58 +0300
Message-ID: <20190412080158.GG12975@pdeschrijver-desktop.Nvidia.com>
References: <20190411230221.31362-1-digetx@gmail.com>
 <20190411230221.31362-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190411230221.31362-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 12, 2019 at 02:02:21AM +0300, Dmitry Osipenko wrote:
> Add Add External Memory Controller node to the device-tree.
> 

One 'Add' is enough I think :)

Peter.

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra30.dtsi     | 11 +++++++++++
>  drivers/memory/tegra/tegra30-emc.c |  3 ++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
> index e074258d4518..92c4aeafab29 100644
> --- a/arch/arm/boot/dts/tegra30.dtsi
> +++ b/arch/arm/boot/dts/tegra30.dtsi
> @@ -732,6 +732,17 @@
>  		#reset-cells = <1>;
>  	};
>  
> +	memory-controller@7000f400 {
> +		compatible = "nvidia,tegra30-emc";
> +		reg = <0x7000f400 0x400>;
> +		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&tegra_car TEGRA30_CLK_EMC>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		nvidia,memory-controller = <&mc>;
> +	};
> +
>  	fuse@7000f800 {
>  		compatible = "nvidia,tegra30-efuse";
>  		reg = <0x7000f800 0x400>;
> diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
> index 38ebdb076ccd..defdb38bde54 100644
> --- a/drivers/memory/tegra/tegra30-emc.c
> +++ b/drivers/memory/tegra/tegra30-emc.c
> @@ -980,7 +980,8 @@ static long emc_round_rate(unsigned long rate,
>  	}
>  
>  	if (!timing) {
> -		dev_err(emc->dev, "no timing for rate %lu\n", rate);
> +		dev_err(emc->dev, "no timing for rate %lu min %lu max %lu\n",
> +			rate, min_rate, max_rate);
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.21.0
> 
