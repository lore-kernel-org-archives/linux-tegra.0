From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 1/5] ARM: add basic support for Trusted Foundations
Date: Thu, 19 Sep 2013 13:49:31 -0700
Message-ID: <87d2o4edus.fsf@linaro.org>
References: <1379238028-7960-1-git-send-email-acourbot@nvidia.com>
	<1379238028-7960-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379238028-7960-2-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> (Alexandre
	Courbot's message of "Sun, 15 Sep 2013 18:40:24 +0900")
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> writes:

> Trusted Foundations is a TrustZone-based secure monitor for ARM that
> can be invoked using the same SMC-based API on all supported
> platforms. This patch adds initial basic support for Trusted
> Foundations using the ARM firmware API. Current features are limited
> to the ability to boot secondary processors.

[...]

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
> +
> +	err = of_property_read_u32(node, "version-major", &pdata.version_major);
> +	if (err != 0)
> +		panic("Trusted Foundation: missing version-major property\n");

Do really need to panic() the whole kernel for a missing property?
Surely this can more gracefully recover, or assume some defaults?  

Same comment for the other uses of panic() in this patch.

Kevin
