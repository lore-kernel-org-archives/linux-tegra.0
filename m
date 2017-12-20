From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 4/5] ARM: tegra: Device tree changes for v4.16-rc1
Date: Wed, 20 Dec 2017 20:18:59 +0100
Message-ID: <20171220191900.757-4-thierry.reding@gmail.com>
References: <20171220191900.757-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220191900.757-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.16-arm-dt

for you to fetch changes up to bb768f28b29e7c72875d8521e2d5b09337561365:

  ARM: tegra: Add video decoder on Tegra20 (2017-12-20 19:57:20 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v4.16-rc1

These changes enable the video decoder engine found on Tegra20 SoCs.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra: Add video decoder on Tegra20

Vladimir Zapolskiy (1):
      ARM: tegra: Add device tree node to describe IRAM on Tegra20

 arch/arm/boot/dts/tegra20.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
