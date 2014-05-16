From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 1/3] ARM: tegra: core code changes for 3.16
Date: Fri, 16 May 2014 12:25:44 -0600
Message-ID: <1400264746-13106-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This branch contains just a single patch this time around. Thierry
enhanced Tegra's restart code to allow programming PMC scratch registers
to request specific behaviour after reboot. One of the most useful
options for mainline software is the ability to reboot directly into USB
recovery mode, which e.g. allows the bootloader to be reflashed.

----------------------------------------------------------------

The following changes since commit c9eaa447e77efe77b7fa4c953bd62de8297fd6c5:

  Linux 3.15-rc1

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tegra-for-3.16-soc

for you to fetch changes up to 498bb3da7e04ed82d9b66106c4baeb3000a7100e:

  ARM: tegra: Support reboot modes

----------------------------------------------------------------

Thierry Reding (1):
      ARM: tegra: Support reboot modes

 arch/arm/mach-tegra/pmc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
