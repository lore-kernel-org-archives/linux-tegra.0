From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 4/4] arm64: Add initial Tegra support
Date: Fri, 23 Jan 2015 17:00:00 +0100
Message-ID: <1422028800-759-4-git-send-email-thierry.reding@gmail.com>
References: <1422028800-759-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422028800-759-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 3568df3d31d62b4368830cc6aac868cecdefd187:

  soc: tegra: Add thermal reset (thermtrip) support to PMC (2015-01-23 16:20:49 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-3.20-arm64

for you to fetch changes up to d035fdfa27ac124bc8f94c3d7dc82ad069802170:

  arm64: Add Tegra132 support (2015-01-23 16:32:52 +0100)

As you can see by the shortlog below this depends on the tegra-for-3.20-soc
pull request to resolve build time dependencies.

Thanks,
Thierry

----------------------------------------------------------------
arm64: Add initial Tegra support

This adds support for the Tegra132 SoC, which is essentially a Tegra124
with a dual Denver CPU complex instead of the quad-Cortex-A15. There is
not much here, only the Kconfig entries, but it will allow us to more
easily get subsequent patches in (many of which have already been sent
for review).

----------------------------------------------------------------
Paul Walmsley (1):
      arm64: Add Tegra132 support

Thierry Reding (1):
      Merge branch 'for-3.20/soc' into for-3.20/arm64

 arch/arm64/Kconfig | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
