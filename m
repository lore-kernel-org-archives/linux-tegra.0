From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 7/8] arm64: tegra: Device tree changes for v5.6-rc1
Date: Sat, 11 Jan 2020 01:35:52 +0100
Message-ID: <20200111003553.2411874-7-thierry.reding@gmail.com>
References: <20200111003553.2411874-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200111003553.2411874-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-arm64-dt

for you to fetch changes up to f41f34ddcee679641ff7d177b37597844d82d634:

  arm64: tegra: Allow bootloader to configure Ethernet MAC on Jetson TX2 (2020-01-10 17:04:29 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.6-rc1

These patches do some cleanup to existing nodes, add the memory
subsystem on Tegra186 and Tegra194 as well as the FUSE and APB MISC
nodes on Tegra194. There are also a few additions to the Jetson Nano
device tree to enable additional features and the force recovery
button on the Jetson AGX Xavier now produces a key code that is
actually valid. Finally, an alias is added for the Ethernet card on
Jetson TX2 to allow firmware to find it and pass a MAC address via
device tree.

----------------------------------------------------------------
JC Kuo (1):
      arm64: tegra: Add fuse/apbmisc node on Tegra194

Peter Robinson (1):
      arm64: tegra: Allow bootloader to configure Ethernet MAC on Jetson TX2

Tamás Szűcs (2):
      arm64: tegra: Enable PWM fan on Jetson Nano
      arm64: tegra: Enable SDIO on Jetson Nano M.2 Key E

Thierry Reding (7):
      arm64: tegra: Let the EMC hardware use the EMC clock
      arm64: tegra: Rename EMC on Tegra132
      arm64: tegra: Add interrupt for memory controller on Tegra186
      arm64: tegra: Add external memory controller on Tegra186
      arm64: tegra: Add the memory subsystem on Tegra194
      arm64: tegra: Make XUSB node consistent with the rest
      arm64: tegra: Redefine force recovery key on Jetson AGX Xavier

 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |  4 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |  1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 34 +++++++---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  4 ++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 56 +++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 73 ++++++++++++++++++++++
 7 files changed, 164 insertions(+), 10 deletions(-)
