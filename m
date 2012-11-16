From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: paz00: Add host1x support
Date: Fri, 16 Nov 2012 15:36:04 -0700
Message-ID: <50A6BFD4.5060802@wwwdotorg.org>
References: <ae44d3c1f4ceecb0f6a486d569608eec3c892ba1.1353104179.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ae44d3c1f4ceecb0f6a486d569608eec3c892ba1.1353104179.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/16/2012 03:20 PM, Marc Dietrich wrote:
> This adds host1x support which includes HDMI and LVDS support.

> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts

> +	host1x {

The position of this node in tegra20-paz00.dts doesn't match the order
from tegra20.dtsi.

> +		dc@54200000 {
> +			rgb {
> +				status = "okay";
> +				nvidia,ddc-i2c-bus = <&lvds_ddc>;
> +			};
> +		};
> +
> +		hdmi {
> +			status = "okay";
> +			vdd-supply = <&hdmi_vdd_reg>;
> +			pll-supply = <&hdmi_pll_reg>;
> +			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
> +			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> +		};

I think we shouldn't enable HDMI on Paz00 yet; tegradrm has an issue
where if two outputs are active, with different display timings (which
is almost guaranteed), both outputs send the wrong signal timing. The
easiest WAR for now is to only enable one output per board.
