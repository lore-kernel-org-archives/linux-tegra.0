From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: disable SUSPEND/ARCH_SUSPEND_POSSIBLE for ARCH_TEGRA
Date: Mon, 30 Apr 2012 17:20:46 -0600
Message-ID: <4F9F1E4E.4020604@wwwdotorg.org>
References: <1335381650-7666-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335381650-7666-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/25/2012 01:20 PM, Stephen Warren wrote:
> Tegra doesn't yet support system sleep. Explicitly disable support
> for this feature in Kconfig.

Russell, Arnd, Olof, should this go through the ARM patch tracker, or
should I just take it through the Tegra tree? Thanks.

> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig

>  config ARCH_SUSPEND_POSSIBLE
> -	depends on !ARCH_S5PC100
> +	depends on !ARCH_S5PC100 && !ARCH_TEGRA
>  	depends on CPU_ARM920T || CPU_ARM926T || CPU_SA1100 || \
>  		CPU_V6 || CPU_V6K || CPU_V7 || CPU_XSC3 || CPU_XSCALE
>  	def_bool y
