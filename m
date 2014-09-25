From: Sjoerd Simons <sjoerd-FGvqe4uplSY@public.gmane.org>
Subject: Re: [5/5] ARM: tegra: jetson-tk1: enable GK20A GPU
Date: Thu, 25 Sep 2014 15:27:17 +0200
Message-ID: <20140925132717.GA13579@dusk.luon.net>
References: <1400491450-19223-6-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1400491450-19223-6-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Playing a bit with todays linux-next on my jetson, it seems this patch is
still required for enabling the GPU. Is there anything blocking it (firmware
not available yet in liux-firmware?)

On Mon, May 19, 2014 at 06:24:10PM +0900, Alexandre Courbot wrote:
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> index e31fb61a81d3..15a194d1277f 100644
> --- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> +++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> @@ -30,6 +30,12 @@
>  		};
>  	};
>  
> +	gpu@0,57000000 {
> +		status = "okay";
> +
> +		vdd-supply = <&vdd_gpu>;
> +	};
> +
>  	pinmux: pinmux@0,70000868 {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&state_default>;
> @@ -1505,7 +1511,7 @@
>  					regulator-always-on;
>  				};
>  
> -				sd6 {
> +				vdd_gpu: sd6 {
>  					regulator-name = "+VDD_GPU_AP";
>  					regulator-min-microvolt = <650000>;
>  					regulator-max-microvolt = <1200000>;

-- 
If you put it off long enough, it might go away.
