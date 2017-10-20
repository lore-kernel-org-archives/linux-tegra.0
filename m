From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 7/7] arm64: tegra: Default configuration updates for v4.15-rc1
Date: Fri, 20 Oct 2017 13:56:03 +0200
Message-ID: <20171020115603.9828-7-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.15-arm64-defconfig

for you to fetch changes up to a9e6753c1c92ae7d2c0c99b420c5c7dd5ebfc37d:

  arm64: defconfig: Enable Tegra PCI controller (2017-10-19 10:24:16 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v4.15-rc1

This enables the PCI host controller on 64-bit ARM. It is supported and
enabled via device tree on Tegra210 and Tegra186.

----------------------------------------------------------------
Tuomas Tynkkynen (1):
      arm64: defconfig: Enable Tegra PCI controller

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
