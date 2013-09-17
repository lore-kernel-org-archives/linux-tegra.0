From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/7] ARM: tegra: various misc cleanups
Date: Tue, 17 Sep 2013 14:05:12 -0600
Message-ID: <5238B5F8.4010908@wwwdotorg.org>
References: <1379096711-26875-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379096711-26875-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/13/2013 12:25 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> A bunch of cleanups for arch/arm/mach-tegra, mostly just deleting
> stale code.
> 
> Stephen Warren (7):
>   ARM: tegra: remove common.c
>   ARM: tegra: delete stale header content
>   ARM: tegra: delete gpio-names.h
>   ARM: tegra: move resume vector define to irammap.h
>   ARM: tegra: remove much of iomap.h
>   ARM: tegra: remove tegra_chip_uid()
>   ARM: tegra: make tegra_init_fuse() __init

I've applied this series, excluding patch 6 which I expect to go through
the crypto tree along with the patch it depends on, to Tegra's
for-3.13/cleanup branch.
