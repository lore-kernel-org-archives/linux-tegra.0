From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [GIT PULL 1/4] ARM: tegra: cleanups for 3.12
Date: Tue, 20 Aug 2013 16:42:20 -0700
Message-ID: <87haekj5er.fsf@kernel.org>
References: <1376673628-5867-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376673628-5867-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> (Stephen
	Warren's message of "Fri, 16 Aug 2013 11:20:25 -0600")
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> This branch includes a single cleanup patch which removes redundant
> error-handling for platform_get_resource().
>
> ----------------------------------------------------------------
>
> The following changes since commit ad81f0545ef01ea651886dddac4bef6cec930092:
>
>   Linux 3.11-rc1
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.12-cleanup
>
> for you to fetch changes up to 946a88df76a2c5a9f4087fb41efd9d2763872302:
>
>   tegra: simplify use of devm_ioremap_resource

Pulled into next/cleanup.

Kevin
