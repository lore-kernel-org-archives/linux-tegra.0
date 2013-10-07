From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 1/5] ARM: add basic support for Trusted Foundations
Date: Mon, 07 Oct 2013 11:16:59 -0700
Message-ID: <871u3xdjz8.fsf@linaro.org>
References: <1380904635-18113-1-git-send-email-acourbot@nvidia.com>
	<1380904635-18113-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380904635-18113-2-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
	(Alexandre Courbot's message of "Fri, 4 Oct 2013 09:37:11 -0700")
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> writes:

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
>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

[...]

> +void register_trusted_foundations(struct trusted_foundations_platform_data *pd)
> +{
> +	/* we are not using version information for now since currently
> +	 * supported SMCs are compatible with all TF releases */

nit: multi-line comment style...

[...]

> +static inline void register_trusted_foundations(
> +				   struct trusted_foundations_platform_data *pd)
> +{
> +	/* If we try to register TF, this means the system needs it to continue.
> +	 * Its absence if thus a fatal error. */

...and here...

> +	panic("No support for Trusted Foundations, stopping...\n");
> +}
> +
> +static inline void of_register_trusted_foundations(void)
> +{
> +	/* If we find the target should enable TF but does not support it,
> +	 * fail as the system won't be able to do much anyway */

...and here.

> +	if (of_find_compatible_node(NULL, NULL, "tl,trusted-foundations"))
> +		register_trusted_foundations(NULL);
> +}
> +#endif /* CONFIG_TRUSTED_FOUNDATIONS */
> +
> +#endif

Kevin
