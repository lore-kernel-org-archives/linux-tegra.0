From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL] USB AUXDATA fix for tegra
Date: Wed, 21 Mar 2012 12:16:10 -0600
Message-ID: <4F6A1AEA.7070505@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Arnd,

This is my first pull request for Tegra; hopefully it all works out OK!

Note: Nobody has ack'd this change. I'm a maintainer for the files that
are touched, but I'm not sure if maintainers are supposed to have
another maintainer ack the change before committing it and sending a
pull request (in particular for their own changes), or if it's up to
their discretion?

The following changes since commit c16fa4f2ad19908a47c63d8fa436a1178438c7e7:
  Linus Torvalds (1):
        Linux 3.3

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
for-3.4/fixes-for-rc1-and-v3.3

Stephen Warren (1):
      ARM: tegra: Fix device tree AUXDATA for USB/EHCI

 arch/arm/mach-tegra/board-dt-tegra20.c |    6 +++---
 arch/arm/mach-tegra/devices.c          |    7 +++----
 arch/arm/mach-tegra/devices.h          |    5 +++++
 3 files changed, 11 insertions(+), 7 deletions(-)
