From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 09/10] ARM: tegra: defconfig updates
Date: Fri, 14 Sep 2012 14:06:20 -0600
Message-ID: <1347653181-19936-9-git-send-email-swarren@wwwdotorg.org>
References: <1347653181-19936-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1347653181-19936-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This branch updates tegra_defconfig mainly to enable new features that
were either implemented in this kernel release, previously missing, or
recently determined to be useful.

The config entries for explicit board support are now removed, since
Tegra now only supports booting from device tree.

This branch is based on v3.6-rc4.

----------------------------------------------------------------

The following changes since commit 4cbe5a555fa58a79b6ecbb6c531b8bab0650778d:

  Linux 3.6-rc4

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.7-defconfig

for you to fetch changes up to 9df25ccc937525206906c2b546998e5e3062c59b:

  ARM: tegra: defconfig updates

----------------------------------------------------------------

Stephen Warren (1):
      ARM: tegra: defconfig updates

 arch/arm/configs/tegra_defconfig |   51 +++++++++++++++++++++++++++------
 1 files changed, 42 insertions(+), 9 deletions(-)
