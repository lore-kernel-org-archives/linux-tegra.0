From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add DT binding for Tegra186 BPMP I2C
Date: Sat, 16 Jul 2016 16:07:28 -0500
Message-ID: <20160716210728.GA22144@rob-hp-laptop>
References: <20160707193711.5891-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160707193711.5891-1-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 07, 2016 at 01:37:11PM -0600, Stephen Warren wrote:
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
>  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt      | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> new file mode 100644
> index 000000000000..eb9f70723ab7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> @@ -0,0 +1,35 @@
> +NVIDIA Tegra186 BPMP I2C controller
> +
> +In Tegra186, the BPMP (Boot and Power Management Processor) owns certain HW
> +devices, such as the I2C controller for the power management I2C bus. Software
> +running on other CPUs must perform IPC to the BPMP in order to execute
> +transactions on that I2C bus. This binding describes an I2C bus that is
> +accessed in such a fashion.
> +
> +Required properties:
> +- compatible:
> +    Array of strings.
> +    One of:
> +    - "nvidia,tegra186-bpmp-i2c".
> +- address-cells: Address cells for I2C device address.
> +    Single-cell integer.
> +    Must be <1>.
> +- size-cells:
> +    Single-cell integer.
> +    Must be <0>.
> +- nvidia,bpmp:
> +    The phandle to the BPMP device.

Any reason to not make this a sub-node of the BPMP device?
