From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/6] ARM: tegra: export apb dma readl/writel
Date: Mon, 06 Jan 2014 13:07:26 -0700
Message-ID: <52CB0CFE.4070901@wwwdotorg.org>
References: <1387891931-9854-1-git-send-email-pdeschrijver@nvidia.com> <1387891931-9854-2-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387891931-9854-2-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/24/2013 06:32 AM, Peter De Schrijver wrote:
> Export APB DMA readl and writel. These are needed because we can't access
> the fuses directly on Tegra20 without potentially causing a system hang.

This does a lot more than just export the functions; it also changes the
prototypes. I'm not sure why the prototype change was required/useful.
This needs to be mentioned in the commit description/subject, and the
reasoning explained too.

> diff --git a/include/linux/tegra-soc.h b/include/linux/tegra-soc.h

> +#if defined(CONFIG_TEGRA20_APB_DMA)
> +void tegra_apb_io_init(void);

This seems to be an internal function; why is this one publicly
prototyped and/or stubbed?
