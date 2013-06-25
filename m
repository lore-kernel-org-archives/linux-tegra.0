From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix section mismatch in tegra_pmc_parse_dt
Date: Tue, 25 Jun 2013 11:17:28 -0700
Message-ID: <20130625181728.GE10694@quad.lixom.net>
References: <1371854347-12091-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371854347-12091-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 21, 2013 at 04:39:07PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> tegra_pmc_parse_dt() references __initconst data. Fix it to be __init.
> This matches its only usage; a call from tegra_pmc_init() which is
> already __init. This fixes:
> 
> WARNING: vmlinux.o(.text.unlikely+0x580): Section mismatch in reference
> from the function tegra_pmc_parse_dt() to the (unknown reference)
> .init.rodata:(unknown)
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

Applied to fixes-non-critical.


-Olof
