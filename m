From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 07/11] arm64: tegra: Enable SDHCI controllers on P3110
Date: Wed, 8 Mar 2017 11:46:10 +0000
Message-ID: <38bcdf00-d85a-07fc-d557-bdca581eb333@nvidia.com>
References: <20170223173053.19701-1-thierry.reding@gmail.com>
 <20170223173053.19701-7-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170223173053.19701-7-thierry.reding@gmail.com>
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
> The P3110 processor module wires one of the SDHCI controllers to an on-
> board eMMC and exposes another set of SD/MMC signals on the connector to
> support an external SD/MMC card. A third controller is connected to the
> SDIO pins of an M.2 KEY E connector.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 42 ++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> index 1a9ac73b4ecb..b18e166527d8 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> @@ -7,6 +7,8 @@
>  	compatible = "nvidia,p3310", "nvidia,tegra186";
>  
>  	aliases {
> +		sdhci0 = "/sdhci@3460000";
> +		sdhci1 = "/sdhci@3400000";

Any reason why you don't include all 3 sdhci controllers here?

>  		serial0 = &uarta;
>  		i2c0 = "/bpmp/i2c";
>  		i2c1 = "/i2c@3160000";
> @@ -72,6 +74,32 @@
>  		status = "okay";
>  	};
>  
> +	/* SDMMC1 (SD/MMC) */
> +	sdhci@3400000 {
> +		status = "okay";
> +
> +		cd-gpios = <&gpio TEGRA_MAIN_GPIO(P, 6) GPIO_ACTIVE_LOW>;

I see the CD as P-5 and not P-6 on the schematic.

> +		wp-gpios = <&gpio TEGRA_MAIN_GPIO(P, 4) GPIO_ACTIVE_LOW>;
> +
> +		vqmmc-supply = <&vddio_sdmmc1>;
> +		vmmc-supply = <&vdd_sd>;

The card slot is on the carrier board and although the cd and wp pins
are allocated on the cvm, I did not see a reference to the vmmc-supply
on the cvm. So should the 'vmmc-supply' be in the carrier board file?

> +	};
> +
> +	/* SDMMC3 (SDIO) */
> +	sdhci@3440000 {
> +		status = "okay";
> +	};
> +
> +	/* SDMMC4 (eMMC) */
> +	sdhci@3460000 {
> +		status = "okay";
> +		bus-width = <8>;
> +		non-removable;
> +
> +		vqmmc-supply = <&vdd_1v8_ap>;
> +		vmmc-supply = <&vdd_3v3_sys>;
> +	};
> +
>  	hsp@3c00000 {
>  		status = "okay";
>  	};
> @@ -333,5 +361,19 @@
>  
>  			vin-supply = <&vdd_1v8>;
>  		};
> +
> +		vdd_sd: regulator@2 {
> +			compatible = "regulator-fixed";
> +			reg = <2>;
> +
> +			regulator-name = "SD_CARD_SW_PWR";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +
> +			gpio = <&gpio TEGRA_MAIN_GPIO(P, 5) GPIO_ACTIVE_HIGH>;

Here I see the gpio as P-6 and not P-5.
	
> +			enable-active-high;
> +
> +			vin-supply = <&vdd_3v3_sys>;
> +		};
>  	};
>  };

I also see the above regulator on the carrier board and not on the cvm.

Cheers
Jon

-- 
nvpublic
