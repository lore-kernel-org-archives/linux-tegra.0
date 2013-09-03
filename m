From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 2/3] drm/panel: Add simple panel support
Date: Tue, 03 Sep 2013 12:52:36 -0600
Message-ID: <52262FF4.6050605@wwwdotorg.org>
References: <1377876321-26835-1-git-send-email-treding@nvidia.com> <1377876321-26835-3-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377876321-26835-3-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/30/2013 09:25 AM, Thierry Reding wrote:
> Add a driver for simple panels. Such panels can have a regulator that
> provides the supply voltage and a separate GPIO to enable the panel.
> Optionally the panels can have a backlight associated with them so it
> can be enabled or disabled according to the panel's power management
> mode.

> diff --git a/Documentation/devicetree/bindings/panel/panel-simple.txt b/Documentation/devicetree/bindings/panel/panel-simple.txt

> +Simple display panel
> +
> +Required properties:
> +- compatible: should be one of:
> +  - "auo,b101aw03": AU Optronics Corporation 10.1" WSVGA TFT LCD panel
> +  - "cptt,claa101wb03": Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
> +  - "pc,vvx10f004b00": Panasonic Corporation 10.1" WUXGA TFT LCD panel
> +
> +Optional properties:
> +- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
> +- power-supply: regulator to provide the supply voltage
> +- enable-gpios: GPIO pin to enable or disable the panel
> +- backlight: phandle of the backlight device attached to the panel

Do we need to represent the timing requirements e.g. between panel
enable and backlight enable, or do you expect the driver to hard-code
this based on the compatible value?

Looking at the driver code, it seems that it has direct knowledge of the
video mode that each panel supports, so DDC is actually optional unlike
what I asserted/assumed in my previous response. As such, I guess we
should have a separate DT binding document for each of the three panels
(compatible values) listed above that pretty much just says "go look at
simple-panel.txt".
