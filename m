From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 2/2] arm64: tegra: enable ACONNECT, ADMA and AGIC
Date: Tue, 4 Jun 2019 10:08:50 +0100
Message-ID: <d503728b-e689-f3bf-c620-f911bef31339@nvidia.com>
References: <1557143908-5850-1-git-send-email-spujar@nvidia.com>
 <1557143908-5850-2-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557143908-5850-2-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 06/05/2019 12:58, Sameer Pujar wrote:
> Enable ACONNECT, ADMA and AGIC devices for following platforms
>   * Jetson TX2
>   * Jetson Xavier
> 
> Verified driver probe path and devices get registered fine.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 12 ++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 12 ++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> index 31457f3..21e73db 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> @@ -183,4 +183,16 @@
>  			vin-supply = <&vdd_5v0_sys>;
>  		};
>  	};
> +
> +	aconnect@2a41000 {
> +		status = "okay";
> +
> +		dma@2930000 {
> +			status = "okay";
> +		};
> +
> +		agic@2a41000 {
> +			status = "okay";
> +		};
> +	};
>  };
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> index b62e969..bca28fc 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> @@ -169,4 +169,16 @@
>  			};
>  		};
>  	};
> +
> +	aconnect@2a41000 {
> +		status = "okay";
> +
> +		dma@2930000 {
> +			status = "okay";
> +		};
> +
> +		agic@2a41000 {
> +			status = "okay";
> +		};
> +	};
>  };

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
