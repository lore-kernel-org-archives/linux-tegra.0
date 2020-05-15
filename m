From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 10/11] ARM: tegra: Device tree changes for v5.8-rc1
Date: Fri, 15 May 2020 16:53:10 +0200
Message-ID: <20200515145311.1580134-11-thierry.reding@gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200515145311.1580134-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-arm-dt

for you to fetch changes up to 94ea9681a9f5c7a72ae63c015e44a02530927b61:

  ARM: dts: tegra30: beaver: Add CPU Operating Performance Points (2020-05-06 19:02:40 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.8-rc1

This contains a bit of cleanup and CPU frequency scaling support for the
Tegra30 Beaver board.

----------------------------------------------------------------
Dmitry Osipenko (2):
      ARM: dts: tegra30: beaver: Set up voltage regulators for DVFS
      ARM: dts: tegra30: beaver: Add CPU Operating Performance Points

Rob Herring (1):
      ARM: tegra: Kill off "simple-panel" compatibles

 arch/arm/boot/dts/tegra114-dalmore.dts         |  3 +-
 arch/arm/boot/dts/tegra124-venice2.dts         |  2 +-
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts  |  2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts     |  2 +-
 arch/arm/boot/dts/tegra20-harmony.dts          |  2 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts      |  2 +-
 arch/arm/boot/dts/tegra20-paz00.dts            |  2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts         |  2 +-
 arch/arm/boot/dts/tegra20-ventana.dts          |  2 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts      |  2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts |  2 +-
 arch/arm/boot/dts/tegra30-beaver.dts           | 40 ++++++++++++++++++++++++--
 arch/arm/boot/dts/tegra30-cardhu.dtsi          |  2 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts  |  2 +-
 14 files changed, 50 insertions(+), 17 deletions(-)
