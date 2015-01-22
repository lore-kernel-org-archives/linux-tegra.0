From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2] clk: Introduce clk_has_parent()
Date: Wed, 21 Jan 2015 16:16:05 -0800
Message-ID: <54C04145.1010906@codeaurora.org>
References: <1421750935-4023-2-git-send-email-thierry.reding@gmail.com> <1421856780-32103-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421856780-32103-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/21/2015 08:13 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> This new function is similar to clk_set_parent(), except that it doesn't
> actually change the parent. It merely checks that the given parent clock
> can be a parent for the given clock.
>
> A situation where this is useful is to check that a particular setup is
> valid before switching to it. One specific use-case for this is atomic
> modesetting in the DRM framework where setting a mode is divided into a
> check phase where a given configuration is validated before applying
> changes to the hardware.
>
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

Reviewed-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

This will slightly conflict with Tomeu's  patches for per-user clock
constraints. It would be best if we can take this through the clk tree
to fix up any conflicts

> Changes in v2:
> - lookup parent name in parent names array and make function lockless
> - rename function from clk_try_parent() to clk_has_parent()
> - return boolean
>
>  drivers/clk/clk.c   | 30 ++++++++++++++++++++++++++++++
>  include/linux/clk.h | 17 +++++++++++++++++
>  2 files changed, 47 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index af06b7377d37..470266297dea 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1672,6 +1672,36 @@ void __clk_reparent(struct clk *clk, struct clk *new_parent)
>  }
>  
>  /**
> + * clk_has_parent - check if a clock is a possible parent for another
> + * @clk: clock source
> + * @parent: parent clock source
> + *
> + * This function can be used in drivers that need to check that a clock can be
> + * the parent of another without actually changing the parent.
> + *
> + * Returns true if @parent is a possible parent for @clk, false otherwise.
> + */
> +bool clk_has_parent(struct clk *clk, struct clk *parent)
> +{
> +	unsigned int i;
> +
> +	/* NULL clocks should be nops, so return success if either is NULL. */
> +	if (!clk || !parent)
> +		return true;
> +
> +	/* Optimize for the case where the parent is already the parent. */
> +	if (clk->parent == parent)
> +		return true;

I worry that we'll need to grab a lock here with Tomeu's patches, but
maybe I'm wrong.

> +
> +	for (i = 0; i < clk->num_parents; i++)
> +		if (strcmp(clk->parent_names[i], parent->name) == 0)
> +			return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(clk_has_parent);
> +
> +/**


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
