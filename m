From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Add MIPI pad calibration support
Date: Wed, 16 Oct 2013 12:22:18 -0600
Message-ID: <525ED95A.4060407@wwwdotorg.org>
References: <1381944997-30671-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381944997-30671-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/16/2013 11:36 AM, Thierry Reding wrote:
> This driver adds support to perform calibration of the MIPI pads for CSI
> and DSI.

This binding looks conceptually OK to me. I have one non-semantic
comment about the property names below though.

I would like one of the DT bindings maintainers to ack/review it though.

> diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt
> new file mode 100644
> index 0000000..642c5d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt
> @@ -0,0 +1,37 @@
> +NVIDIA Tegra MIPI pad calibration controller
> +
> +Required properties:
> +- compatible: "nvidia,tegra<chip>-mipi"
> +- reg: Physical base address and length of the controller's registers.
> +- clocks: The clock consumed by the controller.
> +- #calibrate-cells: Should be 1. The cell is a bitmask of the pads that need
> +  to be calibrated by a given device.
> +
> +User nodes need to contain a calibrate property that has a phandle to refer
> +to the calibration controller node and a bitmask of the pads that need to be
> +calibrated.

#gpio-cells is a generic property that applies to any GPIO user, and
hence has a generic name. #calibrate-cells here doesn't fall into the
same class; it's something very specific to this individual binding. Do
we need a more unique property name, such as
#nvidia,mipi-calibrate-cells, and equally for the consumer to use
nvidia,mipi-calibrate as the property that references the MIPI device,
rather than the generic-sounding "calibrate"?

> +Example:
> +
> +	mipi: mipi@700e3000 {
> +		compatible = "nvidia,tegra114-mipi";
> +		reg = <0x700e3000 0x100>;
> +		clocks = <&tegra_car TEGRA114_CLK_MIPI_CAL>;
> +		#calibrate-cells = <1>;
> +	};
> +
> +	...
> +
> +	host1x@50000000 {
> +		...
> +
> +		dsi@54300000 {
> +			...
> +
> +			calibrate = <&mipi 0x060>;
> +
> +			...
> +		};
> +
> +		...
> +	};
