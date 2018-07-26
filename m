From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 13/26] ARM: tegra: colibri_t30: use proper irq-gpio for
 stmpe811
Date: Thu, 26 Jul 2018 10:07:09 +0200
Message-ID: <844bac7c4e00a014f5e5b857e38a47bf@agner.ch>
References: <20180723123658.980-1-marcel@ziswiler.com>
 <20180723123658.980-14-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723123658.980-14-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 23.07.2018 14:36, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Use proper irq-gpio for stmpe811 touch controller.

I don't think this change is necessary, interrupts/interrupt-parent
specification seems to be supported by the driver as well.

--
Stefan

> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
>  arch/arm/boot/dts/tegra30-colibri.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi
> b/arch/arm/boot/dts/tegra30-colibri.dtsi
> index c80b9bf44752..ace72a53186a 100644
> --- a/arch/arm/boot/dts/tegra30-colibri.dtsi
> +++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
> @@ -836,8 +836,7 @@
>  		stmpe811@41 {
>  			compatible = "st,stmpe811";
>  			reg = <0x41>;
> -			interrupts = <TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;
> -			interrupt-parent = <&gpio>;
> +			irq-gpio = <&gpio TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;
>  			interrupt-controller;
>  			id = <0>;
>  			blocks = <0x5>;
