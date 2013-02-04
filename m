From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: Re: [PATCH V2] clk: Add composite clock type
Date: Mon, 4 Feb 2013 10:37:39 +0100
Message-ID: <20130204.113739.2227266298512077917.hdoyu@nvidia.com>
References: <1359965482-29655-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1359965482-29655-1-git-send-email-pgaikwad@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: "mturquette@linaro.org" <mturquette@linaro.org>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Prashant,

Prashant Gaikwad <pgaikwad@nvidia.com> wrote @ Mon, 4 Feb 2013 09:11:22 +0100:

> +struct clk *clk_register_composite(struct device *dev, const char *name,
> +                       const char **parent_names, int num_parents,
> +                       struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
> +                       struct clk_hw *div_hw, const struct clk_ops *div_ops,
> +                       struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
> +                       unsigned long flags)
> +{
> +       struct clk *clk;
> +       struct clk_init_data init;
> +       struct clk_composite *composite;
> +       struct clk_ops *clk_composite_ops;
> +
> +       composite = kzalloc(sizeof(*composite), GFP_KERNEL);
> +       if (!composite) {
> +               pr_err("%s: could not allocate composite clk\n", __func__);
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       init.name = name;
> +       init.flags = flags | CLK_IS_BASIC;
> +       init.parent_names = parent_names;
> +       init.num_parents = num_parents;
> +
> +       /* allocate the clock ops */
> +       clk_composite_ops = kzalloc(sizeof(*clk_composite_ops), GFP_KERNEL);

The members of "clk_composite_ops" seems to be always assigned
statically. Istead of dynamically allocating/assigning, can't we just
have "clk_composite_ops" statically as below?

static struct clk_ops clk_composite_ops = {
	.get_parent = clk_composite_get_parent;
	.set_parent = clk_composite_set_parent;
	.recalc_rate = clk_composite_recalc_rate;
	.round_rate = clk_composite_round_rate;
	.set_rate = clk_composite_set_rate;
	.is_enabled = clk_composite_is_enabled;
	.enable = clk_composite_enable;
	.disable = clk_composite_disable;
};

struct clk *clk_register_composite(struct device *dev, const char *name,
		       const char **parent_names, int num_parents,
		       struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
		       struct clk_hw *div_hw, const struct clk_ops *div_ops,
		       struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
		       unsigned long flags)
{
	.....

	init.ops = &clk_composite_ops;
