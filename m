From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/3] dt: tegra20: Add ehci host controller nodes.
Date: Tue, 19 Jul 2011 16:00:11 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049EBDED27@HQMAIL01.nvidia.com>
References: <1311115617-9697-1-git-send-email-achew@nvidia.com>
 <1311115617-9697-2-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1311115617-9697-2-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rkle>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org wrote at Tuesday, July 19, 2011 4:47 PM:
> From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> These values were derived from various headers in arch/arm/mach-tegra.
> 
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20.dtsi |   52 ++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 52 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index 83fedf3..a0353bb 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -160,5 +160,57 @@
>  		interrupts = < 63 >;
>  		status = "disabled";
>  	};
> +
> +	ehci@c5000000 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;

I don't think those two properties are needed for an EHCI node; children
of the EHCI controller are probed rather than specified in device tree.

> +		compatible = "nvidia,tegra20-ehci";
> +		reg = <0xc5000000 0x4000>;
> +		interrupts = < 52 >;
> +		mode = < 1 >;

Should we make mode a string; device, host, or otg?

> +		power_down_on_bus_suspend;
> +		type = "utmi";
> +		hssync_start_delay = < 0 >;
> +		idle_wait_delay = < 17 >;
> +		elastic_limit = < 16 >;
> +		term_range_adj = < 6 >;
> +		xcvr_setup = < 15 >;
> +		xcvr_lsfslew = < 2 >;
> +		xcvr_lsrslew = < 2 >;
> +		status = "disabled";

In the latest devicetree/test, tegra20.dtsi doesn't specify status for
any nodes, but leaves everything enabled. Instead, board-specific files
disable any unused devices.

> +	};
> +
> +	ehci@c5004000 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "nvidia,tegra20-ehci";
> +		reg = <0xc5004000 0x4000>;
> +		interrupts = < 53 >;
> +		mode = < 1 >;
> +		power_down_on_bus_suspend;
> +		type = "ulpi";
> +		reset_gpio = < 169 >;
> +		clk = "cdev2";
> +		status = "disabled";
> +	};
> +
> +	ehci@c5008000 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "nvidia,tegra20-ehci";
> +		reg = <0xc5008000 0x4000>;
> +		interrupts = < 129 >;
> +		mode = < 1 >;
> +		power_down_on_bus_suspend;
> +		type = "utmi";
> +		hssync_start_delay = < 0 >;
> +		idle_wait_delay = < 17 >;
> +		elastic_limit = < 16 >;
> +		term_range_adj = < 6 >;
> +		xcvr_setup = < 8 >;
> +		xcvr_lsfslew = < 2 >;
> +		xcvr_lsrslew = < 2 >;
> +		status = "disabled";
> +	};
>  };
> 
> --
> 1.7.6

-- 
nvpublic
