From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] dt-bindings: add Tegra186 BPMP I2C binding
Date: Tue, 26 Jul 2016 11:03:13 +0100
Message-ID: <b088284b-e87e-0da5-59a8-0b039b06fcad@nvidia.com>
References: <20160719191442.15439-1-swarren@wwwdotorg.org>
 <20160719191442.15439-3-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160719191442.15439-3-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 19/07/16 20:14, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> In Tegra186, the BPMP (Boot and Power Management Processor) owns certain
> HW devices, such as the I2C controller for the power management I2C bus.
> Software running on other CPUs must perform IPC to the BPMP in order to
> execute transactions on that I2C bus. This binding describes an I2C bus
> that is accessed in such a fashion.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt      | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> new file mode 100644
> index 000000000000..fecb549bc250
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> @@ -0,0 +1,42 @@
> +NVIDIA Tegra186 BPMP I2C controller
> +
> +In Tegra186, the BPMP (Boot and Power Management Processor) owns certain HW
> +devices, such as the I2C controller for the power management I2C bus. Software
> +running on other CPUs must perform IPC to the BPMP in order to execute
> +transactions on that I2C bus. This binding describes an I2C bus that is
> +accessed in such a fashion.
> +
> +The BPMP I2C node must be located directly inside the main BPMP node. See
> +../firmware/nvidia,tegra186-bpmp.txt for details of the BPMP binding.
> +
> +This node represents an I2C controller. See ../i2c/i2c.txt for details of the
> +core I2C binding.
> +
> +Required properties:
> +- compatible:
> +    Array of strings.
> +    One of:
> +    - "nvidia,tegra186-bpmp-i2c".
> +- #address-cells: Address cells for I2C device address.
> +    Single-cell integer.
> +    Must be <1>.
> +- #size-cells:
> +    Single-cell integer.
> +    Must be <0>.
> +- nvidia,bpmp-bus-id:
> +    Single-cell integer.
> +    Indicates the I2C bus number this DT node represent, as defined by the
> +    BPMP firmware.
> +
> +Example:
> +
> +/ bpmp {

Is this "/" intentional?

> +	...
> +
> +	bpmp-i2c {
> +		compatible = "nvidia,tegra186-bpmp-i2c";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		nvidia,bpmp-bus-id = <5>;
> +	};
> +};
> 

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Jon

-- 
nvpublic
