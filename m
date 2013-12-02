From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Add MIPI pad calibration DT bindings
Date: Mon, 2 Dec 2013 11:38:59 -0600
Message-ID: <3F910C9B-7205-4FC3-A75E-269277ACB513@codeaurora.org>
References: <1385990934-20809-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385990934-20809-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Dec 2, 2013, at 7:28 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Introduce device tree bindings for the MIPI pad calibration controller
> found on Tegra SoCs. The controller can be used to perform calibration
> of pads used for DSI and CSI peripherals.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> .../bindings/misc/nvidia,tegra114-mipi.txt         | 37 ++++++++++++++++++++++

Should this just be nvidia,tegra-mipi.txt (as you have it supported for tegra<chip>)?

> 1 file changed, 37 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt

Is this really pad control or pin?  I ask as its rare to see pad control.

> 
> diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt
> new file mode 100644
> index 000000000000..beb75ec7f6fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt
> @@ -0,0 +1,37 @@
> +NVIDIA Tegra MIPI pad calibration controller
> +
> +Required properties:
> +- compatible: "nvidia,tegra<chip>-mipi"
> +- reg: Physical base address and length of the controller's registers.
> +- clocks: The clock consumed by the controller.
> +- #nvidia,mipi-calibrate-cells: Should be 1. The cell is a bitmask of the pads
> +  that need to be calibrated for a given device.

Is there a case that this would not be set to 1?  If so, why bother with the property right now?  One would assume for a non-1 case a new compatible will be required anyways.

> +
> +User nodes need to contain an nvidia,mipi-calibrate property that has a
> +phandle to refer to the calibration controller node and a bitmask of the pads
> +that need to be calibrated.
> +
> +Example:
> +
> +	mipi: mipi@700e3000 {
> +		compatible = "nvidia,tegra114-mipi";
> +		reg = <0x700e3000 0x100>;
> +		clocks = <&tegra_car TEGRA114_CLK_MIPI_CAL>;
> +		#nvidia,mipi-calibrate-cells = <1>;
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
> +			nvidia,mipi-calibrate = <&mipi 0x060>;
> +
> +			...
> +		};
> +
> +		...
> +	};
> -- 
> 1.8.4.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
