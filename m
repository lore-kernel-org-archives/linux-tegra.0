From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 3/4] ARM: tegra: Device tree changes for v4.9-rc1
Date: Fri,  9 Sep 2016 17:20:31 +0200
Message-ID: <20160909152032.9550-3-thierry.reding@gmail.com>
References: <20160909152032.9550-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160909152032.9550-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.9-arm-dt

for you to fetch changes up to 7e9d474954f4c8c27534633252500e0c477581bd:

  ARM: tegra: Correct polarity for Tegra114 PMIC interrupt (2016-08-16 15:10:23 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v4.9-rc1

Contains a couple of cleanups for Tegra114 device trees.

----------------------------------------------------------------
Jon Hunter (1):
      ARM: tegra: Correct polarity for Tegra114 PMIC interrupt

Stephen Warren (1):
      ARM: tegra: Fix Tegra114 USB compatible values

 arch/arm/boot/dts/tegra114-dalmore.dts | 2 +-
 arch/arm/boot/dts/tegra114-roth.dts    | 2 +-
 arch/arm/boot/dts/tegra114-tn7.dts     | 2 +-
 arch/arm/boot/dts/tegra114.dtsi        | 8 ++++----
 4 files changed, 7 insertions(+), 7 deletions(-)
