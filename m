From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [GIT PULL 1/6] ARM: tegra: dependencies for ARM .init_time cleanup
Date: Thu, 17 Oct 2013 15:42:16 -0700
Message-ID: <878uxrzfhz.fsf@linaro.org>
References: <1382036881-23339-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382036881-23339-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
	(Stephen Warren's message of "Thu, 17 Oct 2013 13:07:56 -0600")
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> This patch is a dependency for Sebastian Hesselbarth's series that
> cleans up the ARM machine descriptor's .init_time hook. It may also end
> up being a dependency for cleanup/development in the Tegra tree, and
> hence is contained in its own topic branch, to allow conflicts to be
> easily resolved.
>
> ----------------------------------------------------------------
>
> The following changes since commit 272b98c6455f00884f0350f775c5342358ebb73f:
>
>   Linux 3.12-rc1
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tegra-for-3.13-deps-for-arm-init-time-cleanup
>
> for you to fetch changes up to d2207071b3c74b144a860cbe6a46496a44963972:
>
>   ARM: tegra: split tegra_pmc_init() in two
>
> ----------------------------------------------------------------

This one is already part of next/cleanup due to pulling in Sebastian's
branch, so consider it applied.

Kevin
