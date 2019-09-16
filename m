From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [Patch V9 6/8] arm64: tegra: Enable xudc on Jetson TX1
Date: Mon, 16 Sep 2019 15:12:59 +0800
Message-ID: <1568617979.7317.76.camel@mhfsdcap03>
References: <1568354873-24073-1-git-send-email-nkristam@nvidia.com>
         <1568354873-24073-7-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568354873-24073-7-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 2019-09-13 at 11:37 +0530, Nagarjuna Kristam wrote:
> Enable XUSB device mode driver for USB0 slot on Jetson TX1.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Reviewed-by: JC Kuo <jckuo@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 31 +++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> index a7dc319..c1e106e 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> @@ -1362,7 +1362,7 @@
>  				status = "okay";
>  
>  				lanes {
> -					usb2-0 {
> +					micro_b: usb2-0 {
>  						nvidia,function = "xusb";
>  						status = "okay";
>  					};
> @@ -1483,6 +1483,21 @@
>  		vmmc-supply = <&vdd_3v3_sd>;
>  	};
>  
> +	usb@700d0000 {
> +		status = "okay";
> +		phys = <&micro_b>;
> +		phy-names = "usb2";
> +		avddio-usb-supply = <&vdd_3v3_sys>;
> +		hvdd-usb-supply = <&vdd_1v8>;
> +		usb-role-switch;
> +
> +		port {
> +			usb_role_switch: endpoint {
> +				remote-endpoint = <&usb_b_conn_ep>;
> +			};
> +		};
> +	};
> +
>  	regulators {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> @@ -1641,4 +1656,18 @@
>  			linux,code = <KEY_VOLUMEUP>;
>  		};
>  	};
> +
> +	usb_type_b: connector {
> +		compatible = "linux,usb-b-connector", "gpio-usb-b-connector";
use standard compatible "usb-b-connector" instead of
"linux,usb-b-connector"

> +		label = "micro-USB";
> +		type = "micro";
> +		vbus-gpio = <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			usb_b_conn_ep: endpoint {
> +				remote-endpoint = <&usb_role_switch>;
> +			};
> +		};
> +	};
> +
>  };
