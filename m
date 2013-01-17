From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 2/9] clk: tegra: Add tegra specific clocks
Date: Thu, 17 Jan 2013 06:03:27 +0100
Message-ID: <20130117.070327.1625310713330263780.hdoyu@nvidia.com>
References: <1357890387-23245-3-git-send-email-pgaikwad@nvidia.com><20130116.171242.2189136612266237422.hdoyu@nvidia.com><50F7096C.7020803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50F7096C.7020803-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote @ Wed, 16 Jan 2013 21:11:24 +0100:

> >> +static int clk_frac_div_set_rate(struct clk_hw *hw, unsigned long rate,
> >> +                               unsigned long parent_rate)
> >> +{
> >> +       struct tegra_clk_frac_div *divider = to_clk_frac_div(hw);
> >> +       int div;
> >> +       unsigned long flags = 0;
> > 
> > nit, is "flags" not needed to initialize here?
> 
> It avoids a compiler warning; the compiler doesn't that the if condition
> that guards the path that uses flags is the same condition as the path
> that initializes it. Or, it may be related to the fact that
> spin_lock_irqsave() writes to the value through a pointer parameter, and
> the compiler doesn't know it's an out-only parameter.

It might be better to append the special comment /* GCC */[1] on that line.

[1] https://lwn.net/Articles/529954/
