From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL] ARM: tegra defconfig branch
Date: Tue, 08 May 2012 12:43:52 -0600
Message-ID: <4FA96968.1040007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This is independent from the other pull requests. It mainly enables a
bunch of options for devices on Tegra boards.

P.S. Sorry if this git URL/branch are getting wrapped; they show up
unwrapped in my email client, and it's rewrapping it during the send
operation; I'm not sure how to fix that yet.

The following changes since commit e816b57a337ea3b755de72bec38c10c864f23015:
  Linus Torvalds (1):
        Linux 3.4-rc3

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
for-3.5/defconfig

Stephen Warren (1):
      ARM: tegra: update defconfig

 arch/arm/configs/tegra_defconfig |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)
