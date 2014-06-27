From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 3/5] clk: use struct clk only for external API
Date: Fri, 27 Jun 2014 16:37:45 -0600
Message-ID: <53ADF239.9050008@wwwdotorg.org>
References: <1403855872-14749-1-git-send-email-tomeu.vizoso@collabora.com> <1403855872-14749-4-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403855872-14749-4-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rabin Vincent <rabin.vincent-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/27/2014 01:57 AM, Tomeu Vizoso wrote:
> From: Rabin Vincent <rabin.vincent-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
> 
> In order to provide per-user accounting, this separates the struct clk
> used in the common clock framework into two structures 'struct clk_core'
> and 'struct clk'.  struct clk_core will be used for internal
> manipulation and struct clk will be used in the clock API
> implementation.
> 
> In this patch, struct clk is simply renamed to struct clk_core and a new
> struct clk is implemented which simply wraps it.  In the next patch, the
> new struct clk will be used to implement per-user clock enable
> accounting.

> diff --git a/include/linux/clk-private.h b/include/linux/clk-private.h

> -struct clk {
> +struct clk_core {
>  	const char		*name;
>  	const struct clk_ops	*ops;
>  	struct clk_hw		*hw;
>  	struct module		*owner;
> -	struct clk		*parent;
> +	struct clk_core		*parent;
>  	const char		**parent_names;
> -	struct clk		**parents;
> +	struct clk_core		**parents;
>  	u8			num_parents;
>  	u8			new_parent_index;
>  	unsigned long		rate;
>  	unsigned long		new_rate;
> -	struct clk		*new_parent;
> -	struct clk		*new_child;
> +	struct clk_core		*new_parent;
> +	struct clk_core		*new_child;
>  	unsigned long		flags;
>  	unsigned int		enable_count;
>  	unsigned int		prepare_count;
> @@ -55,6 +55,10 @@ struct clk {
>  	struct kref		ref;
>  };
>  
> +struct clk {
> +	struct clk_core clk;
> +};

I'm confused why that field isn't a pointer instead. Don't we want to
end up with the following data structure:

(dev a's) struct clk --------v
                           struct clk_core -----> struct clk_hw
(dev b's) struct clk --------^

Where all 3 arrows are pointers? (and struct clk_core probably contains
a list of the struct clk that point at it).

Otherwise, we end up creating a whole struct clk_core for each client.
