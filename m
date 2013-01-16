From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 2/9] clk: tegra: Add tegra specific clocks
Date: Wed, 16 Jan 2013 13:31:51 +0100
Message-ID: <20130116.143151.1531468192773974887.hdoyu@nvidia.com>
References: <1357890387-23245-1-git-send-email-pgaikwad@nvidia.com><1357890387-23245-3-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357890387-23245-3-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote @ Fri, 11 Jan 2013 08:46:20 +0100:
...
> +const struct clk_ops tegra_clk_periph_ops = {
> +       .get_parent = clk_periph_get_parent,
> +       .set_parent = clk_periph_set_parent,
> +       .recalc_rate = clk_periph_recalc_rate,
> +       .round_rate = clk_periph_round_rate,
> +       .set_rate = clk_periph_set_rate,
> +       .is_enabled = clk_periph_is_enabled,
> +       .enable = clk_periph_enable,
> +       .disable = clk_periph_disable,
> +};
> +
> +const struct clk_ops tegra_clk_periph_nodiv_ops = {
> +       .get_parent = clk_periph_get_parent,
> +       .set_parent = clk_periph_set_parent,
> +       .is_enabled = clk_periph_is_enabled,
> +       .enable = clk_periph_enable,
> +       .disable = clk_periph_disable,
> +};
> +
> +struct clk *tegra_clk_periph(const char *name, const char **parent_names,
> +                            int num_parents, struct tegra_clk_periph *periph,
> +                            void __iomem *clk_base, u32 offset)
> +{
> +       struct clk *clk;
> +       struct clk_init_data init;
> +
> +       init.name = name;
> +       init.ops = &tegra_clk_periph_ops;
> +       init.flags = 0;
> +       init.parent_names = parent_names;
> +       init.num_parents = num_parents;
> +
> +       periph->hw.init = &init;
> +       periph->magic = TEGRA_CLK_PERIPH_MAGIC;
> +       periph->mux.reg = clk_base + offset;
> +       periph->divider.reg = clk_base + offset;
> +       periph->gate.clk_base = clk_base;
> +
> +       clk = clk_register(NULL, &periph->hw);
> +       if (IS_ERR(clk))
> +               return clk;
> +
> +       periph->mux.hw.clk = clk;
> +       periph->divider.hw.clk = clk;
> +       periph->gate.hw.clk = clk;
> +
> +       return clk;
> +}
> +
> +struct clk *tegra_clk_periph_nodiv(const char *name, const char **parent_names,
> +                             int num_parents, struct tegra_clk_periph *periph,
> +                             void __iomem *clk_base, u32 offset)
> +{
> +       struct clk *clk;
> +       struct clk_init_data init;
> +
> +       init.name = name;
> +       init.ops = &tegra_clk_periph_nodiv_ops;
> +       init.flags = CLK_SET_RATE_PARENT;
> +       init.parent_names = parent_names;
> +       init.num_parents = num_parents;
> +
> +       periph->hw.init = &init;
> +       periph->magic = TEGRA_CLK_PERIPH_MAGIC;
> +       periph->mux.reg = clk_base + offset;
> +       periph->gate.clk_base = clk_base;
> +
> +       clk = clk_register(NULL, &periph->hw);
> +       if (IS_ERR(clk))
> +               return clk;
> +
> +       periph->mux.hw.clk = clk;
> +       periph->gate.hw.clk = clk;
> +
> +       return clk;
> +}

The above two functions are almost duplicate, can we take the common part from them?

const struct clk_ops tegra_clk_periph_nodiv_ops = {
       .get_parent = clk_periph_get_parent,
       .set_parent = clk_periph_set_parent,
       .is_enabled = clk_periph_is_enabled,
       .enable = clk_periph_enable,
       .disable = clk_periph_disable,
};

struct clk *__tegra_clk_periph(const char *name, const char **parent_names,
			    int num_parents, struct tegra_clk_periph *periph,
			    void __iomem *clk_base, u32 offset, int div)
{
       struct clk *clk;
       struct clk_init_data init;

       init.name = name;
       init.parent_names = parent_names;
       init.num_parents = num_parents;
       init.ops = div ? &tegra_clk_periph_ops : &tegra_clk_periph_nodiv_ops
       init.flags = div ? 0 :　CLK_SET_RATE_PARENT;

       periph->hw.init = &init;
       periph->magic = TEGRA_CLK_PERIPH_MAGIC;
       periph->mux.reg = clk_base + offset;
       periph->divider.reg = clk_base + offset;
       periph->gate.clk_base = clk_base;

       clk = clk_register(NULL, &periph->hw);
       if (IS_ERR(clk))
	       return clk;

       periph->mux.hw.clk = clk;
       periph->divider.hw.clk = div ? NULL : clk;
       periph->gate.hw.clk = clk;

       return clk;
}

static inline struct clk *tegra_clk_periph(const char *name, const char **parent_names,
			    int num_parents, struct tegra_clk_periph *periph,
			    void __iomem *clk_base, u32 offset)
{
	return __tegra_clk_periph(name, parent_names, num_parents, periph, clk_base, offset, 1);
}

static inline struct clk *tegra_clk_periph_nodiv(const char *name, const char **parent_names,
			     int num_parents, struct tegra_clk_periph *periph,
			     void __iomem *clk_base, u32 offset, )
{
	return __tegra_clk_periph(name, parent_names, num_parents, periph, clk_base, offset, 0);
}
