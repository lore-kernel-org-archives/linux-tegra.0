From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2] clk: Add composite clock type
Date: Tue, 05 Feb 2013 11:38:46 +0100
Message-ID: <1554530.H35cUWvpSY@amdc1227>
References: <1359965482-29655-1-git-send-email-pgaikwad@nvidia.com>
 <5110C3E5.2010503@nvidia.com>
 <20130205.122252.570646990867457667.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20130205.122252.570646990867457667.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 05 of February 2013 11:22:52 Hiroshi Doyu wrote:
> Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote @ Tue, 5 Feb 2013 09:33:41 
+0100:
> > > The members of "clk_composite_ops" seems to be always assigned
> > > statically. Istead of dynamically allocating/assigning, can't we
> > > just
> > > have "clk_composite_ops" statically as below?
> > > 
> > > static struct clk_ops clk_composite_ops = {
> > > 
> > > 	.get_parent = clk_composite_get_parent;
> > > 	.set_parent = clk_composite_set_parent;
> > > 	.recalc_rate = clk_composite_recalc_rate;
> > > 	.round_rate = clk_composite_round_rate;
> > > 	.set_rate = clk_composite_set_rate;
> > > 	.is_enabled = clk_composite_is_enabled;
> > > 	.enable = clk_composite_enable;
> > > 	.disable = clk_composite_disable;
> > > 
> > > };
> > > 
> > > struct clk *clk_register_composite(struct device *dev, const char
> > > *name,> > 
> > > 		       const char **parent_names, int num_parents,
> > > 		       struct clk_hw *mux_hw, const struct clk_ops 
*mux_ops,
> > > 		       struct clk_hw *div_hw, const struct clk_ops 
*div_ops,
> > > 		       struct clk_hw *gate_hw, const struct clk_ops 
*gate_ops,
> > > 		       unsigned long flags)
> > > 
> > > {
> > > 
> > > 	.....
> > > 	
> > > 	init.ops = &clk_composite_ops;
> > 
> > No, clk_ops depends on the clocks you are using. There could be a
> > clock
> > with mux and gate while another one with mux and div.
> 
> You are right. What about the following? We don't have to have similar
> copy of clk_composite_ops for each instances.
> 
> diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
> index f30fb4b..8f88805 100644
> --- a/drivers/clk/clk-composite.c
> +++ b/drivers/clk/clk-composite.c
> @@ -27,6 +27,9 @@ static u8 clk_composite_get_parent(struct clk_hw *hw)
>         const struct clk_ops *mux_ops = composite->mux_ops;
>         struct clk_hw *mux_hw = composite->mux_hw;
> 
> +       if (!mux_hw->clk)
> +	       return -EINVAL;
> +

Or maybe even:

		if (!mux_ops)

This would be more self-explanatory and save one dereference.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
