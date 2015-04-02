From: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Correct which USB controller has the UTMI
 pad registers
Date: Thu, 02 Apr 2015 17:53:20 +0300
Message-ID: <551D57E0.7050102@kapsi.fi>
References: <1427985119-15307-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427985119-15307-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Have you checked that this patch applies correctly, considering that the 
chunks are still ambiguous? :)

Mikko

On 04/02/2015 05:31 PM, Tomeu Vizoso wrote:
> It should be the first controller, not the second.
>
> This broke USB after 6261b06 ("regulator: Defer lookup of supply to
> regulator_get"), because it changed the order in which the controllers
> were probed.
>
> The fix for this issue was suggested by Mikko Perttunen.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Cc: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
> ---
>   arch/arm/boot/dts/tegra124.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
> index cf01c81..cb786a9 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -838,6 +838,7 @@
>   		nvidia,hssquelch-level = <2>;
>   		nvidia,hsdiscon-level = <5>;
>   		nvidia,xcvr-hsslew = <12>;
> +		nvidia,has-utmi-pad-registers;
>   		status = "disabled";
>   	};
>
> @@ -874,7 +875,6 @@
>   		nvidia,hssquelch-level = <2>;
>   		nvidia,hsdiscon-level = <5>;
>   		nvidia,xcvr-hsslew = <12>;
> -		nvidia,has-utmi-pad-registers;
>   		status = "disabled";
>   	};
>
>
