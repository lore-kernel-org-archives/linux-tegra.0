From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 22/27] drm/panel: Add simple panel support
Date: Fri, 11 Oct 2013 16:33:33 -0600
Message-ID: <52587CBD.8010304@wwwdotorg.org>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-23-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-23-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 02:34 AM, Thierry Reding wrote:
> Add a driver for simple panels. Such panels can have a regulator that
> provides the supply voltage and a separate GPIO to enable the panel.
> Optionally the panels can have a backlight associated with them so it
> can be enabled or disabled according to the panel's power management
> mode.
> 
> Support is added for three panels: An AU Optronics 10.1" WSVGA, a
> Chunghwa Picture Tubes 10.1" WXGA and a Panasonic 10.1 WUXGA TFT LCD
> panel.

>  .../devicetree/bindings/panel/auo,b101aw03.txt     |   7 +
>  .../bindings/panel/chunghwa,claa101wb03.txt        |   7 +
>  .../bindings/panel/panasonic,vvx10f004b00.txt      |   7 +
>  .../devicetree/bindings/panel/simple-panel.txt     |  21 ++

Since this patch defines new DT bindings, it should also be sent to the
DT binding maintainers and DT mailing list.

> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c

> +static int panel_simple_remove(struct platform_device *pdev)
> +{
> +	struct panel_simple *panel = platform_get_drvdata(pdev);
> +
> +	if (gpio_is_valid(panel->enable_gpio)) {
> +		if (panel->enable_gpio_flags & GPIO_ACTIVE_LOW)
> +			gpio_set_value(panel->enable_gpio, 1);
> +		else
> +			gpio_set_value(panel->enable_gpio, 0);
> +
> +		gpio_free(panel->enable_gpio);
> +	}
> +
> +	regulator_disable(panel->supply);

Can you just call panel_simple_disable() to do the HW cleanup, and just
do resource cleanup here?
