From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 10/10] ARM: tegra: defconfig changes
Date: Mon, 16 Dec 2013 15:10:12 -0700
Message-ID: <1387231812-5701-10-git-send-email-swarren@wwwdotorg.org>
References: <1387231812-5701-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387231812-5701-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable new features required by the Venice2 board.

This branch is based on v3.13-rc1, and shouldn't cause any conflicts.

----------------------------------------------------------------

The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:

  Linux 3.13-rc1

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tegra-for-3.14-defconfig

for you to fetch changes up to 0d8c67218cef8af259e4d12221434a1d7b0f3bbc:

  ARM: tegra: tegra_defconfig updates

----------------------------------------------------------------

Stephen Warren (1):
      ARM: tegra: tegra_defconfig updates

 arch/arm/configs/tegra_defconfig | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)
