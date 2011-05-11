From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC 0/3] ARM: Tegra: Device Tree: i2c & wm8903
Date: Wed, 11 May 2011 16:26:29 -0700
Message-ID: <20110511231905.10362.12844.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is revision 2 of my previous patch series:
     Tegra: Harmony: Device Tree first steps

The following patch series is a step in the direction of getting board specific
devices initialized from a device tree.

This patch set adds intiailization of i2c and the wm8903. The i2c controller is
in the SoC and is initialized statically, but the board specific information is
pulled in from the device tree. The wm8903 is initialized using only the device
tree when using the board-dt.c general Tegra board initialization file.

---

John Bonesio (3):
      ARM: Tegra: Device Tree Support: Update how sdhci devices are initialized
      ARM: Tegra: Device Tree Support: Add i2c devices
      ARM:Tegra: Device Tree Support: Initialize from wm8903 the device tree


 arch/arm/boot/dts/tegra-harmony.dts |   37 ++++++++++++++
 arch/arm/boot/dts/tegra250.dtsi     |   37 ++++++++++++++
 arch/arm/mach-tegra/Makefile        |    1 
 arch/arm/mach-tegra/board-dt.c      |   94 ++++-------------------------------
 drivers/i2c/busses/i2c-tegra.c      |   16 ++++++
 sound/soc/codecs/wm8903.c           |   93 +++++++++++++++++++++++++++++++++--
 sound/soc/tegra/Kconfig             |    2 -
 sound/soc/tegra/harmony.c           |    8 +++
 8 files changed, 200 insertions(+), 88 deletions(-)

-- 
- John
