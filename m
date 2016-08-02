From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 4/4] arm64: tegra: Add clock and reset names for audio
 powergate
Date: Tue, 2 Aug 2016 15:18:33 +0100
Message-ID: <20160802141833.GB20134@leverpostej>
References: <1470134069-12178-1-git-send-email-jonathanh@nvidia.com>
 <1470134069-12178-5-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470134069-12178-5-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 02, 2016 at 11:34:29AM +0100, Jon Hunter wrote:
> Add the clock and reset names for the Tegra210 Audio powergate. Please
> note that these are not currently used, but added from completeness and
> to be consistent with the other powergate nodes.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> 
> We added the clock and resets names for the XUSB partitions and so I
> thought we should do the same for the Audio. Should I update the binding
> documentation to say these should be provided? Currently it does not
> state these are required. If we do update the binding doc, I was not
> entirely sure what to put in the description for these properties.
> Typically the clock and reset names would be fixed for a device, but here
> we are not using them and so there are no fixed names.

The names are there for the consumer's benefit, so if the consumer
binding doesn't require specific names, they shouldn't be in the DT.
It doesn't make sense to have names which are not fixed from the
consumer's PoV, so if anything the above is an argument for *removing*
the unnecessary and varied names from other nodes.

Thanks,
Mark.

> 
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index c4cfdcf60d26..92e987acc551 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -644,7 +644,9 @@
>  			pd_audio: aud {
>  				clocks = <&tegra_car TEGRA210_CLK_APE>,
>  					 <&tegra_car TEGRA210_CLK_APB2APE>;
> +				clock-names = "ape", "apb2ape";
>  				resets = <&tegra_car 198>;
> +				reset-names = "ape";
>  				#power-domain-cells = <0>;
>  			};
>  
> -- 
> 2.1.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
