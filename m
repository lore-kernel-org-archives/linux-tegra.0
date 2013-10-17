From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [GIT PULL 3/6] ARM: tegra: core SoC support changes for 3.13
Date: Thu, 17 Oct 2013 16:01:26 -0700
Message-ID: <87ppr3y01l.fsf@linaro.org>
References: <1382036881-23339-1-git-send-email-swarren@wwwdotorg.org>
	<1382036881-23339-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382036881-23339-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
	(Stephen Warren's message of "Thu, 17 Oct 2013 13:07:58 -0600")
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> This branch includes:
> * SoC fuse values are used as device randomness at boot.
> * Initial support for the Tegra124 SoC is added. When coupled with an
>   appropriate clock driver, which should also be merged for 3.13, we are
>   able to boot to user-space using an initrd.
> * The powergate code gains support for Tegra114.
>
> This branch is based on previous pull request tegra-for-3.13-cleanup.

hmm, seems to actually be based on tegra-for-3.13-cleanup~1...

> ----------------------------------------------------------------
>
> The following changes since commit b6bda4e0d23815cb711c16085e03cb23c6d49f21:
>
>   ARM: tegra: fix ARCH_TEGRA_114_SOC select sort order

...which makes this look kinda strange since this branch isn't based on
that commit.

> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tegra-for-3.13-soc
>
> for you to fetch changes up to 8d25979dcd10479ebfb9ce01b3c824f4c7659f73:
>
>   ARM: tegra: Add Tegra114 powergate support
>
> ----------------------------------------------------------------

git figures it out and it all comes out in the wash when merging, but
makes looking at the merge history slightly confusing and the
dependencies not obvious.  

Any chance you can respin this branch on top of your cleanup branch that
I pulled so the merge points/branches and dependencies are obvious?

Thanks,

Kevin
