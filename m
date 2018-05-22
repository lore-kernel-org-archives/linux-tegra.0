From: Stefan Agner <stefan@agner.ch>
Subject: [RESEND PATCH 0/5] mtd: rawnand: add NVIDIA Tegra NAND flash support
Date: Tue, 22 May 2018 14:07:04 +0200
Message-ID: <cover.1526990589.git.stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, mturquette@baylibre.com, sboyd@kernel.org
Cc: dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

[resending, this time with mailing lists in cc]

This picks up an older patchset written by Lucas Stach which
adds raw NAND flash support for Tegra 2.
http://lists.infradead.org/pipermail/linux-mtd/2015-November/063031.html

The driver has been reworked to implement the ->exec_op callback.
Some smaller changes and bug fixes have been applied too, but I did
not keep track of them. Since the original patchset has been posted
some years back already, I guess review needs to be done from scratch
anyway.

--
Stefan

Lucas Stach (4):
  mtd: rawnand: tegra: add devicetree binding
  clk: tegra20: init NDFLASH clock to sensible rate
  ARM: tegra: add Tegra20 NAND flash controller node
  ARM: tegra: enable NAND flash on Colibri T20

Stefan Agner (1):
  mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver

 .../bindings/mtd/nvidia,tegra20-nand.txt      |  29 +
 MAINTAINERS                                   |   7 +
 arch/arm/boot/dts/tegra20-colibri-512.dtsi    |   7 +
 arch/arm/boot/dts/tegra20.dtsi                |  13 +
 drivers/clk/tegra/clk-tegra20.c               |   1 +
 drivers/mtd/nand/raw/Kconfig                  |   6 +
 drivers/mtd/nand/raw/Makefile                 |   1 +
 drivers/mtd/nand/raw/tegra_nand.c             | 915 ++++++++++++++++++
 8 files changed, 979 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.txt
 create mode 100644 drivers/mtd/nand/raw/tegra_nand.c

-- 
2.17.0
