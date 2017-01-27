From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 4/4] arm64: tegra: Device tree changes for v4.11-rc1
Date: Fri, 27 Jan 2017 10:21:21 +0100
Message-ID: <20170127092121.21570-4-thierry.reding@gmail.com>
References: <20170127092121.21570-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170127092121.21570-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 0c744ea4f77d72b3dcebb7a8f2684633ec79be88:

  Linux 4.10-rc2 (2017-01-01 14:31:53 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.11-arm64-dt

for you to fetch changes up to 7bcf266462da736ae4b42d5c73cd5dc0da540772:

  arm64: tegra: Use symbolic reset identifiers (2017-01-27 10:13:24 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v4.11-rc1

This contains three patches that reintroduce symbolic identifiers for
clocks, resets and mailboxes. These had been converted to literals in
the v4.10 release to avoid complicated dependencies between branches.

----------------------------------------------------------------
Thierry Reding (3):
      arm64: tegra: Use symbolic HSP identifiers
      arm64: tegra: Use symbolic clock identifiers
      arm64: tegra: Use symbolic reset identifiers

 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 86 +++++++++++++++++---------------
 1 file changed, 45 insertions(+), 41 deletions(-)
