From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/4] clk: tegra: override bits for Tegra114 PLLM
Date: Wed, 05 Jun 2013 09:57:02 -0600
Message-ID: <51AF5FCE.6090501@wwwdotorg.org>
References: <1370441329-8619-1-git-send-email-pdeschrijver@nvidia.com> <1370441329-8619-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370441329-8619-3-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/05/2013 08:08 AM, Peter De Schrijver wrote:

Commit description?

> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk=
-tegra114.c

> +#ifdef CONFIG_PM_SLEEP
> +static struct cpu_clk_suspend_context {
> +	u32 clk_csite_src;
> +} tegra114_cpu_clk_sctx;
> +#endif

That generates:

drivers/clk/tegra/clk-tegra114.c:263:3: warning: =91tegra114_cpu_clk_sc=
tx=92
defined but not used [-Wunused-variable]
