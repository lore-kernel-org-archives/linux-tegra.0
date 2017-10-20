From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 5/7] ARM: tegra: Device tree changes for v4.15-rc1
Date: Fri, 20 Oct 2017 13:56:01 +0200
Message-ID: <20171020115603.9828-5-thierry.reding@gmail.com>
References: <20171020115603.9828-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171020115603.9828-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.15-arm-dt

for you to fetch changes up to 33dfb1e18d534c4b7509de2a68ef1baf83d9710f:

  ARM: tegra: Enable CEC support on Jetson TK1 (2017-10-19 11:45:14 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v4.15-rc1

Adds support for the CEC controller found on Tegra124 and enables it on
Tegra K1.

----------------------------------------------------------------
Hans Verkuil (2):
      ARM: tegra: Add CEC support for Tegra124
      ARM: tegra: Enable CEC support on Jetson TK1

 arch/arm/boot/dts/tegra124-jetson-tk1.dts |  4 ++++
 arch/arm/boot/dts/tegra124.dtsi           | 12 +++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)
