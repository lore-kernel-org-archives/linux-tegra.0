From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [RFC PATCH 3/3] arm64: tegra210: Add XUSB powergates
Date: Wed, 29 Jun 2016 16:30:08 +0100
Message-ID: <5773E980.7050907@nvidia.com>
References: <1467112844-26927-1-git-send-email-jonathanh@nvidia.com>
 <1467112844-26927-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467112844-26927-4-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 28/06/16 12:20, Jon Hunter wrote:
> The Tegra210 XUSB subsystem has 3 power partitions which are XUSBA
> (super-speed logic), XUSBB (USB device logic) and XUSBC (USB host
> logic). Populate the device-tree nodes for these XUSB partitions.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index 65b829b762bb..efb0fd98b789 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -670,6 +670,30 @@
>  					 <&tegra_car TEGRA210_CLK_MIPI_CAL>;
>  				#power-domain-cells = <0>;
>  			};
> +
> +			pd_xusbss: xusba {
> +				clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
> +				clock-names = "xusb_ss";
> +				resets = <&tegra_car TEGRA210_CLK_XUSB_SS>;
> +				reset-names = "xusb_ss";
> +				#power-domain-cells = <0>;
> +			};
> +
> +			pd_xusbdev: xusbb {
> +				clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>;
> +				clock-names = "xusb_dev";
> +				resets = <&tegra_car 95>;
> +				reset-names = "xusb_dev";
> +				#power-domain-cells = <0>;
> +			};
> +
> +			pd_xusbhost: xusbc {
> +				clocks = <&tegra_car TEGRA210_CLK_XUSB_HOST>;
> +				clock-names = "xusb_host";
> +				resets = <&tegra_car TEGRA210_CLK_XUSB_HOST>;
> +				reset-names = "xusb_host";
> +				#power-domain-cells = <0>;
> +			};
>  		};
>  	};

The 'clock-names' and 'reset-names' nodes are not used/required and so I
will remove these.

Jon

-- 
nvpublic
