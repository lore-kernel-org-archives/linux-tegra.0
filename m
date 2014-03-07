From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 2/5] ARM: tegra: driver changes for 3.15
Date: Fri,  7 Mar 2014 13:28:05 -0700
Message-ID: <1394224088-28910-2-git-send-email-swarren@wwwdotorg.org>
References: <1394224088-28910-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394224088-28910-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A single cleanup for the Tegra AHB driver.

----------------------------------------------------------------

The following changes since commit 38dbfb59d1175ef458d006556061adeaa8751b72:

  Linus 3.14-rc1

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tegra-for-3.15-drivers

for you to fetch changes up to 3cb3316cf7e817c39289c9ce17dcce2fabebb086:

  drivers/amba: don't check resource with devm_ioremap_resource

----------------------------------------------------------------

Wolfram Sang (1):
      drivers/amba: don't check resource with devm_ioremap_resource

 drivers/amba/tegra-ahb.c | 2 --
 1 file changed, 2 deletions(-)
