From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 04/10] of: Add Tegra124 EMC bindings
Date: Fri, 10 Oct 2014 14:14:17 +0100
Message-ID: <20141010131417.GA6004@leverpostej>
References: <1412945262-6068-1-git-send-email-tomeu.vizoso@collabora.com>
 <1412945262-6068-5-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412945262-6068-5-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 10, 2014 at 01:46:55PM +0100, Tomeu Vizoso wrote:
> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add binding documentation for the nvidia,tegra124-emc device tree node.
> 
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  .../bindings/memory-controllers/tegra-emc.txt      | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt b/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
> new file mode 100644
> index 0000000..6282c6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
> @@ -0,0 +1,41 @@
> +Tegra124 SoC EMC controller
> +
> +Required properties :
> +- compatible : "nvidia,tegra124-emc".
> +- reg : Should contain 1 entry:
> +  - EMC register set
> +
> +The node should contain a "timings@i" subnode for each supported RAM type
> +  (see field RAM_CODE in register PMC_STRAPPING_OPT_A)
> +Required properties for "timings@i" nodes :
> +- nvidia,ram-code : Should contain the value of RAM_CODE this timing set
> +  is used for.
> +
> +Each "timings@i" node should contain "timing@j" subnodes. One "timing@j"
> +  node should exist for each supported EMC clock rate.

What do the i and j correspond to?

> +Required properties for "timing@j" nodes :
> +- clock-frequency : Should contain the memory clock rate.
> +- nvidia,parent-clock-frequency : Should contain the rate of the EMC
> +  clock's parent clock.

Why are both of these properties necessary?

What is the relationship between the two?

> +- clocks : Must contain an entry for each entry in clock-names.
> +  See ../clocks/clock-bindings.txt for details.
> +- clock-names : Must include the following entries:
> +  - emc-parent : EMC's parent clock.

Surely the clocks are a property of the EMC, and not the individual
timings?

> +- The following properties contain EMC timing characterization values:
> +  - nvidia,emc-zcal-cnt-long
> +  - nvidia,emc-auto-cal-interval
> +  - nvidia,emc-ctt-term-ctrl
> +  - nvidia,emc-cfg
> +  - nvidia,emc-cfg-2
> +  - nvidia,emc-sel-dpd-ctrl
> +  - nvidia,emc-cfg-dig-dll
> +  - nvidia,emc-bgbias-ctl0
> +  - nvidia,emc-auto-cal-config
> +  - nvidia,emc-auto-cal-config2
> +  - nvidia,emc-auto-cal-config3
> +  - nvidia,emc-mode-reset
> +  - nvidia,emc-mode-1
> +  - nvidia,emc-mode-2
> +  - nvidia,emc-mode-4
> +- nvidia,emc-configuration : EMC timing characterization data written to
> +                             EMC registers.

I have no idea what any of these are. Perhaps these make sense, but I
cannot tell.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
