From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [RFC 9/9] dts: tegra: WIP: hack dts to test new dt flags for i2c
Date: Mon, 20 Jul 2015 10:53:09 +0300
Message-ID: <3764937.mMMXIHUnrR@avalon>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de> <1437142109-31975-10-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437142109-31975-10-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Wolfram,

Thank you for the patch.

On Friday 17 July 2015 16:08:29 Wolfram Sang wrote:
> Not-Signed-off-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> b/arch/arm/boot/dts/tegra124-jetson-tk1.dts index
> bd43ed6d6ec7c0..4d5f2a4c4da1ce 100644
> --- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> +++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> @@ -1,5 +1,6 @@
>  /dts-v1/;
> 
> +#include <dt-bindings/i2c/i2c.h>
>  #include <dt-bindings/input/input.h>
>  #include "tegra124.dtsi"
> 
> @@ -1390,6 +1391,12 @@
>  			reg = <0x56>;
>  			pagesize = <8>;
>  		};
> +
> +		eeprom@42 {
> +			compatible = "linux,slave-24c02";
> +			//FIXME: Should be I2C_OWN_SLAVE_ADDRESS | 0x42
> +			reg = <0xc0000042>;

The node name doesn't match the reg property anymore. Isn't that considered as 
a problem ?

> +		};
>  	};
> 
>  	/* Expansion GEN2_I2C_* */

-- 
Regards,

Laurent Pinchart
