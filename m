From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL V2 2/7] ARM: tegra: for-3.6/fixes branch
Date: Fri,  6 Jul 2012 12:47:57 -0600
Message-ID: <1341600482-11020-3-git-send-email-swarren@wwwdotorg.org>
References: <1341600482-11020-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1341600482-11020-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This branch contains various small bug-fixes to Tegra code.

This branch is based on Tegra's for-3.6/cleanup branch from a previous pull
request.

This branch is not included in a later pull request.

Note that there will be a merge conflict between for-3.6/{fixes,soc}. The
expected resolution may be found in branch for-3.6/merged-fixes-soc.

----------------------------------------------------------------

The following changes since commit 702b0e4f2f2782962aab7d9a0a40ad68770bb1f6:

  ARM: dt: tegra: rename board files to match SoC

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-3.6/fixes

for you to fetch changes up to 95ef9958849381931a79ecec53e677e52c406c5a:

  ARM: tegra: build powergate unconditionally

----------------------------------------------------------------

Roland Stigge (1):
      ARM: tegra: Fix dts files w/ status property: "disable" -> "disabled"

Wolfram Sang (1):
      ARM: tegra: build powergate unconditionally

 arch/arm/boot/dts/tegra20.dtsi |   36 ++++++++++++++++----------------
 arch/arm/boot/dts/tegra30.dtsi |   38 +++++++++++++++++-----------------
 arch/arm/mach-tegra/Makefile   |    2 +-
 3 files changed, 38 insertions(+), 38 deletions(-)
