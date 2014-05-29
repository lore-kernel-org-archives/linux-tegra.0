From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v5 2/5] ARM: tegra: move fuse exports to tegra-soc.h
Date: Thu, 29 May 2014 13:01:06 -0600
Message-ID: <538783F2.9020901@wwwdotorg.org>
References: <1401281677-32110-1-git-send-email-pdeschrijver@nvidia.com> <1401281677-32110-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401281677-32110-3-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/28/2014 06:54 AM, Peter De Schrijver wrote:
> All fuse related functionality will move to a driver in the following patches.
> To prepare for this, export all the required functionality in a global header
> file and move all users of fuse.h to tegra-soc.h. While we're at it, remove
> tegra_bct_strapping, as its only user was removed in Commit a7cbe92cef27
> ("ARM: tegra: remove tegra EMC scaling driver").

> diff --git a/include/linux/tegra-soc.h b/include/linux/tegra-soc.h

> @@ -33,4 +54,8 @@ static inline int tegra_apb_writel_using_dma(u32 value, unsigned long offset)
>  	return -EINVAL;
>  }
>  #endif
> +
> +#endif /* __ASSEMBLY__ */
> +
> +
>  #endif /* __LINUX_TEGRA_SOC_H_ */

Nit: 2 blank lines there. I'll try and remember to fix that up when I
apply this, if nothing requires a repost.
