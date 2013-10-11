From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 26/27] drm/tegra: Add DSI support
Date: Fri, 11 Oct 2013 16:43:35 -0600
Message-ID: <52587F17.7060104@wwwdotorg.org>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-27-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-27-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 02:34 AM, Thierry Reding wrote:
> This commit adds support for both DSI outputs found on Tegra. Only very
> minimal functionality is implemented, so advanced features like ganged
> mode won't work.
> 
> Due to the lack of other test hardware, some sections of the driver are
> hardcoded to work with Dalmore.

> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c

> +static int tegra_dsi_show_regs(struct seq_file *s, void *data)
> +{
> +	struct drm_info_node *node = s->private;
> +	struct tegra_dsi *dsi = node->info_ent->data;
> +
> +#define DUMP_REG(name)						\
> +	seq_printf(s, "%-32s %#05x %08lx\n", #name, name,	\
> +		   tegra_dsi_readl(dsi, name))
> +
> +	DUMP_REG(DSI_INCR_SYNCPT);

Does it make sense to use an MMIO regmap instead? That way, you get all
the debugfs files for free...

> +static int tegra_dsi_probe(struct platform_device *pdev)

> +	dsi->clk_parent = devm_clk_get(&pdev->dev, "parent");
> +	if (IS_ERR(dsi->clk_parent))
> +		return PTR_ERR(dsi->clk_parent);
...
> +static const struct of_device_id tegra_dsi_of_match[] = {
> +	{ .compatible = "nvidia,tegra114-dsi", },

Is this DT binding documented? The clk_get() call above in particular
imposes the requirement that DT contain a clock with that name, which
should be part of the binding documentation.

Hopefully the values that this driver hard-codes won't be an issue for
the DT binding; we can simply make those values the default if
properties are missing. I assume it's likely that such a strategy will
work here?
