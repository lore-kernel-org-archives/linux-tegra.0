From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 01/36] clk: Introduce clk_try_parent()
Date: Tue, 20 Jan 2015 11:21:24 -0800
Message-ID: <54BEAAB4.9030803@codeaurora.org>
References: <1421750935-4023-1-git-send-email-thierry.reding@gmail.com> <1421750935-4023-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421750935-4023-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/20/2015 02:48 AM, Thierry Reding wrote:
>  
>  /**
> + * clk_try_parent - check if a clock can be the parent clock source of another
> + * @clk: clock source
> + * @parent: parent clock source
> + *
> + * This is like clk_set_parent(), except that it only checks that parent can
> + * be the parent clock source for clock.
> + *
> + * Returns success (0) or negative errno.
> + */
> +int clk_try_parent(struct clk *clk, struct clk *parent)
> +{
> +	int err = 0;
> +
> +	if (!clk || !parent)
> +		return -EINVAL;

NULL clock should be a nop, so return success in either case.

> +
> +	if ((clk->num_parents > 1) && !clk->ops->set_parent)
> +		return -ENOSYS;

This suffers from the same problem as discussed in another thread where
the mux is read-only and the parent is the current parent. That case
shouldn't fail.

> +
> +	clk_prepare_lock();
> +
> +	if (clk->parent == parent)
> +		goto unlock;
> +
> +	err = clk_fetch_parent_index(clk, parent);
> +	if (err > 0)
> +		err = 0;
> +

Given that we just throw away the index, perhaps we should just loop
over the parent_names array searching for a name match on the parent's
name. If we did that this entire function would be lockless too.

> +unlock:
> +	clk_prepare_unlock();
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(clk_try_parent);
> +
> +/**
>   * clk_set_parent - switch the parent of a mux clk
>   * @clk: the mux clk whose input we are switching
>   * @parent: the new input to clk
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index fb1ac65f127c..94da8c68a515 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -328,6 +328,15 @@ long clk_round_rate(struct clk *clk, unsigned long rate);
>  int clk_set_rate(struct clk *clk, unsigned long rate);
>  
>  /**
> + * clk_try_parent - check if a clock can be the parent clock source of another
> + * @clk: clock source
> + * @parent: parent clock source
> + *
> + * Returns success (0) or negative errno.

Why not a bool? Do we really care why we can't set the parent in the
error case?

> + */
> +int clk_try_parent(struct clk *clk, struct clk *parent);

The name makes me think of mutex_trylock(), so I immediately think this
tries to set the parent. Perhaps a better name would be
clk_can_have_parent() or clk_has_parent()?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
