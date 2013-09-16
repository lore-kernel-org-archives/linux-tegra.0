From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v6 1/5] ARM: add basic support for Trusted Foundations
Date: Mon, 16 Sep 2013 10:50:38 -0600
Message-ID: <523736DE.1050201@wwwdotorg.org>
References: <1379238028-7960-1-git-send-email-acourbot@nvidia.com> <1379238028-7960-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379238028-7960-2-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/15/2013 03:40 AM, Alexandre Courbot wrote:
> Trusted Foundations is a TrustZone-based secure monitor for ARM that
> can be invoked using the same SMC-based API on all supported
> platforms. This patch adds initial basic support for Trusted
> Foundations using the ARM firmware API. Current features are limited
> to the ability to boot secondary processors.
> 
> Note: The API followed by Trusted Foundations does *not* follow the SMC
> calling conventions. It has nothing to do with PSCI neither and is only
> relevant to devices that use Trusted Foundations (like most Tegra-based
> retail devices).

> diff --git a/arch/arm/firmware/trusted_foundations.c b/arch/arm/firmware/trusted_foundations.c

> +#if IS_ENABLED(CONFIG_OF)
> +void of_register_trusted_foundations(void)
> +{
> +	struct device_node *node;
> +	struct trusted_foundations_platform_data pdata;
> +	int err;
> +
> +	node = of_find_compatible_node(NULL, NULL, "tl,trusted-foundations");
> +	if (!node)
> +		return;
...

> diff --git a/arch/arm/include/asm/trusted_foundations.h b/arch/arm/include/asm/trusted_foundations.h

> +#if IS_ENABLED(CONFIG_TRUSTED_FOUNDATIONS)
> +void register_trusted_foundations(struct trusted_foundations_platform_data *pd);
> +#if IS_ENABLED(CONFIG_OF)
> +void of_register_trusted_foundations(void);
> +#endif

I still don't think that's correct.

If TF support is enabled, yet DT support is not enabled, then there is
no prototype, implementation, or dummy implementation for
of_register_trusted_foundations(). I think there should be a dummy
implementation in this case, shouldn't there?

> +
> +#else /* CONFIG_TRUSTED_FOUNDATIONS */
> +
> +#include <linux/printk.h>
> +#include <linux/of.h>
> +#include <asm/bug.h>
> +
> +static inline void register_trusted_foundations(
> +				   struct trusted_foundations_platform_data *pd)
> +{
> +	panic("No support for Trusted Foundations, stopping...\n");
> +}
> +
> +#if IS_ENABLED(CONFIG_OF)
> +static inline void of_register_trusted_foundations(void)
> +{
> +	/* If we find the target should enable TF but does not support it,
> +	 * fail as the system won't be able to do much anyway */
> +	if (of_find_compatible_node(NULL, NULL, "tl,trusted-foundations"))
> +		register_trusted_foundations(NULL);
> +}
> +#else
> +static inline void of_register_trusted_foundations(void)
> +{
> +}
> +#endif /* CONFIG_OF */

That's more complex than it needs to be; there is a dummy
of_find_compatible_node() in the !OF case, so you don't need to ifdef
the implementation of of_register_trusted_foundations(); you just need
the first implementation here.

> +#endif /* CONFIG_TRUSTED_FOUNDATIONS */

In summary, I think you need:

If TF is enabled, always implement of_register_trusted_foundations() in
the C file, and rely on of_find_compatible_node() to return NULL if
!CONFIG_OF.

If TF is not enabled, implement the inline version in the header file,
and again rely on of_find_compatible_node() to return NULL if !CONFIG_OF.

Unless I'm missing something!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
