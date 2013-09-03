From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 1/5] ARM: add basic Trusted Foundations support
Date: Tue, 03 Sep 2013 12:40:20 -0600
Message-ID: <52262D14.4000907@wwwdotorg.org>
References: <1377770268-14014-1-git-send-email-acourbot@nvidia.com> <1377770268-14014-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377770268-14014-2-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/29/2013 03:57 AM, Alexandre Courbot wrote:
> Trusted Foundations is a TrustZone-based secure monitor for ARM that
> can be invoked  using a consistent smc-based API on all supported

Nit: s/smc/SMC/?

> diff --git a/arch/arm/include/asm/trusted_foundations.h b/arch/arm/include/asm/trusted_foundations.h

> +#if IS_ENABLED(CONFIG_TRUSTED_FOUNDATIONS)
> +
> +void register_trusted_foundations(struct trusted_foundations_platform_data *pd);
> +void of_register_trusted_foundations(void);
> +
> +#else
> +
> +static inline void register_trusted_foundations(
> +				   struct trusted_foundations_platform_data *pd)
> +{
> +	pr_crit("No support for Trusted Foundations, stopping...\n");
> +	BUG();
> +}
> +
> +static inline void of_register_trusted_foundations(void)
> +{
> +	register_trusted_foundations(NULL);

That will cause a hard-fail. I assume that should only happen if the TL
DT node is present; if there's no DT node, it's fine for a kernel
without any TL support to run.

> +}
> +
> +#endif /* IS_ENABLED(CONFIG_TRUSTED_FOUNDATIONS) */
