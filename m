From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: tegra: Remove 0, prefix from
 unit-addresses
Date: Tue, 19 Apr 2016 17:24:02 -0500
Message-ID: <20160419222402.GA31786@rob-hp-laptop>
References: <1460473656-27209-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460473656-27209-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 12, 2016 at 05:07:35PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> When Tegra124 support was first merged the unit-addresses of all devices
> were listed with a "0," prefix to encode the reg property's second cell.
> It turns out that this notation is not correct, and the "," separator is
> only used to separate fields in the unit address (such as the device and
> function number in PCI devices), not individual cells for addresses
> with more than one cell.
> 
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt    | 2 +-
>  Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt              | 2 +-
>  .../devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt      | 6 +++---
>  Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt  | 4 ++--
>  .../devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt     | 6 +++---
>  Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt      | 2 +-
>  Documentation/devicetree/bindings/thermal/tegra-soctherm.txt        | 2 +-
>  7 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> index ee7e5fd4a50b..63f9d8277d48 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> @@ -50,7 +50,7 @@ Required properties for I2C mode:
>  
>  Example:
>  
> -clock@0,70110000 {
> +clock@70110000 {
>          compatible = "nvidia,tegra124-dfll";
>          reg = <0 0x70110000 0 0x100>, /* DFLL control */
>                <0 0x70110000 0 0x100>, /* I2C output control */
> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
> index 23bfe8e1f7cc..9d47a2c25e2d 100644
> --- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
> +++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
> @@ -26,7 +26,7 @@ Required properties:
>  
>  Example:
>  
> -	gpu@0,57000000 {
> +	gpu@57000000 {
>  		compatible = "nvidia,gk20a";
>  		reg = <0x0 0x57000000 0x0 0x01000000>,
>  		      <0x0 0x58000000 0x0 0x01000000>;
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt
> index 3338a2834ad7..8dbe47013c2b 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt
> @@ -61,7 +61,7 @@ specified, according to the board documentation:
>  Example SoC include file:
>  
>  / {
> -	mc: memory-controller@0,70019000 {
> +	mc: memory-controller@70019000 {
>  		compatible = "nvidia,tegra124-mc";
>  		reg = <0x0 0x70019000 0x0 0x1000>;
>  		clocks = <&tegra_car TEGRA124_CLK_MC>;
> @@ -72,7 +72,7 @@ Example SoC include file:
>  		#iommu-cells = <1>;
>  	};
>  
> -	sdhci@0,700b0000 {
> +	sdhci@700b0000 {
>  		compatible = "nvidia,tegra124-sdhci";
>  		...
>  		iommus = <&mc TEGRA_SWGROUP_SDMMC1A>;
> @@ -82,7 +82,7 @@ Example SoC include file:
>  Example board file:
>  
>  / {
> -	memory-controller@0,70019000 {
> +	memory-controller@70019000 {
>  		emc-timings-3 {
>  			nvidia,ram-code = <3>;
>  
> diff --git a/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt b/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
> index b59c625d6336..ba0bc3f12419 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
> @@ -190,7 +190,7 @@ be specified, according to the board documentation:
>  Example SoC include file:
>  
>  / {
> -	emc@0,7001b000 {
> +	emc@7001b000 {
>  		compatible = "nvidia,tegra124-emc";
>  		reg = <0x0 0x7001b000 0x0 0x1000>;
>  
> @@ -201,7 +201,7 @@ Example SoC include file:
>  Example board file:
>  
>  / {
> -	emc@0,7001b000 {
> +	emc@7001b000 {
>  		emc-timings-3 {
>  			nvidia,ram-code = <3>;
>  
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
> index 30676ded85bb..9c8ddd547a99 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
> @@ -79,7 +79,7 @@ Example:
>  SoC file extract:
>  -----------------
>  
> -	padctl@0,7009f000 {
> +	padctl@7009f000 {
>  		compatible = "nvidia,tegra124-xusb-padctl";
>  		reg = <0x0 0x7009f000 0x0 0x1000>;
>  		resets = <&tegra_car 142>;
> @@ -91,7 +91,7 @@ SoC file extract:
>  Board file extract:
>  -------------------
>  
> -	pcie-controller@0,01003000 {
> +	pcie-controller@01003000 {
>  		...
>  
>  		phys = <&padctl 0>;
> @@ -102,7 +102,7 @@ Board file extract:
>  
>  	...
>  
> -	padctl: padctl@0,7009f000 {
> +	padctl: padctl@7009f000 {
>  		pinctrl-0 = <&padctl_default>;
>  		pinctrl-names = "default";
>  
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
> index 275c6ea356f6..44d27456e8a4 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
> @@ -15,7 +15,7 @@ Required properties:
>  
>  Example:
>  
> -hda@0,70030000 {
> +hda@70030000 {
>  	compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
>  	reg = <0x0 0x70030000 0x0 0x10000>;
>  	interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
> index 351a7376baa8..edebfa0a985e 100644
> --- a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
> +++ b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
> @@ -33,7 +33,7 @@ than it, the system will be shutdown or reset by hardware.
>  
>  Example :
>  
> -	soctherm@0,700e2000 {
> +	soctherm@700e2000 {
>  		compatible = "nvidia,tegra124-soctherm";
>  		reg = <0x0 0x700e2000 0x0 0x1000>;
>  		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 2.8.0
> 
