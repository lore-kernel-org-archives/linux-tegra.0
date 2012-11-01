From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL] ARM: tegra: fixes for 3.7-rc4
Date: Thu,  1 Nov 2012 09:43:14 -0600
Message-ID: <1351784594-28982-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Here we have just a single fix for the Tegra30 pinctrl module's register
range size in device tre.

----------------------------------------------------------------

The following changes since commit 8f0d8163b50e01f398b14bcd4dc039ac5ab18d64:

  Linux 3.7-rc3

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.7-fixes-for-rc4

for you to fetch changes up to 322337b8fbd8c392246529d5db924820fc0c7381:

  ARM: dt: tegra: fix length of pad control and mux registers

----------------------------------------------------------------

Pritesh Raithatha (1):
      ARM: dt: tegra: fix length of pad control and mux registers

 arch/arm/boot/dts/tegra30.dtsi |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
