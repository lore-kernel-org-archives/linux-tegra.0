From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL V2 4/7] ARM: tegra: for-3.6/dt branch
Date: Fri,  6 Jul 2012 12:47:59 -0600
Message-ID: <1341600482-11020-5-git-send-email-swarren@wwwdotorg.org>
References: <1341600482-11020-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1341600482-11020-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This branch contains changes to Tegra device tree files, and related Kconfig
and Makefile changes. Highlights are:

* New support for the Whistler board.
* Use of the I2C pinctrl-based bus mux on Seaboard/Springbank.

This branch is based on Tegra's for-3.6/cleanup branch from a previous pull
request.

This branch is not included in a later pull request.

Note that there will be a merge conflict between for-3.6/{dt,boards}. The
expected resolution may be found in branch for-3.6/merged-dt-boards.

----------------------------------------------------------------

The following changes since commit 702b0e4f2f2782962aab7d9a0a40ad68770bb1f6:

  ARM: dt: tegra: rename board files to match SoC

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-3.6/dt

for you to fetch changes up to 0879c5f72f0a3905d08081e8a2c38e69896b0d5e:

  ARM: dt: tegra seaboard: move battery monitor to mux'd I2C bus.

----------------------------------------------------------------

Stephen Warren (3):
      ARM: dt: tegra: add Whistler device tree file
      ARM: dt: tegra: seaboard: instantiate pinctrl-based I2C bus mux
      ARM: dt: tegra seaboard: move battery monitor to mux'd I2C bus.

 arch/arm/boot/dts/tegra20-seaboard.dts |   85 ++++++--
 arch/arm/boot/dts/tegra20-whistler.dts |  301 +++++++++++++++++++++++++++
 arch/arm/mach-tegra/Makefile.boot      |    1 +
 3 files changed, 371 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra20-whistler.dts
