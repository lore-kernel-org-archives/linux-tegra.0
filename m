From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: nyan: Use proper IRQ type definitions
Date: Tue, 20 Sep 2016 18:15:02 +0100
Message-ID: <ef69b6d2-ce6b-ff76-5c04-ab2176eb6ecc@nvidia.com>
References: <20160828173246.32621-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160828173246.32621-1-contact-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 28/08/16 18:32, Paul Kocialkowski wrote:
> This switches a few interrupt definitions that were using
> GPIO_ACTIVE_HIGH as IRQ type, which is invalid.

May be you are right, but this does not describe why this is invalid.
Can you elaborate?

> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-nyan.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
> index 271505e..30a77ec 100644
> --- a/arch/arm/boot/dts/tegra124-nyan.dtsi
> +++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
> @@ -59,7 +59,7 @@
>  			compatible = "maxim,max98090";
>  			reg = <0x10>;
>  			interrupt-parent = <&gpio>;
> -			interrupts = <TEGRA_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
> +			interrupts = <TEGRA_GPIO(H, 4) IRQ_TYPE_EDGE_FALLING>;

If this in invalid then the DT binding doc for the max98090 should be
updated as well.

>  		};
>  
>  		temperature-sensor@4c {
> @@ -325,7 +325,7 @@
>  					reg = <0x9>;
>  					interrupt-parent = <&gpio>;
>  					interrupts = <TEGRA_GPIO(J, 0)
> -							GPIO_ACTIVE_HIGH>;
> +							IRQ_TYPE_EDGE_BOTH>;
>  					ti,ac-detect-gpios = <&gpio
>  							TEGRA_GPIO(J, 0)
>  							GPIO_ACTIVE_HIGH>;
> 

Cheers
Jon

-- 
nvpublic
