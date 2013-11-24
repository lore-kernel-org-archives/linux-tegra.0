From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v11 0/7] ARM: support for the Trusted Foundations secure monitor
Date: Sun, 24 Nov 2013 15:30:45 +0900
Message-ID: <1385274652-16415-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Olof Johansson <olof@lixom.net>, Dave Martin <Dave.Martin@arm.com>, Kevin Hilman <khilman@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

New rebase that should be ready-to-apply on the latest Tegra tree. The last
remaining blocker is Russell's approval for this series and it is my hope to
obtain it with this version.

There has been quite some debate around this series, notably about the SMC
calling conventions and whether the firmware interface should be moved out of
arch/arm. I hope that all the questions have been answered and that we can move
forward with this series that enables NVIDIA-branded retail Tegra devices to run
mainline.

Changes since v10:
- Rebased on top of more recent sources since some files have been renamed in
  mach-tegra.
- Gave a final proof-read and extensive testing.

Alexandre Courbot (7):
  ARM: add basic support for Trusted Foundations
  of: add vendor prefix for Trusted Logic Mobility
  of: add Trusted Foundations bindings documentation
  ARM: tegra: add support for Trusted Foundations
  ARM: tegra: split setting of CPU reset handler
  ARM: tegra: set CPU reset handler using firmware
  ARM: tegra: support Trusted Foundations by default

 .../arm/firmware/tlm,trusted-foundations.txt       | 20 ++++++
 Documentation/devicetree/bindings/arm/tegra.txt    |  5 ++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm/Kconfig                                   |  2 +
 arch/arm/Makefile                                  |  1 +
 arch/arm/configs/tegra_defconfig                   |  1 +
 arch/arm/firmware/Kconfig                          | 28 ++++++++
 arch/arm/firmware/Makefile                         |  1 +
 arch/arm/firmware/trusted_foundations.c            | 81 ++++++++++++++++++++++
 arch/arm/include/asm/trusted_foundations.h         | 67 ++++++++++++++++++
 arch/arm/mach-tegra/Kconfig                        |  1 +
 arch/arm/mach-tegra/reset.c                        | 40 ++++++++---
 arch/arm/mach-tegra/tegra.c                        |  2 +
 13 files changed, 239 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/firmware/tlm,trusted-foundations.txt
 create mode 100644 arch/arm/firmware/Kconfig
 create mode 100644 arch/arm/firmware/Makefile
 create mode 100644 arch/arm/firmware/trusted_foundations.c
 create mode 100644 arch/arm/include/asm/trusted_foundations.h

-- 
1.8.4.2
