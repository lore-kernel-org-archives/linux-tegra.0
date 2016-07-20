From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: allow child nodes inside the Tegra BPMP
Date: Wed, 20 Jul 2016 08:16:22 -0500
Message-ID: <20160720131622.GA20276@rob-hp-laptop>
References: <20160719191442.15439-1-swarren@wwwdotorg.org>
 <20160719191442.15439-2-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160719191442.15439-2-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 19, 2016 at 01:14:41PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The BPMP implements some services which must be represented by separate
> nodes. For example, it can provide access to certain I2C controllers, and
> the I2C bindings represent each I2C controller as a device tree node.
> Update the binding to describe how the BPMP supports this.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/firmware/nvidia,tegra186-bpmp.txt     | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
> index 9a3864f56955..142d363406f6 100644
> --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
> @@ -38,6 +38,24 @@ implemented by this node:
>  - .../reset/reset.txt
>  - <dt-bindings/reset/tegra186-reset.h>
>  
> +The BPMP implements some services which must be represented by separate nodes.
> +For example, it can provide access to certain I2C controllers, and the I2C
> +bindings represent each I2C controller as a device tree node. Such nodes should
> +be nested directly inside the main BPMP node.
> +
> +Software can determine whether a child node of the BPMP node represents a device
> +by checking for a compatible property. Any node with a compatible property
> +represents a device that can be instantiated. Nodes without a compatible
> +property may be used to provide configuration information regarding the BPMP
> +itself, although no such configuration nodes are currently defined by this
> +binding.
> +
> +The BPMP firmware defines no single global name-/numbering-space for such
> +services. Put another way, the numbering scheme for I2C buses is distinct from
> +the numbering scheme for any other service the BPMP may provide (e.g. a future
> +hypothetical SPI bus service). As such, child device nodes will have no reg
> +property, and the BPMP node will have no #address-cells or #size-cells property.
> +
>  The shared memory bindings for BPMP
>  -----------------------------------
>  
> @@ -78,4 +96,9 @@ bpmp {
>  	#clock-cells = <1>;
>  	#power-domain-cells = <1>;
>  	#reset-cells = <1>;
> +
> +	bpmp-i2c {

Just 'i2c' here. With that:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +		compatible = "...";
> +		...
> +	};
>  };
> -- 
> 2.9.2
> 
