From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 05/13] of: Document timings subnode of nvidia,tegra-mc
Date: Thu, 6 Nov 2014 17:12:27 +0900
Message-ID: <545B2D6B.9030001@nvidia.com>
References: <1414599796-30597-1-git-send-email-tomeu.vizoso@collabora.com> <1414599796-30597-6-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414599796-30597-6-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/30/2014 01:22 AM, Tomeu Vizoso wrote:
> The MC driver needs some timing-specific information to program the EMEM during
> a rate change of the EMC clock.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>   .../memory-controllers/nvidia,tegra-mc.txt         | 46 +++++++++++++++++++++-
>   1 file changed, 44 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt
> index f3db93c..8467b8c 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt
> @@ -15,9 +15,26 @@ Required properties:
>   This device implements an IOMMU that complies with the generic IOMMU binding.
>   See ../iommu/iommu.txt for details.
>
> -Example:
> ---------
> +The node should contain a "timings" subnode for each supported RAM type (see
> +field RAM_CODE in register PMC_STRAPPING_OPT_A), with its unit address being its
> +RAM_CODE.
>
> +Required properties for "timings" nodes :
> +- nvidia,ram-code : Should contain the value of RAM_CODE this timing set is used
> +for.
> +
> +Each "timings" node should contain a "timing" subnode for every supported EMC
> +clock rate. The "timing" subnodes should have the clock rate in Hz as their unit
> +address.

In patch 04, a similar sub-node is named "emc-timings". Shouldn't the 
same name be used here for consistency?

Also, it seems like there is a need for timing nodes in the MC to have 
match timing nodes in the CAR. It would be nice to add that information 
in all related bindings files.

> +
> +Required properties for "timing" nodes :
> +- clock-frequency : Should contain the memory clock rate in Hz.
> +- nvidia,emem-configuration : Values to be written to the EMEM register block,
> +as specified by the board documentation.

Could you add some more information about which range of registers we 
are talking about, and whether they must all be specified or only part 
of them?

> +
> +Example SoC include file:
> +
> +/ {
>   	mc: memory-controller@0,70019000 {
>   		compatible = "nvidia,tegra124-mc";
>   		reg = <0x0 0x70019000 0x0 0x1000>;
> @@ -34,3 +51,28 @@ Example:
>   		...
>   		iommus = <&mc TEGRA_SWGROUP_SDMMC1A>;
>   	};
> +};
> +
> +Example board file:
> +
> +/ {
> +	memory-controller@0,70019000 {
> +		timings@3 {
> +			nvidia,ram-code = <3>;
> +
> +			timing@12750000 {
> +				clock-frequency = <12750000>;
> +
> +				nvidia,emem-configuration = <
> +					0x40040001 /* MC_EMEM_ARB_CFG */
> +					0x8000000a /* MC_EMEM_ARB_OUTSTANDING_REQ */
> +					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
> +					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
> +					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
> +					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
> +					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
> +				>;

Looking at the actual board files I suppose this example here is 
incomplete. It would be nice to make this explicit, maybe by adding 
"..." on a new line to indicate more registers are expected.
