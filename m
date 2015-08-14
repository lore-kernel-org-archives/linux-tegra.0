From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 9/9] ARM: tegra: Default configuration updates for v4.3-rc1
Date: Fri, 14 Aug 2015 16:48:40 +0200
Message-ID: <1439563720-13189-10-git-send-email-thierry.reding@gmail.com>
References: <1439563720-13189-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439563720-13189-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.3-defconfig

for you to fetch changes up to 258d9bc5e77fa40e290a0bd480d5349224374480:

  ARM: tegra: Update multi_v7_defconfig (2015-08-14 16:26:00 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration updates for v4.3-rc1

Enable the GK20A GPU (via the Nouveau driver) and CPU frequency scaling
on Tegra124.

----------------------------------------------------------------
Thierry Reding (1):
      ARM: tegra: Update multi_v7_defconfig

Tuomas Tynkkynen (1):
      ARM: tegra: Update default configuration

 arch/arm/configs/multi_v7_defconfig | 9 +++++++++
 arch/arm/configs/tegra_defconfig    | 9 ++-------
 2 files changed, 11 insertions(+), 7 deletions(-)
