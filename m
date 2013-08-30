From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [RFC 2/3] drm/panel: Add simple panel support
Date: Fri, 30 Aug 2013 14:24:16 -0500
Message-ID: <60046BAF-42E8-40FB-A45D-045B7C92513E@codeaurora.org>
References: <1377876321-26835-1-git-send-email-treding@nvidia.com> <1377876321-26835-3-git-send-email-treding@nvidia.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377876321-26835-3-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Aug 30, 2013, at 10:25 AM, Thierry Reding wrote:

> Add a driver for simple panels. Such panels can have a regulator that
> provides the supply voltage and a separate GPIO to enable the panel.
> Optionally the panels can have a backlight associated with them so it
> can be enabled or disabled according to the panel's power management
> mode.
> 
> Support is added for three panels: An AU Optronics 10.1" WSVGA, a
> Chunghwa Picture Tubes 10.1" WXGA and a Panasonic 10.1 WUXGA TFT LCD
> panel.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> .../devicetree/bindings/panel/panel-simple.txt     |  25 ++
> drivers/gpu/drm/Makefile                           |   1 +
> drivers/gpu/drm/panel/Kconfig                      |  13 +
> drivers/gpu/drm/panel/Makefile                     |   1 +
> drivers/gpu/drm/panel/panel-simple.c               | 335 +++++++++++++++++++++
> 5 files changed, 375 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/panel/panel-simple.txt
> create mode 100644 drivers/gpu/drm/panel/Makefile
> create mode 100644 drivers/gpu/drm/panel/panel-simple.c
> 
> diff --git a/Documentation/devicetree/bindings/panel/panel-simple.txt b/Documentation/devicetree/bindings/panel/panel-simple.txt
> new file mode 100644
> index 0000000..dfd4b76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/panel-simple.txt
> @@ -0,0 +1,25 @@
> +Simple display panel
> +
> +Required properties:
> +- compatible: should be one of:
> +  - "auo,b101aw03": AU Optronics Corporation 10.1" WSVGA TFT LCD panel
> +  - "cptt,claa101wb03": Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
> +  - "pc,vvx10f004b00": Panasonic Corporation 10.1" WUXGA TFT LCD panel
> +

It would seem there should be a more generic compatible to cover the basic "panel-simple" case.

> +Optional properties:
> +- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
> +- power-supply: regulator to provide the supply voltage
> +- enable-gpios: GPIO pin to enable or disable the panel
> +- backlight: phandle of the backlight device attached to the panel
> +

If these are all optional, what does it mean to be a "panel-simple"?

> +Example:
> +
> +	panel: panel {
> +		compatible = "cptt,claa101wb01";
> +		ddc-i2c-bus = <&panelddc>;
> +
> +		power-supply = <&vdd_pnl_reg>;
> +		enable-gpios = <&gpio 90 0>;
> +
> +		backlight = <&backlight>;
> +	};

We'd normally do this as unique binding specs for the specific devices and a generic one to cover the concepts of a simple panel.  Who know if in the future a 'auo,b101aw03' might want some other unique properties.

[snip]

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
