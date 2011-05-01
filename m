From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: Tegra: Seaboard: Add devicetree support
Date: Sun, 1 May 2011 07:38:25 -0700
Message-ID: <20110501143825.GB19918@quad.lixom.net>
References: <1304136751-11629-1-git-send-email-swarren@nvidia.com>
 <1304136751-11629-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1304136751-11629-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Fri, Apr 29, 2011 at 10:12:31PM -0600, Stephen Warren wrote:
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra-seaboard.dts |   33 +++++++++++++++++++++++++++++++++
>  arch/arm/mach-tegra/Makefile.boot    |    1 +
>  2 files changed, 34 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/boot/dts/tegra-seaboard.dts
> 
> diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
> new file mode 100644
> index 0000000..d5c9ad7
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra-seaboard.dts
> @@ -0,0 +1,33 @@
> +/dts-v1/;
> +/include/ "tegra250.dts"
> +
> +/ {
> +	model = "NVIDIA Harmony";

NVIDIA Seaboard?

> +	compatible = "nvidia,seaboard", "nvidia,tegra250";
> +
> +	chosen {
> +		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk1p3 rw rootdelay=2";

I'm partial to rootwait instead of rootdelay, a little less fragile for slow
devices.

> +	memory {
> +		device_type = "memory";
> +		reg = < 0x00000000 0x1C000000
> +		        0x20000000 0x20000000 >;
> +	};

I guess a node for the graphics memory could be warranted

> +
> +	serial@70006300 {
> +		status = "ok";
> +		clock-frequency = < 216000000 >;
> +	};
> +
> +	sdhci@c8000400 {
> +		status = "ok";
> +		gpios = <&gpio 69 0>, /* cd, gpio PI5 */
> +			<&gpio 57 0>, /* wp, gpio PH1 */
> +			<&gpio 70 0>; /* power, gpio PI6 */

How would you represent just one missing gpio here? It might be better
to have separate properties for each.

Also, it'd be nice to document these assumptions where other device tree
bindings are (Documentation/devicetree/bindings).


-Olof
