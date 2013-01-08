From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v2 9/9] ARM: tegra: Add initial support for Tegra 114 SoC.
Date: Tue, 08 Jan 2013 15:52:05 -0700
Message-ID: <50ECA315.5000703@wwwdotorg.org>
References: <1357649263-1098-1-git-send-email-hdoyu@nvidia.com> <1357649263-1098-10-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357649263-1098-10-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/08/2013 05:47 AM, Hiroshi Doyu wrote:
> Add new Tegra 114 SoC support.

> diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c

>  static const struct of_device_id tegra_dt_irq_match[] __initconst = {
>  	{ .compatible = "arm,cortex-a9-gic", .data = gic_of_init },
> +	{ .compatible = "arm,cortex-a15-gic", .data = gic_of_init },
>  	{ }
>  };

It'd probably be a good idea to add newer entries at the start of this
table. Not so much an issue here perhaps, but at least when
instantiating drivers, the earlier entries match first irrespective of
the order of compatible values in the DT node, due to a misfeature in
the kernel code, which while it's in the process of being fixed, we
probably still want to work around.
