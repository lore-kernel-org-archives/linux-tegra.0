From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] clk: define and export clk_debugs_add_file
Date: Wed, 02 Jul 2014 16:17:45 -0700
Message-ID: <20140702231745.7440.489@quantum>
References: <1403794853-16928-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403794853-16928-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Peter De Schrijver (2014-06-26 08:00:53)
> Define and export a new function clk_debugs_add_file which adds a file
> to a existing clock's debugfs directory. This can be used by clock
> providers to add debugfs entries which are not related to a specific clock
> type. Examples include the ability to measure the rate of a clock. It can
> also be used by modules to create new debugfs entries. This is useful if you
> want to expose features for testing which can potentially cause system
> instability such as allowing to change a clock's rate from userspace.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied to clk-next. If you have some useful examples of how you use
this in downstream kernels or in out-of-tree modules then it would be
great to post them to the list. Others might find them helpful.

Regards,
Mike

> 
> ---
> Changes in v3:
>  * export a function to create a new file in a clock's debugfs directory
>    instead of exposing the clock's debugfs dentry pointer
> 
> Changes in v2:
>  * fix function name in description
>  * export function in header file
> ---
>  drivers/clk/clk.c            |   12 ++++++++++++
>  include/linux/clk-provider.h |    5 +++++
>  2 files changed, 17 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 8b73ede..c1e2fab 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -403,6 +403,18 @@ static void clk_debug_reparent(struct clk *clk, struct clk *new_parent)
>                                 __func__, clk->name);
>  }
>  
> +struct dentry *clk_debugfs_add_file(struct clk *clk, char *name, umode_t mode,
> +                               void *data, const struct file_operations *fops)
> +{
> +       struct dentry *d = NULL;
> +
> +       if (clk->dentry)
> +               d = debugfs_create_file(name, mode, clk->dentry, data, fops);
> +
> +       return d;
> +}
> +EXPORT_SYMBOL_GPL(clk_debugfs_add_file);
> +
>  /**
>   * clk_debug_init - lazily create the debugfs clk tree visualization
>   *
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 0c287db..411dd7e 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -619,5 +619,10 @@ static inline void clk_writel(u32 val, u32 __iomem *reg)
>  
>  #endif /* platform dependent I/O accessors */
>  
> +#ifdef CONFIG_DEBUG_FS
> +struct dentry *clk_debugfs_add_file(struct clk *clk, char *name, umode_t mode,
> +                               void *data, const struct file_operations *fops);
> +#endif
> +
>  #endif /* CONFIG_COMMON_CLK */
>  #endif /* CLK_PROVIDER_H */
> -- 
> 1.7.7.rc0.72.g4b5ea.dirty
> 
