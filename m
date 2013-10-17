From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [GIT PULL 5/6] ARM: tegra: defconfig updates for 3.13
Date: Thu, 17 Oct 2013 16:08:34 -0700
Message-ID: <87hacfxzpp.fsf@linaro.org>
References: <1382036881-23339-1-git-send-email-swarren@wwwdotorg.org>
	<1382036881-23339-5-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382036881-23339-5-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
	(Stephen Warren's message of "Thu, 17 Oct 2013 13:08:00 -0600")
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> Various config options are enabled:
>
> ARCH_TEGRA_124_SOC: Tegra124 SoC support.
> CPU_FREQ_STAT_DETAILS: Enables various sysfs files that are useful when
>     testing cpufreq.
> CONFIG_COMMON_CLK_DEBUG: Useful to look at the clock tree to verify that
>     clocks for the various devices have been properly set up.
> PINCTRL_PALMAS: Used on Dalmore board.
> NEON: Enables SIMD instruction support for Tegra30 and later SoCs.
>
> This branch is based on v3.12-rc1.
>
> ----------------------------------------------------------------
>
> The following changes since commit 272b98c6455f00884f0350f775c5342358ebb73f:
>
>   Linux 3.12-rc1
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tegra-for-3.13-defconfig
>
> for you to fetch changes up to 83c6ca532152806122b8b074a9128299a5cf57c9:
>
>   ARM: tegra: defconfig updates
>
> ----------------------------------------------------------------

Pulled into next/boards.

Thanks,

Kevin
