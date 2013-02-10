From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: enable ARCH_REQUIRE_GPIOLIB for Tegra114
Date: Sat, 9 Feb 2013 17:52:35 -0800
Message-ID: <20130210015235.GA25302@quad.lixom.net>
References: <1360273404-32397-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1360273404-32397-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 07, 2013 at 02:43:23PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> CONFIG_ARCH_TEGRA_114_SOC doesn't currently enable gpiolib, which causes
> numerous build problems building a Tegra kernel with only Tegra114
> enabled, and not Tegra20 or Tegra30. Enable ARCH_REQUIRE_GPIOLIB to
> solve this. However, all Tegra will use gpiolib, so select this option
> from ARCH_TEGRA rather than each individual ARCH_TEGRA_*_SOC, to
> prevent this problem for any future chips.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Olof, Arnd, These two patches can be applied on top of Tegra's previous
> tegra-for-3.9-soc-t114 branch.
> 
> I think this (coupled with Hiroshi's "ARM: tegra: Fix build error w/
> ARCH_TEGRA_114_SOC w/o ARCH_TEGRA_3x_SOC" is it for build failure fixes,
> although I'm queueing up a number of clock driver patches for which I'll
> send a pull request in the next few days.

Thanks, applied both to the tegra/t114 branch (together with the above
mentioned fix).


-Olof
