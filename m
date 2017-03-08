From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: tegra: Enable SD/MMC slot on P2771
Date: Wed, 8 Mar 2017 14:26:39 +0000
Message-ID: <08982cb9-f642-a3c5-b630-5fecd3674090@nvidia.com>
References: <20170223173053.19701-7-thierry.reding@gmail.com>
 <20170308133944.32568-1-thierry.reding@gmail.com>
 <20170308133944.32568-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170308133944.32568-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 08/03/17 13:39, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The P3310 processor module makes provisions for exposing the SDMMC1
> controller via a standard SD/MMC slot, which the P2771 supports. Hook
> up the power supply provided on the P2771 carrier board and enable
> the device tree node.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> - new patch
> 
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> index 0d3c0996d832..b80c1c3483db 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> @@ -5,4 +5,27 @@
>  / {
>  	model = "NVIDIA Tegra186 P2771-0000 Development Board";
>  	compatible = "nvidia,p2771-0000", "nvidia,tegra186";
> +
> +	/* SDMMC1 (SD/MMC) */
> +	sdhci@3400000 {
> +		status = "okay";
> +
> +		vmmc-supply = <&vdd_sd>;
> +	};
> +
> +	regulators {
> +		vdd_sd: regulator@100 {
> +			compatible = "regulator-fixed";
> +			reg = <100>;
> +
> +			regulator-name = "SD_CARD_SW_PWR";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +
> +			gpio = <&gpio TEGRA_MAIN_GPIO(P, 6) GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +
> +			vin-supply = <&vdd_3v3_sys>;
> +		};
> +	};
>  };

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
