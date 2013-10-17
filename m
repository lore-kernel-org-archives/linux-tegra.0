From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [GIT PULL 2/6] ARM: tegra: cleanup for 3.13
Date: Thu, 17 Oct 2013 15:41:00 -0700
Message-ID: <87fvrzzfk3.fsf@linaro.org>
References: <1382036881-23339-1-git-send-email-swarren@wwwdotorg.org>
	<1382036881-23339-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382036881-23339-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
	(Stephen Warren's message of "Thu, 17 Oct 2013 13:07:57 -0600")
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> This branch mainly removes dead code and defines that were useful only
> when booting using board files. A few other misc cleanups are also
> included.
>
> This branch is based on previous pull request
> tegra-for-3.13-deps-for-arm-init-time-cleanup.
>
> ----------------------------------------------------------------
>
> The following changes since commit d2207071b3c74b144a860cbe6a46496a44963972:
>
>   ARM: tegra: split tegra_pmc_init() in two
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tegra-for-3.13-cleanup
>
> for you to fetch changes up to b6bda4e0d23815cb711c16085e03cb23c6d49f21:
>
>   ARM: tegra: fix ARCH_TEGRA_114_SOC select sort order
>
> ----------------------------------------------------------------

Pulled into next/cleanup.

Thanks,

Kevin
